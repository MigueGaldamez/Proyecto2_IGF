/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;
import com.entities.DetalleFinanciamiento;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.entities.DetalleGasto;
import com.entities.Presupuesto;
import com.model.PresupuestoModel;
import java.math.BigDecimal;


/**
 *
 * @author Jeffry1
 */

@Controller
@RequestMapping("presupuesto")
public class PresupuestoController {
    PresupuestoModel presupuestoModel = new PresupuestoModel();
    
    @RequestMapping(value="detalles")
    public String listarDetallesPresupuestoSeleccionado(@RequestParam("id") String id,Model model){
        double totalGastos = 0;
        double totalFinanciamientos = 0;
        
        Presupuesto presupuesto = presupuestoModel.listarDetallesPresupuestoSeleccionado(id);
        model.addAttribute("conjuntoFinanciamientos",presupuesto.getDetalleFinanciamientos());
        model.addAttribute("conjuntoGastos",presupuesto.getDetalleGastos());
        
        for(DetalleGasto d : presupuesto.getDetalleGastos()){
            totalGastos = totalGastos+d.getMonto().doubleValue();
        }
        
        for(DetalleFinanciamiento f: presupuesto.getDetalleFinanciamientos()){
            totalFinanciamientos = totalFinanciamientos + f.getMonto().doubleValue();
        }
        model.addAttribute("totalGastos", totalGastos);
        model.addAttribute("totalFinanciamientos", totalFinanciamientos);
        
        
        
        
        return "presupuesto/detalles";
       
    }
    
    
}
