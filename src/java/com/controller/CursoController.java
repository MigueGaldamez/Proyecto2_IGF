/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entities.Usuario;
import com.entities.Curso;
import com.entities.Presupuesto;
import com.model.CursoModel;
import com.model.ProgramasModel;
import com.model.ProveedorModel;
import com.model.LocalModel;
import com.model.RolModel;
import java.util.Date;
import javax.servlet.http.HttpSession;
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
    ProgramasModel programaModel = new ProgramasModel();
    LocalModel localModel = new LocalModel();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    Usuario user = new Usuario();
    
    @RequestMapping(value={"list"})
    public String listarCurso(Model model, HttpSession session){
        
        if (session.getAttribute("usr") == null){
            return "redirect:/";
        } else {
            user = (Usuario) session.getAttribute("usr");
            String rol = user.getRol().getNombreRol();
            if (rol.equals("Administrador")){
                model.addAttribute("listarCursos",cursoModel.listarCursos());
                model.addAttribute("listarRoles",rolModel.listarRoles());//Este aqui no te sirve de nada
                model.addAttribute("listarProveedores",proveedorModel.listarProveedores());
                model.addAttribute("listarProgramas",programaModel.listarProgramas());
                model.addAttribute("listarLocales",localModel.listarLocales());
                model.addAttribute("curso",new Curso());
                return "cursos/listar";
            }  else {
                return "redirect:/";
            }
        }
    }
    
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    public String insertarCurso(@ModelAttribute("curso")Curso curso, Model model,RedirectAttributes atributos){
        model.addAttribute("listarCurso",cursoModel.listarCursos());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        model.addAttribute("listarProveedores",proveedorModel.listarProveedores());
        model.addAttribute("listarProgramas",programaModel.listarProgramas());
        model.addAttribute("listarLocales",localModel.listarLocales());
        //curso.setPassword(passwordEncoder.encode(curso.getPassword()));
        if(cursoModel.insertarCurso(curso)>0){
            
            int idCursoMax = cursoModel.obtenerCursoMax();
            Curso cur = cursoModel.obtenerCurso(String.valueOf(idCursoMax));
            Presupuesto pres = new Presupuesto();
            pres.setCurso(cur);
            pres.setFechaCreacion(new Date());
            
            if(cursoModel.insertarPresupuesto(pres)>0){
                atributos.addFlashAttribute("Exito","Curso registrado con exito");
                return "redirect:/cursos/list/";
            } else {
                model.addAttribute("curso",curso);
                return "cursos/listar";
            }
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
        model.addAttribute("listarProgramas",programaModel.listarProgramas());
        model.addAttribute("listarLocales",localModel.listarLocales());
        return "cursos/listar";
    }
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.POST)
    public String modificarCurso(Curso curso, Model model,RedirectAttributes atributos){
        model.addAttribute("listarCursos",cursoModel.listarCursos());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        model.addAttribute("listarProveedores",proveedorModel.listarProveedores());
        model.addAttribute("listarProgramas",programaModel.listarProgramas());
        model.addAttribute("listarLocales",localModel.listarLocales());
        //usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
        if(cursoModel.modificarCurso(curso)>0){
            atributos.addFlashAttribute("Exito","Curso modificado con exito");
            return "redirect:/cursos/list/";
        }
        else{
            model.addAttribute("curso",curso);
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
