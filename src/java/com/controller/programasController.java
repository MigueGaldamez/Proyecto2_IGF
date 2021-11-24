
package com.controller;

import com.entities.Programa;
import com.entities.Usuario;
import com.model.ProgramasModel;
import com.model.RolModel;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/**
 *
 * @author julay
 */
@Controller
@RequestMapping("programas")
public class programasController {
    
    ProgramasModel programaModel = new ProgramasModel();
    RolModel rolModel = new RolModel();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    Usuario user = new Usuario();
    
    @RequestMapping(value={"list"})
    public String listarProgramas(Model model, HttpSession session){
        if (session.getAttribute("usr") == null){
            return "redirect:/";
        } else {
            user = (Usuario) session.getAttribute("usr");
            String rol = user.getRol().getNombreRol();
            if (rol.equals("Administrador")){
                model.addAttribute("listarProgramas",programaModel.listarProgramas());
                model.addAttribute("listarRoles",rolModel.listarRoles());
                model.addAttribute("programa",new Programa());
                return "programas/listar";
        } else {
                return "redirect:/";
            }
        }
    }
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    
    public String insertarPrograma(@ModelAttribute("programa")Programa programa, Model model,RedirectAttributes atributos){
        model.addAttribute("listarProgramas",programaModel.listarProgramas());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        if(programaModel.insertarPrograma(programa)>0){
            atributos.addFlashAttribute("Exito","Programa registrado con exito");
            return "redirect:/programas/list/";
        }
        else{
            model.addAttribute("programa",programa);
            return "programa/listar";
        }   
    }
       @RequestMapping(value="edit/{codigo}",method = RequestMethod.GET)
    public String obtenerPrograma(@PathVariable("codigo")String codigo, Model model){
        
        model.addAttribute("programa",programaModel.obtenerPrograma(codigo));  
        model.addAttribute("listarProgramas",programaModel.listarProgramas());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        return "programas/listar";
    }
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.POST)
    public String modificarPrograma(Programa programa, Model model,RedirectAttributes atributos){
        model.addAttribute("listarProgramas",programaModel.listarProgramas());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        if(programaModel.modificarPrograma(programa)>0){
            atributos.addFlashAttribute("Exito","Programa modificado con exito");
            return "redirect:/programas/list/";
        }
        else{
            model.addAttribute("programa",programa);
            return "programas/listar";
        }
        
    }
    @RequestMapping(value={"eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarPrograma(@PathVariable("codigo") String codigo ,Model model,RedirectAttributes atributos){
        if(programaModel.eliminarPrograma(codigo)>0){
            atributos.addFlashAttribute("Exito","Programa eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
         return "redirect:/programas/list/";
    }
}
   

