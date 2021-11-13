/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entities.Programa;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
/**
 *
 * @author julay
 */
public class ProgramasModel {
    
    SessionFactory factory = HibernateUtil.getSessionFactory();

     public int insertarPrograma(Programa programa) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(programa);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
    public int modificarPrograma(Programa programa){
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(programa);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     public List<Programa> listarProgramas(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM Programa e");
        try{

        List<Programa> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
     }
      public int eliminarPrograma(String id){
        int filasAfectadas=0;
        Session ses= factory.openSession();
        int codigoI = Integer.parseInt(id);

        try{
        Programa programa= (Programa) ses.get(Programa.class,codigoI);
            if(programa!=null){
                Transaction tran= ses.beginTransaction();
                ses.delete(programa);
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
      public Programa obtenerPrograma(String codigo) {
        Session ses= factory.openSession();
        try{
            int codigoI = Integer.parseInt(codigo);
            Programa programa= (Programa) ses.get(Programa.class,codigoI);
            ses.close();
            return programa;
        }
        catch(Exception e){
            ses.close();
            return null;
        }
     }
}
