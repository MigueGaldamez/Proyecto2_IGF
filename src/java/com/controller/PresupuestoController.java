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
import com.entities.Usuario;
import com.model.PresupuestoModel;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 *
 * @author Jeffry1
 */

@Controller
@RequestMapping("presupuestos")
public class PresupuestoController {
    PresupuestoModel presupuestoModel = new PresupuestoModel();
    Usuario user = new Usuario();
    
    @RequestMapping(value={"list"})
    public String listarPresupuesto(Model model, HttpSession session){
        if (session.getAttribute("usr") == null){
            return "redirect:/";
        } else {
            user = (Usuario) session.getAttribute("usr");
            String rol = user.getRol().getNombreRol();
            if (rol.equals("Contador") || rol.equals("Administrador")){
                List<Presupuesto> presupuesto = presupuestoModel.listarPresupuestos();
                model.addAttribute("listarPresupuesto",presupuestoModel.listarPresupuestos());
                //model.addAttribute("montoFinanciamientos",presupuestoModel.listarFinanciamientos());
                //model.addAttribute("montoGatos",presupuestoModel.listarGastos());

                ArrayList<DetalleGasto> detalleGastos = new ArrayList<DetalleGasto>();
                ArrayList<DetalleFinanciamiento> detalleFinanciamientos = new ArrayList<DetalleFinanciamiento>();

                for (Presupuesto p:presupuesto) {
                    double totalFinanciamientos = 0;
                    for(DetalleFinanciamiento d:p.getDetalleFinanciamientos()){
                        totalFinanciamientos = totalFinanciamientos+d.getMonto().doubleValue();
                    }
                    DetalleFinanciamiento det = new DetalleFinanciamiento();
                    det.setPresupuesto(p);
                    det.setMonto(BigDecimal.valueOf(totalFinanciamientos));
                    detalleFinanciamientos.add(det);
                }

                for (Presupuesto p:presupuesto) {
                    double totalGastos = 0;
                    for(DetalleGasto d:p.getDetalleGastos()){
                        totalGastos = totalGastos+d.getMonto().doubleValue();
                    }
                    DetalleGasto det = new DetalleGasto();
                    det.setPresupuesto(p);
                    det.setMonto(BigDecimal.valueOf(totalGastos));
                    detalleGastos.add(det);
                }

                /*for(DetalleFinanciamiento f: presupuesto.getDetalleFinanciamientos()){
                    totalFinanciamientos = totalFinanciamientos + f.getMonto().doubleValue();
                }*/
                model.addAttribute("totalGastos", detalleGastos);
                model.addAttribute("totalFinanciamientos", detalleFinanciamientos);
                //model.addAttribute("listarRoles",rolModel.listarRoles());
                //model.addAttribute("programa",new Programa());
                return "presupuesto/listar";
        } else {
                return "redirect:/";
            }
        }
    }
    
    @RequestMapping(value="detalles/{id}")
    public String listarDetallesPresupuestoSeleccionado(@PathVariable("id")String id,Model model){
        double totalGastos = 0;
        double totalFinanciamientos = 0;
        
        Presupuesto presupuesto = presupuestoModel.listarDetallesPresupuestoSeleccionado(id);
        model.addAttribute("conjuntoFinanciamientos",presupuesto.getDetalleFinanciamientos());
        model.addAttribute("conjuntoGastos",presupuesto.getDetalleGastos());
        model.addAttribute("presupuesto",id);
        
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
