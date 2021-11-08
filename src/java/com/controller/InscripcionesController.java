/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;


import com.entities.IncripcionCurso;
import com.model.CursoModel;
import com.model.RolModel;
import com.model.IncripcionCursoModel;
import com.model.UsuarioModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/**
 *
 * @author Migue Galdamez
 */
@Controller
@RequestMapping("inscripciones")
public class InscripcionesController {
    IncripcionCursoModel incripcionCursoModel = new IncripcionCursoModel();
    UsuarioModel usuarioModel = new UsuarioModel();
    CursoModel cursoModel = new CursoModel();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    @RequestMapping(value={"list"})
    public String listarInscripcionCursos(Model model){
        
        model.addAttribute("listarInscripcionCursos",incripcionCursoModel.listarIncripcionCursos());
        model.addAttribute("listarCursos",cursoModel.listarCursos());
        model.addAttribute("incripcionCurso",new IncripcionCurso());
        return "inscripciones/listar";
    }
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    public String insertarIncripcionCurso(@ModelAttribute("incripcionCurso")IncripcionCurso incripcionCurso, Model model,RedirectAttributes atributos){
        model.addAttribute("listarIncripcionCursos",incripcionCursoModel.listarIncripcionCursos());
        model.addAttribute("listarCursos",cursoModel.listarCursos());
        if(incripcionCursoModel.insertarIncripcionCurso(incripcionCurso)>0){
            atributos.addFlashAttribute("Exito","incripcionCurso registrado con exito");
            return "redirect:/inscripciones/list/";
        }
        else{
            model.addAttribute("incripcionCurso",incripcionCurso);
            return "inscripciones/listar";
        }
        
    }
       @RequestMapping(value="edit/{codigo}",method = RequestMethod.GET)
    public String obtenerIncripcion(@PathVariable("codigo")String codigo, Model model){
        
        model.addAttribute("incripcionCurso",incripcionCursoModel.obtenerIncripcionCurso(codigo));  
        model.addAttribute("listarincripcionCursos",incripcionCursoModel.listarIncripcionCursos());
        model.addAttribute("listarCursos",cursoModel.listarCursos());
        return "inscripciones/listar";
    }
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.POST)
    public String modificarIncripcionCurso(IncripcionCurso incripcionCurso, Model model,RedirectAttributes atributos){
        model.addAttribute("listarIncripcionCursos",incripcionCursoModel.listarIncripcionCursos());
        model.addAttribute("listarCursos",cursoModel.listarCursos());
        if(incripcionCursoModel.modificarIncripcionCurso(incripcionCurso)>0){
            atributos.addFlashAttribute("Exito","incripcionCurso modificado con exito");
            return "redirect:/inscripciones/list/";
        }
        else{
            model.addAttribute("incripcionCurso",incripcionCurso);
            return "inscripciones/listar";
        }
        
    }
    @RequestMapping(value={"eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarIncripcionCurso(@PathVariable("codigo") String codigo ,Model model,RedirectAttributes atributos){
        if(incripcionCursoModel.eliminarIncripcionCurso(codigo)>0){
            atributos.addFlashAttribute("Exito","Curso eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
         return "redirect:/inscripciones/list/";
    }

}