/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;


import com.entities.Usuario;
import com.model.RolModel;
import com.model.UsuarioModel;
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
 * @author Migue Galdamez
 */
@Controller
@RequestMapping("usuarios")
public class UsuariosController {
    UsuarioModel usuarioModel = new UsuarioModel();
    RolModel rolModel = new RolModel();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    Usuario user = new Usuario();
    
    @RequestMapping(value={"list"})
    public String listarUsuarios(Model model, HttpSession session){
        //String sesion = session.getId();
        if (session.getAttribute("usr") == null){
            return "redirect:/";
        } else {
            user = (Usuario) session.getAttribute("usr");
            String rol = user.getRol().getNombreRol();
            if (rol.equals("Administrador")){
                model.addAttribute("listarUsuarios",usuarioModel.listarUsuarios());
                model.addAttribute("listarRoles",rolModel.listarRoles());
                model.addAttribute("usuario",new Usuario());
                return "usuarios/listar";
            } else {
                return "redirect:/";
            }
        }
        
    }
    @RequestMapping(value={"create","list/create"},method = RequestMethod.POST)
    public String insertarUsuario(@ModelAttribute("usuario")Usuario usuario, Model model,RedirectAttributes atributos){
        model.addAttribute("listarUsuarios",usuarioModel.listarUsuarios());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
        if(usuarioModel.insertarUsuario(usuario)>0){
            atributos.addFlashAttribute("Exito","Usuario registrado con exito");
            return "redirect:/usuarios/list/";
        }
        else{
            model.addAttribute("usuario",usuario);
            return "usuarios/listar";
        }
        
    }
       @RequestMapping(value="edit/{codigo}",method = RequestMethod.GET)
    public String obtenerUsuario(@PathVariable("codigo")String codigo, Model model){
        
        model.addAttribute("usuario",usuarioModel.obtenerUsuario(codigo));  
        model.addAttribute("listarUsuarios",usuarioModel.listarUsuarios());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        return "usuarios/listar";
    }
    @RequestMapping(value="edit/{codigo}",method = RequestMethod.POST)
    public String modificarUsuario(Usuario usuario, Model model,RedirectAttributes atributos){
        model.addAttribute("listarUsuarios",usuarioModel.listarUsuarios());
        model.addAttribute("listarRoles",rolModel.listarRoles());
        usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
        if(usuarioModel.modificarUsuario(usuario)>0){
            atributos.addFlashAttribute("Exito","Usuario modificado con exito");
            return "redirect:/usuarios/list/";
        }
        else{
            model.addAttribute("usuario",usuario);
            return "usuarios/listar";
        }
        
    }
    @RequestMapping(value={"eliminar/{codigo}","list/eliminar/{codigo}"})
    public String eliminarUsuario(@PathVariable("codigo") String codigo ,Model model,RedirectAttributes atributos){
        if(usuarioModel.eliminarUsuario(codigo)>0){
            atributos.addFlashAttribute("Exito","Usuario eliminado con exito");  
        }
        else{
            atributos.addFlashAttribute("Fracaso","No se puede eliminar");          
        }
         return "redirect:/usuarios/list/";
    }

}
