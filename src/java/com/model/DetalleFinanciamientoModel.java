/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entities.DetalleFinanciamiento;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author jfgan
 */
public class DetalleFinanciamientoModel {
    SessionFactory factory = HibernateUtil.getSessionFactory();

    //Esta parte no cambia
     public int insertarDetalleFinanciamiento(DetalleFinanciamiento detalle_financiamiento) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(detalle_financiamiento);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     
     //Esta parte no cambia
      public List<DetalleFinanciamiento> listarDetalleFinanciamientos(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM DetalleFinanciamiento e"); //Nombre de la tabla en Mayúsculas
        try{

        List<DetalleFinanciamiento> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
     }
      
       //Esta parte no cambia
    public List<DetalleFinanciamiento> listarDetalleFinanciamientosID(String id){
        
        int idPresupuesto = Integer.parseInt(id);
        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM DetalleFinanciamiento e WHERE id_presupuesto = "+idPresupuesto); //Nombre de la tabla en Mayúsculas
        try{

        List<DetalleFinanciamiento> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
    }
      
      
      
      
      
      //Esta parte no cambia
      public DetalleFinanciamiento obtenerDetalleFinanciamiento(String codigo) {
        Session ses= factory.openSession();
        try{
           int codigoI = Integer.parseInt(codigo);
           DetalleFinanciamiento detalle_financiamiento= (DetalleFinanciamiento) ses.get(DetalleFinanciamiento.class,codigoI);
            ses.close();
        return detalle_financiamiento;
        }
        catch(Exception e){
            ses.close();
            return null;
        }
     }
      //Esta parte no cambia
      public int modificarDetalleFinanciamiento(DetalleFinanciamiento detalle_financiamiento) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(detalle_financiamiento);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
      //Esta parte no cambia
      public int eliminarDetalleFinanciamiento(String id){
        int filasAfectadas=0;
        Session ses= factory.openSession();
        int codigoI = Integer.parseInt(id);

        try{
        DetalleFinanciamiento detalle_financiamiento= (DetalleFinanciamiento) ses.get(DetalleFinanciamiento.class,codigoI);
            if(detalle_financiamiento!=null){
                Transaction tran= ses.beginTransaction();
                ses.delete(detalle_financiamiento);
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
