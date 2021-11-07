/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entities.Participante;
import com.entities.Rol;
import com.model.ParticipanteModel;
import com.model.RolModel;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
@RequestMapping("participantes")
public class ParticipanteController {
    ParticipanteModel participanteModel = new ParticipanteModel();
    RolModel rolModel = new RolModel();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    @RequestMapping(value={"list"})
    public String listarParticipantes(Model model){

        model.addAttribute("listarParticipantes",participanteModel.listarParticipante());
        model.addAttribute("participante",new Participante());
        return "participantes/listar";
    }
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    public String insertarParticipante(@ModelAttribute("participante")Participante participante, Model model,RedirectAttributes atributos){
        model.addAttribute("listarParticipantes",participanteModel.listarParticipante());
        
        if(participanteModel.insertarParticipante(participante)>0){
            atributos.addFlashAttribute("Exito","Participante registrado con exito");
            return "redirect:/participantes/list/";
        }
        else{
            model.addAttribute("participante",participante);
            return "participantes/listar";
        }
        
    }
       @RequestMapping(value="edit/{codigo}",method = RequestMethod.GET)
    public String obtenerParticipante(@PathVariable("codigo")String codigo, Model model){
        
        model.addAttribute("participante",participanteModel.obtenerParticipante(codigo));  
        model.addAttribute("listarParticipantes",participanteModel.listarParticipante());
       
        return "participantes/listar";
    }
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.POST)
    public String modificarParticipante(Participante participante, Model model,RedirectAttributes atributos){
        model.addAttribute("listarParticipantes",participanteModel.listarParticipante());
        if(participanteModel.modificarParticipante(participante)>0){
            atributos.addFlashAttribute("Exito","Participante modificado con exito");
            return "redirect:/participantes/list/";
        }
        else{
            model.addAttribute("participantes",participante);
            return "participantes/listar";
        }
        
    }
    @RequestMapping(value={"eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarParticipante(@PathVariable("codigo") String codigo ,Model model,RedirectAttributes atributos){
        if(participanteModel.eliminarParticipante(codigo)>0){
            atributos.addFlashAttribute("Exito","Participante eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
         return "redirect:/participantes/list/";
    }

}
