package com.controller;

//importacion de las librerias necesarias
import com.entities.Financiamiento;
import com.model.RolFinanciamiento;
import com.model.FinanciamientoModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


/**
 * @author FireFox1995
 */

@Controller
@RequestMapping("financiamientos")

public class FinanciamientoController {
    FinanciamientoModel financiamientoModel = new FinanciamientoModel();
    RolFinanciamiento rolFinanciamiento = new RolFinanciamiento();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    
    @RequestMapping(value={"list"})
    public String listarFinanciamiento(Model model){
        
        model.addAttribute("listarFinanciamiento",financiamientoModel.listarFinanciamiento());
        model.addAttribute("financiamiento",new Financiamiento());
        return "financiamiento/listarFinancia";
    }
    
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    public String insertarFinanciamiento(@ModelAttribute("financiamiento")Financiamiento financiamiento, Model model,RedirectAttributes atributos){
        model.addAttribute("listarFinanciamiento",financiamientoModel.listarFinanciamiento());
        model.addAttribute("listarRoles",rolFinanciamiento.listarRoles());
        //financiamiento.setPassword(passwordEncoder.encode(financiamiento.getPassword()));
        if(financiamientoModel.insertarFinanciamiento(financiamiento)>0){
            atributos.addFlashAttribute("Exito","Financiamiento registrado con éxito");
            return "redirect:/financiamientos/list/";
        }
        else{
            model.addAttribute("financiamiento",financiamiento);
            return "financiamientos/listarFinancia";
        }
        
    }
    
    
    
     @RequestMapping(value="edit/{codigo}",method = RequestMethod.GET)
    public String obtenerFinanciamiento(@PathVariable("codigo")String codigo, Model model){
        
        model.addAttribute("financiamiento",financiamientoModel.obtenerFinanciamiento(codigo));  
        model.addAttribute("listarFinanciamiento",financiamientoModel.listarFinanciamiento());
      
        return "financiamiento/listarFinancia";
    }
    
    
    
    @RequestMapping(value="edit/{idFinanciamiento}",method = RequestMethod.POST)
    public String modificarFinanciamiento(Financiamiento financiamiento, Model model,RedirectAttributes atributos){
        model.addAttribute("listarFinanciamiento",financiamientoModel.listarFinanciamiento());
        
        //Financiamiento.setPassword(passwordEncoder.encode(usuario.getPassword()));
        if(financiamientoModel.modificarFinanciamiento(financiamiento)>0){
            atributos.addFlashAttribute("Exito","Financiamiento modificado con exito");
            return "redirect:/financiamientos/list/";
        }
        else{
            model.addAttribute("financiamiento",financiamiento);
            return "financiamientos/list";
        }
        
    }
    
    
    
     @RequestMapping(value={"eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarFinanciamiento(@PathVariable("codigo") String codigo ,Model model,RedirectAttributes atributos){
        if(financiamientoModel.eliminarFinanciamiento(codigo)>0){
            atributos.addFlashAttribute("Exito","Financiamiento eliminado con éxito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
         return "redirect:/financiamientos/list/";
    }
}
