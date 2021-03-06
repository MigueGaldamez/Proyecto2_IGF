/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entities.Participante;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Migue Galdamez
 */
public class ParticipanteModel {
    
    /**
    * @author Migue Galdamez
    */
   
    SessionFactory factory = HibernateUtil.getSessionFactory();

     public int insertarParticipante(Participante participante) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(participante);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     public List<Participante> listarParticipante(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM Participante e");
        try{

        List<Participante> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
     }
     public Participante obtenerParticipante(String codigo) {
        Session ses= factory.openSession();
        try{
           int codigoI = Integer.parseInt(codigo);
           Participante participante= (Participante) ses.get(Participante.class,codigoI);
            ses.close();
        return participante;
        }
        catch(Exception e){
            ses.close();
            return null;
        }
     }
     public int modificarParticipante(Participante participante) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(participante);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     public int eliminarParticipante(String id){
        int filasAfectadas=0;
        Session ses= factory.openSession();
        int codigoI = Integer.parseInt(id);

        try{
        Participante participante= (Participante) ses.get(Participante.class,codigoI);
            if(participante!=null){
                Transaction tran= ses.beginTransaction();
                ses.delete(participante);
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
