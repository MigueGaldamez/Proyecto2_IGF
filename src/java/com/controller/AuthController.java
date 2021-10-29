/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;


import com.entities.Rol;
import com.entities.Usuario;
import com.model.RolModel;
import com.model.UsuarioModel;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/**
 *
 * @author Migue Galdamez
 */
@Controller 
@RequestMapping(value={"/"})
public class AuthController {
    UsuarioModel usuarioModel = new UsuarioModel();
    RolModel rolModel = new RolModel();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    
  
    @RequestMapping("/")
    public String iniciarSesion(Model model){
        model.addAttribute("usuario",new Usuario());
        return "auth/iniciarSesion";
    }
    
    @RequestMapping("registrar")
    public String registrarse(Model model){
        model.addAttribute("usuario",new Usuario());
        return "auth/registrar";
    }
    @RequestMapping(value="iniciarSesion",method = RequestMethod.POST)
    public String iniciarSesion(@ModelAttribute("usuario")Usuario usuario, Model model,RedirectAttributes atributos,HttpSession session){
        String errores="";
        if(usuario.getEmail().isEmpty()||usuario.getPassword().isEmpty()){
            errores = "Campos incompletos";
            model.addAttribute("errores",errores);
            model.addAttribute("usuario",usuario);
            return "auth/iniciarSesion";
        }
        Usuario us = usuarioModel.obtenerUsuarioPorCorreo(usuario.getEmail());
       
        if(passwordEncoder.matches(usuario.getPassword(), us.getPassword())){
            session.setAttribute("usr", us);
            return "redirect:usuarios/list";
        }
        else{
            errores = "Error de inicio de sesión";
            model.addAttribute("errores",errores);
            model.addAttribute("usuario",usuario);
            return "auth/iniciarSesion";
        }
        
    }
    @RequestMapping(value="create",method = RequestMethod.POST)
    public String insertarUsuario(@ModelAttribute("usuario")Usuario usuario, Model model,RedirectAttributes atributos,HttpSession session){
        Rol rol = rolModel.obtenerRol("1");
        String errores="";
        usuario.setRol(rol);
        
        if(usuario.getApellidoUsuario().isEmpty()||usuario.getNombreUsuario().isEmpty()||usuario.getEmail().isEmpty()){
            errores = "Campos incompletos";
            model.addAttribute("errores",errores);
            model.addAttribute("usuario",usuario);
            return "auth/registrar";
        }
        else{
           
            if(usuarioModel.obtenerUsuarioPorCorreo(usuario.getEmail())!=null){
                errores = "Correo en Uso";
                model.addAttribute("errores",errores);
                model.addAttribute("usuario",usuario);
                return "auth/registrar";
            }
            else
            {
                usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
                if(usuarioModel.insertarUsuario(usuario)>0){
                    session.setAttribute("usr", usuario);
                    atributos.addFlashAttribute("Exito","Producto regustrado con exito");
                    return "redirect:/usuarios/list";
                }
                else{
                    errores = "Error Al guardar";
                    model.addAttribute("errores",errores);
                    model.addAttribute("usuario",usuario);
                    return "auth/registrar";

                }
            }
        } 
    }
    @RequestMapping("cerrarSesion")
    public String cerrarSesion(Model model,HttpSession session){
        session.invalidate();
        model.addAttribute("usuario",new Usuario());
        return "auth/registrar";
    }
}
