/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;


import com.entities.Gasto;
import com.model.GastoModel;
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
@RequestMapping("gastos")
public class GastosController {
    GastoModel gastoModel = new GastoModel();
    
    @RequestMapping(value={"list"})
    public String listarGastos(Model model){

        model.addAttribute("listarGastos",gastoModel.listarGastos());
        model.addAttribute("gasto",new Gasto());
        return "gastos/listar";
    }
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    public String insertarGasto(@ModelAttribute("gasto")Gasto gasto, Model model,RedirectAttributes atributos){
        model.addAttribute("listarGastos",gastoModel.listarGastos());
        
        if(gastoModel.insertarGasto(gasto)>0){
            atributos.addFlashAttribute("Exito","Gasto registrado con exito");
            return "redirect:/gastos/list/";
        }
        else{
            model.addAttribute("gasto",gasto);
            return "gastos/listar";
        }
        
    }
       @RequestMapping(value="edit/{codigo}",method = RequestMethod.GET)
    public String obtenerGasto(@PathVariable("codigo")String codigo, Model model){
        
        model.addAttribute("gasto",gastoModel.obtenerGasto(codigo));  
        model.addAttribute("listarGastos",gastoModel.listarGastos());
       
        return "gastos/listar";
    }
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.POST)
    public String modificarGasto(Gasto gasto, Model model,RedirectAttributes atributos){
        model.addAttribute("listarGastos",gastoModel.listarGastos());
        if(gastoModel.modificarGasto(gasto)>0){
            atributos.addFlashAttribute("Exito","Gasto modificado con exito");
            return "redirect:/gastos/list/";
        }
        else{
            model.addAttribute("gasto",gasto);
            return "gastos/listar";
        }
        
    }
    @RequestMapping(value={"eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarGasto(@PathVariable("codigo") String codigo ,Model model,RedirectAttributes atributos){
        if(gastoModel.eliminarGasto(codigo)>0){
            atributos.addFlashAttribute("Exito","Gasto eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
         return "redirect:/gastos/list/";
    }
    
}
