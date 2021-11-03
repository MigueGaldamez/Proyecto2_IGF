/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entities.DetalleGasto;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Meybel Guardado
 */
public class DetalleGastoModel {
    
    SessionFactory factory = HibernateUtil.getSessionFactory();

    //Esta parte no cambia
     public int insertarDetalleGasto(DetalleGasto detalle_gasto) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(detalle_gasto);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     
     //Esta parte no cambia
      public List<DetalleGasto> listarDetalleGastos(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM DetalleGasto e"); //Nombre de la tabla en Mayúsculas
        try{

        List<DetalleGasto> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
     }
      
      //Esta parte no cambia
      public DetalleGasto obtenerDetalleGasto(String codigo) {
        Session ses= factory.openSession();
        try{
           int codigoI = Integer.parseInt(codigo);
           DetalleGasto detalle_gasto= (DetalleGasto) ses.get(DetalleGasto.class,codigoI);
            ses.close();
        return detalle_gasto;
        }
        catch(Exception e){
            ses.close();
            return null;
        }
     }
      //Esta parte no cambia
      public int modificarDetalleGasto(DetalleGasto detalle_gasto) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(detalle_gasto);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
      //Esta parte no cambia
      public int eliminarDetalleGasto(String id){
        int filasAfectadas=0;
        Session ses= factory.openSession();
        int codigoI = Integer.parseInt(id);

        try{
        DetalleGasto detalle_gasto= (DetalleGasto) ses.get(DetalleGasto.class,codigoI);
            if(detalle_gasto!=null){
                Transaction tran= ses.beginTransaction();
                ses.delete(detalle_gasto);
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
