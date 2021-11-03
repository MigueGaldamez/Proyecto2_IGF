/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entities.DetalleGasto;
import com.model.DetalleGastoModel;
import com.model.GastoModel;
import com.model.PresupuestoModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Meybel Guardado
 */

@Controller
@RequestMapping("detalleGastos")
public class DetalleGastosController {
    
    //Poner todas la dependencias
    DetalleGastoModel detalleGastoModel = new DetalleGastoModel();
    GastoModel gastoModel = new GastoModel();
    PresupuestoModel presupuestoModel = new PresupuestoModel();
    
    @RequestMapping(value={"list"})
    public String listarDetalleGastos(Model model){

        //Se deben añadir los listar necesarios en base a las dependencias
        model.addAttribute("listarDetalleGastos",detalleGastoModel.listarDetalleGastos());
        model.addAttribute("listarGastos",gastoModel.listarGastos());
        model.addAttribute("listarPresupuestos",presupuestoModel.listarPresupuestos());
        model.addAttribute("detalle_gasto",new DetalleGasto());
        return "detalleGastos/listar";
    }
    
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    public String insertarDetalleGasto(@ModelAttribute("detalle_gasto")DetalleGasto detalle_gasto, Model model,RedirectAttributes atributos){
       
        //Tambien acá tomar en cuenta las dependencias
        model.addAttribute("listarDetalleGastos",detalleGastoModel.listarDetalleGastos());
        model.addAttribute("listarGastos",gastoModel.listarGastos());
        model.addAttribute("listarPresupuestos",presupuestoModel.listarPresupuestos());
        
        
        if(detalleGastoModel.insertarDetalleGasto(detalle_gasto)>0){
            atributos.addFlashAttribute("Exito","Detalle de gasto registrado con exito");
            return "redirect:/detalleGastos/list/";
        }
        else{
            model.addAttribute("detalle_gasto",detalle_gasto);
            return "detalleGastos/listar";
        }
        
    }
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.GET)
    public String obtenerDetalleGasto(@PathVariable("codigo")String codigo, Model model){
        
        model.addAttribute("detalle_gasto",detalleGastoModel.obtenerDetalleGasto(codigo));  
        model.addAttribute("listarDetalleGastos",detalleGastoModel.listarDetalleGastos());
        //Agregando tambien las dependencias
        model.addAttribute("listarGastos",gastoModel.listarGastos());
        model.addAttribute("listarPresupuestos",presupuestoModel.listarPresupuestos());
       
        return "detalleGastos/listar";
    }
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.POST)
    public String modificarDetalleGasto(DetalleGasto detalle_gasto, Model model,RedirectAttributes atributos){
        
        //Agregando las dependencias
        model.addAttribute("listarDetalleGastos",detalleGastoModel.listarDetalleGastos());
        model.addAttribute("listarGastos",gastoModel.listarGastos());
        model.addAttribute("listarPresupuestos",presupuestoModel.listarPresupuestos());
        if(detalleGastoModel.modificarDetalleGasto(detalle_gasto)>0){
            atributos.addFlashAttribute("Exito","Detalle de gasto modificado con exito");
            return "redirect:/detalleGastos/list/";
        }
        else{
            model.addAttribute("detalle_gasto",detalle_gasto);
            return "detalleGastos/listar";
        }
        
    }
    @RequestMapping(value={"eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarDetalleGasto(@PathVariable("codigo") String codigo ,Model model,RedirectAttributes atributos){
        if(detalleGastoModel.eliminarDetalleGasto(codigo)>0){
            atributos.addFlashAttribute("Exito","Detalle de gasto eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
         return "redirect:/detalleGastos/list/";
    
   }
    
}
   
    



