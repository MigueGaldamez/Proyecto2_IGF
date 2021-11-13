/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entities.Curso;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
public class CursoModel {
        SessionFactory factory = HibernateUtil.getSessionFactory();

     public int insertarCurso(Curso usuario) {
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
     public  List<Curso> listarCursos(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM Curso e");
        try{

        List<Curso> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
     }
     public Curso obtenerCurso(String codigo) {
        Session ses= factory.openSession();
        try{
            int codigoI = Integer.parseInt(codigo);
            Curso usuario= (Curso) ses.get(Curso.class,codigoI);
            ses.close();
            return usuario;
        }
        catch(Exception e){
            ses.close();
            return null;
        }
     }
      public Curso obtenerCursoPorCorreo(String correo) {
        Session ses= factory.openSession();
        try{
            Query query = ses.createQuery("FROM Curso e  where e.email = :email").setParameter("email", correo);            
            List lista = query.list();
            Curso usuario =(Curso) lista.get(0);
            ses.close();
            return usuario;
        }
        catch(Exception e){
        ses.close();
        return null;
        }

    }
     public int modificarCurso(Curso usuario) {
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
     public int eliminarCurso(String id){
        int filasAfectadas=0;
        Session ses= factory.openSession();
        int codigoI = Integer.parseInt(id);

        try{
        Curso usuario= (Curso) ses.get(Curso.class,codigoI);
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
