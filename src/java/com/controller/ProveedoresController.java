/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

/**
 *
 * @author juann
 */
import com.entities.Proveedor;
import com.entities.Proveedor;
import com.model.RolModel;
import com.model.ProveedorModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@Controller
@RequestMapping("proveedores")
public class ProveedoresController {
    ProveedorModel proveedorModel = new ProveedorModel();
    RolModel rolModel = new RolModel();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    @RequestMapping(value={"list"})
    
    public String listarProveedores(Model model){
        
        model.addAttribute("listarProveedores",proveedorModel.listarProveedores());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        model.addAttribute("proveedor",new Proveedor());
        return "proveedores/listar";
    }
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    public String insertarProveedor(@ModelAttribute("proveedor")Proveedor proveedor, Model model,RedirectAttributes atributos){
        model.addAttribute("listarProveedorees",proveedorModel.listarProveedores());
        model.addAttribute("listarRoles",rolModel.listarRoles());
//        proveedor.setPassword(passwordEncoder.encode(proveedor.getPassword()));
        if(proveedorModel.insertarProveedor(proveedor)>0){
            atributos.addFlashAttribute("Exito","Proveedor registrado con exito");
            return "redirect:/proveedores/list/";
        }
        else{
            model.addAttribute("proveedor",proveedor);
            return "proveedores/listar";
        }   
    }
       @RequestMapping(value="edit/{codigo}",method = RequestMethod.GET)
    public String obtenerProveedor(@PathVariable("codigo")String codigo, Model model){
        
        model.addAttribute("proveedor",proveedorModel.obtenerProveedor(codigo));  
        model.addAttribute("listarProveedores",proveedorModel.listarProveedores());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        return "proveedores/listar";
    }
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.POST)
    public String modificarProveedor(Proveedor proveedor, Model model,RedirectAttributes atributos){
        model.addAttribute("listarProveedores",proveedorModel.listarProveedores());
        model.addAttribute("listarRoles",rolModel.listarRoles());
//        proveedor.setPassword(passwordEncoder.encode(proveedor.getPassword()));
        if(proveedorModel.modificarProveedor(proveedor)>0){
            atributos.addFlashAttribute("Exito","Proveedor modificado con exito");
            return "redirect:/proveedores/list/";
        }
        else{
            model.addAttribute("proveedor",proveedor);
            return "proveedores/listar";
        }
        
    }
    @RequestMapping(value={"eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarProveedor(@PathVariable("codigo") String codigo ,Model model,RedirectAttributes atributos){
        if(proveedorModel.eliminarProveedor(codigo)>0){
            atributos.addFlashAttribute("Exito","Proveedor eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
         return "redirect:/proveedores/list/";
    }
}
