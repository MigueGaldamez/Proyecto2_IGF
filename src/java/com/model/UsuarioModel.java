/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entities.Usuario;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
/**
 *
 * @author Migue Galdamez
 */
public class UsuarioModel {
    SessionFactory factory = HibernateUtil.getSessionFactory();

     public int insertarUsuario(Usuario usuario) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(usuario);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     public List<Usuario> listarUsuarios(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM Usuario e");
        try{

        List<Usuario> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
     }
     public Usuario obtenerUsuario(String codigo) {
        Session ses= factory.openSession();
        try{
            int codigoI = Integer.parseInt(codigo);
            Usuario usuario= (Usuario) ses.get(Usuario.class,codigoI);
            ses.close();
            return usuario;
        }
        catch(Exception e){
            ses.close();
            return null;
        }
     }
      public Usuario obtenerUsuarioPorCorreo(String correo) {
        Session ses= factory.openSession();
        try{
            Query query = ses.createQuery("FROM Usuario e  where e.email = :email").setParameter("email", correo);            
            List lista = query.list();
            Usuario usuario =(Usuario) lista.get(0);
            ses.close();
            return usuario;
        }
        catch(Exception e){
        ses.close();
        return null;
        }

    }
     public int modificarUsuario(Usuario usuario) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(usuario);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     public int eliminarUsuario(String id){
        int filasAfectadas=0;
        Session ses= factory.openSession();
        int codigoI = Integer.parseInt(id);

        try{
        Usuario usuario= (Usuario) ses.get(Usuario.class,codigoI);
            if(usuario!=null){
                Transaction tran= ses.beginTransaction();
                ses.delete(usuario);
                tran.commit();
                filasAfectadas=1;
            }
            ses.close();
            return filasAfectadas;
        }
        catch(Exception e){
            ses.close();
            return filasAfectadas;
        }
     }
    
}
