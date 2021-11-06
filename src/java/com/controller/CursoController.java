/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entities.Curso;
import com.model.CursoModel;
import com.model.ProveedorModel;
import com.model.RolModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Controller
@RequestMapping("cursos")
public class CursoController {
    CursoModel cursoModel = new CursoModel();
    RolModel rolModel = new RolModel();
    ProveedorModel proveedorModel = new ProveedorModel();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    @RequestMapping(value={"list"})
    public String listarCurso(Model model){
        
        model.addAttribute("listarCursos",cursoModel.listarCursos());
        model.addAttribute("listarRoles",rolModel.listarRoles());//Este aqui no te sirve de nada
        model.addAttribute("listarProveedores",proveedorModel.listarProveedores());
        model.addAttribute("curso",new Curso());
        return "cursos/listar";
    }
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    public String insertarCurso(@ModelAttribute("curso")Curso curso, Model model,RedirectAttributes atributos){
        model.addAttribute("listarCurso",cursoModel.listarCursos());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        model.addAttribute("listarProveedores",proveedorModel.listarProveedores());
        //curso.setPassword(passwordEncoder.encode(curso.getPassword()));
        if(cursoModel.insertarCurso(curso)>0){
            atributos.addFlashAttribute("Exito","Curso registrado con exito");
            return "redirect:/cursos/list/";
        }
        else{
            model.addAttribute("curso",curso);
            return "cursos/listar";
        }
        
    }
       @RequestMapping(value="edit/{codigo}",method = RequestMethod.GET)
    public String obtenerCurso(@PathVariable("codigo")String codigo, Model model){
        
        model.addAttribute("curso",cursoModel.obtenerCurso(codigo));  
        model.addAttribute("listarCursos",cursoModel.listarCursos());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        model.addAttribute("listarProveedores",proveedorModel.listarProveedores());
        return "cursos/listar";
    }
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.POST)
    public String modificarCurso(Curso usuario, Model model,RedirectAttributes atributos){
        model.addAttribute("listarCursos",cursoModel.listarCursos());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        model.addAttribute("listarProveedores",proveedorModel.listarProveedores());
        //usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
        if(cursoModel.modificarCurso(usuario)>0){
            atributos.addFlashAttribute("Exito","Curso modificado con exito");
            return "redirect:/cursos/list/";
        }
        else{
            model.addAttribute("usuario",usuario);
            return "cursos/listar";
        }
        
    }
    @RequestMapping(value={"eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarCurso(@PathVariable("codigo") String codigo ,Model model,RedirectAttributes atributos){
        if(cursoModel.eliminarCurso(codigo)>0){
            atributos.addFlashAttribute("Exito","Curso eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
         return "redirect:/cursos/list/";
    }    
}
