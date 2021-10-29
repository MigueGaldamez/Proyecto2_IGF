/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entities.Rol;
import com.model.RolModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Migue Galdamez
 */
@Controller
@RequestMapping("roles")
public class RolesController {
    RolModel rolModel = new RolModel();
    
    @RequestMapping(value={"list"})
    public String listarRoles(Model model){

        model.addAttribute("listarRoles",rolModel.listarRoles());
        model.addAttribute("rol",new Rol());
        return "roles/listar";
    }
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    public String insertarProducto(@ModelAttribute("rol")Rol rol, Model model,RedirectAttributes atributos){
        model.addAttribute("listarRoles",rolModel.listarRoles());
        
        if(rolModel.insertarRol(rol)>0){
            atributos.addFlashAttribute("Exito","Rol registrado con exito");
            return "redirect:/roles/list/";
        }
        else{
            model.addAttribute("rol",rol);
            return "roles/listar";
        }
        
    }
       @RequestMapping(value="edit/{codigo}",method = RequestMethod.GET)
    public String obtenerRol(@PathVariable("codigo")String codigo, Model model){
        
        model.addAttribute("rol",rolModel.obtenerRol(codigo));  
        model.addAttribute("listarRoles",rolModel.listarRoles());
       
        return "roles/listar";
    }
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.POST)
    public String modificarRol(Rol rol, Model model,RedirectAttributes atributos){
        model.addAttribute("listarRoles",rolModel.listarRoles());
        if(rolModel.modificarRol(rol)>0){
            atributos.addFlashAttribute("Exito","Rol modificado con exito");
            return "redirect:/roles/list/";
        }
        else{
            model.addAttribute("rol",rol);
            return "roles/listar";
        }
        
    }
    @RequestMapping(value={"eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarRol(@PathVariable("codigo") String codigo ,Model model,RedirectAttributes atributos){
        if(rolModel.eliminarRol(codigo)>0){
            atributos.addFlashAttribute("Exito","Rol eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
         return "redirect:/roles/list/";
    }

}
