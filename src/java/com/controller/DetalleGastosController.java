/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entities.DetalleGasto;
import com.model.DetalleGastoModel;
import com.entities.Usuario;
import com.model.GastoModel;
import com.model.PresupuestoModel;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 *
 * @author Meybel Guardado
 */

@Controller
@RequestMapping("presupuestogasto")
public class DetalleGastosController {
    
    /*
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }*/
    //Poner todas la dependencias
    DetalleGastoModel detalleGastoModel = new DetalleGastoModel();
    GastoModel gastoModel = new GastoModel();
    PresupuestoModel presupuestoModel = new PresupuestoModel();
    Usuario user = new Usuario();
    
    @RequestMapping(value={"{id}/list"})
    public String listarDetalleGastos(@PathVariable("id")String id, Model model, HttpSession session){
        if (session.getAttribute("usr") == null){
            return "redirect:/";
        } else {
            user = (Usuario) session.getAttribute("usr");
            String rol = user.getRol().getNombreRol();
            if (rol.equals("Contador") || rol.equals("Administrador")){
                //Se deben añadir los listar necesarios en base a las dependencias
                model.addAttribute("listarDetalleGastos",detalleGastoModel.listarDetalleGastosID(id));
                model.addAttribute("listarGastos",gastoModel.listarGastos());
                model.addAttribute("presupuesto",id);
                model.addAttribute("detalle_gasto",new DetalleGasto());
                return "detalleGastos/listar";
        } else {
                return "redirect:/";
            }
        }
    }
    
    @RequestMapping(value={"{id}/create","list/create"},method = RequestMethod.POST)
    public String insertarDetalleGasto(@ModelAttribute("detalle_gasto")DetalleGasto detalle_gasto, @PathVariable("id")String id, Model model,RedirectAttributes atributos){
        
        //Tambien acá tomar en cuenta las dependencias
        model.addAttribute("listarDetalleGastos",detalleGastoModel.listarDetalleGastosID(id));
        model.addAttribute("listarGastos",gastoModel.listarGastos());
        model.addAttribute("presupuesto",id);
        model.addAttribute("listarPresupuestos",presupuestoModel.listarPresupuestos());
        
        
        if(detalleGastoModel.insertarDetalleGasto(detalle_gasto)>0){
            atributos.addFlashAttribute("Exito","Detalle de gasto registrado con exito");
            return "redirect:/presupuestogasto/"+id+"/list";
        }
        else{
            model.addAttribute("detalle_gasto",detalle_gasto);
            return "detalleGastos/listar";
        }
        
    }
    @RequestMapping(value="{id}/edit/{codigo}",method = RequestMethod.GET)
    public String obtenerDetalleGasto(@PathVariable("codigo")String codigo, @PathVariable("id")String id,Model model){
        
        model.addAttribute("detalle_gasto",detalleGastoModel.obtenerDetalleGasto(codigo));  
        model.addAttribute("listarDetalleGastos",detalleGastoModel.listarDetalleGastosID(id));
        //Agregando tambien las dependencias
        model.addAttribute("listarGastos",gastoModel.listarGastos());
        model.addAttribute("presupuesto",id);
        model.addAttribute("listarPresupuestos",presupuestoModel.listarPresupuestos());
       
        return "detalleGastos/listar";
        //return "redirect:/detalleGastos/list/"+id;
    }
    @RequestMapping(value="{id}/edit/{codigo}",method = RequestMethod.POST)
    public String modificarDetalleGasto(DetalleGasto detalle_gasto, @PathVariable("codigo")String codigo, @PathVariable("id") String id, Model model,RedirectAttributes atributos){
        
        //Agregando las dependencias
        model.addAttribute("listarDetalleGastos",detalleGastoModel.listarDetalleGastosID(id));
        model.addAttribute("listarGastos",gastoModel.listarGastos());
        model.addAttribute("listarPresupuestos",presupuestoModel.listarPresupuestos());
        model.addAttribute("presupuesto",id);
        if(detalleGastoModel.modificarDetalleGasto(detalle_gasto)>0){
            atributos.addFlashAttribute("Exito","Detalle de gasto modificado con exito");
            //return "redirect:/detalleGastos/list/"+id;
            return "redirect:/presupuestogasto/"+id+"/list";
        }
        else{
            model.addAttribute("detalle_gasto",detalle_gasto);
            return "detalleGastos/listar";
        }
        
    }
    @RequestMapping(value={"{id}/eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarDetalleGasto(@PathVariable("codigo") String codigo, @PathVariable("id") String id, Model model,RedirectAttributes atributos){
        if(detalleGastoModel.eliminarDetalleGasto(codigo)>0){
            atributos.addFlashAttribute("Exito","Detalle de gasto eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
        return "redirect:/presupuestogasto/"+id+"/list";
    
   }
    
}
   
    



