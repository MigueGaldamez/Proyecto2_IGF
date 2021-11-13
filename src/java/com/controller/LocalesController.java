/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;
import com.entities.Local;
import com.model.LocalModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author jfgan
 */
@Controller
@RequestMapping("locales")
public class LocalesController {
    LocalModel localModel = new LocalModel();
    
    @RequestMapping(value={"list"})
    public String listarLocales(Model model){
        
        model.addAttribute("listarLocales",localModel.listarLocales());
        model.addAttribute("local",new Local());
        return "locales/listar";
    }
    
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    public String insertarLocal(@ModelAttribute("local")Local local, Model model,RedirectAttributes atributos){
        model.addAttribute("listarLocales",localModel.listarLocales());
        if(localModel.insertarLocal(local)>0){
            atributos.addFlashAttribute("Exito","Local registrado con exito");
            return "redirect:/locales/list/";
        }
        else{
            model.addAttribute("local",local);
            return "locales/listar";
        }   
    }
    
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.GET)
    public String obtenerLocal(@PathVariable("codigo")String codigo, Model model){
        
        model.addAttribute("local",localModel.obtenerLocal(codigo));  
        model.addAttribute("listarLocales",localModel.listarLocales());
        return "locales/listar";
    }
    
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.POST)
    public String modificarLocal(Local local, Model model,RedirectAttributes atributos){
        model.addAttribute("listarLocales",localModel.listarLocales());
        if(localModel.modificarLocal(local)>0){
            atributos.addFlashAttribute("Exito","Local modificado con exito");
            return "redirect:/locales/list/";
        }
        else{
            model.addAttribute("local",local);
            return "locales/listar";
        }
    }
    
    @RequestMapping(value={"eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarLocal(@PathVariable("codigo") String codigo ,Model model,RedirectAttributes atributos){
        if(localModel.eliminarLocal(codigo)>0){
            atributos.addFlashAttribute("Exito","Local eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
         return "redirect:/locales/list/";
    }
}
