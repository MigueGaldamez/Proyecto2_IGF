/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entities.DetalleFinanciamiento;
import com.entities.Usuario;
import com.model.DetalleFinanciamientoModel;
import com.model.FinanciamientoModel;
import com.model.PresupuestoModel;
import javax.servlet.http.HttpSession;
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
@RequestMapping("presupuestoingreso")
public class DetalleFinanciamientosController {
    
    //Poner todas la dependencias
    DetalleFinanciamientoModel detalleFinanciamientoModel = new DetalleFinanciamientoModel();
    FinanciamientoModel financiamientoModel = new FinanciamientoModel();
    PresupuestoModel presupuestoModel = new PresupuestoModel();
    Usuario user = new Usuario();
    
    @RequestMapping(value={"{id}/list"})
    public String listarDetalleFinanciaminto(@PathVariable("id")String id, Model model, HttpSession session){
        if (session.getAttribute("usr") == null){
            return "redirect:/";
        } else {
            user = (Usuario) session.getAttribute("usr");
            String rol = user.getRol().getNombreRol();
            if (rol.equals("Contador") || rol.equals("Administrador")){
                //Se deben añadir los listar necesarios en base a las dependencias
                model.addAttribute("listarDetalleFinanciamientos",detalleFinanciamientoModel.listarDetalleFinanciamientosID(id));
                model.addAttribute("listarFinanciamientos",financiamientoModel.listarFinanciamiento());
                model.addAttribute("presupuesto",id);
                model.addAttribute("detalle_financiamiento",new DetalleFinanciamiento());
                return "detalleFinanciamiento/listar";
        } else {
                return "redirect:/";
            }
        }
    }
    
    @RequestMapping(value={"{id}/create","list/create"},method = RequestMethod.POST)
    public String insertarDetalleFinanciamiento(@ModelAttribute("detalle_financiamiento")DetalleFinanciamiento detalle_financiamiento, @PathVariable("id")String id, Model model,RedirectAttributes atributos){
        
        //Tambien acá tomar en cuenta las dependencias
        model.addAttribute("listarDetalleFinanciamientos",detalleFinanciamientoModel.listarDetalleFinanciamientosID(id));
        model.addAttribute("listarFinanciamientos",financiamientoModel.listarFinanciamiento());
        model.addAttribute("presupuesto",id);
        model.addAttribute("listarPresupuestos",presupuestoModel.listarPresupuestos());
        
        
        if(detalleFinanciamientoModel.insertarDetalleFinanciamiento(detalle_financiamiento)>0){
            atributos.addFlashAttribute("Exito","Detalle de financiamiento registrado con exito");
            return "redirect:/presupuestoingreso/"+id+"/list";
        }
        else{
            model.addAttribute("detalle_financiamiento",detalle_financiamiento);
            return "detalleFinanciamiento/listar";
        }
        
    }
    @RequestMapping(value="{id}/edit/{codigo}",method = RequestMethod.GET)
    public String obtenerDetalleFinanciamiento(@PathVariable("codigo")String codigo, @PathVariable("id")String id,Model model){
        
        model.addAttribute("detalle_financiamiento",detalleFinanciamientoModel.obtenerDetalleFinanciamiento(codigo));  
        model.addAttribute("listarDetalleFinanciamientos",detalleFinanciamientoModel.listarDetalleFinanciamientosID(id));
        //Agregando tambien las dependencias
        model.addAttribute("listarFinanciamientos",financiamientoModel.listarFinanciamiento());
        model.addAttribute("presupuesto",id);
        model.addAttribute("listarPresupuestos",presupuestoModel.listarPresupuestos());
       
        return "detalleFinanciamiento/listar";
        //return "redirect:/detalleFinanciamiento/list/"+id;
    }
    @RequestMapping(value="{id}/edit/{codigo}",method = RequestMethod.POST)
    public String modificarDetalleFinanciamiento(DetalleFinanciamiento detalle_financiamiento, @PathVariable("codigo")String codigo, @PathVariable("id") String id, Model model,RedirectAttributes atributos){
        
        //Agregando las dependencias
        model.addAttribute("listarDetalleFinanciamientos",detalleFinanciamientoModel.listarDetalleFinanciamientosID(id));
        model.addAttribute("listarFinanciamientos",financiamientoModel.listarFinanciamiento());
        model.addAttribute("listarPresupuestos",presupuestoModel.listarPresupuestos());
        model.addAttribute("presupuesto",id);
        if(detalleFinanciamientoModel.modificarDetalleFinanciamiento(detalle_financiamiento)>0){
            atributos.addFlashAttribute("Exito","Detalle de Financiamiento modificado con exito");
            //return "redirect:/detalleFinanciamiento/list/"+id;
            return "redirect:/presupuestoingreso/"+id+"/list";
        }
        else{
            model.addAttribute("detalle_financiamiento",detalle_financiamiento);
            return "detalleFinanciamiento/listar";
        }
        
    }
    @RequestMapping(value={"{id}/eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarDetalleFinanciamiento(@PathVariable("codigo") String codigo, @PathVariable("id") String id, Model model,RedirectAttributes atributos){
        if(detalleFinanciamientoModel.eliminarDetalleFinanciamiento(codigo)>0){
            atributos.addFlashAttribute("Exito","Detalle de financiamiento eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
        return "redirect:/presupuestoingreso/"+id+"/list";
    
   }
    
}
