/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;
import com.entities.Presupuesto;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;

/**
 *
 * @author Meybel Guardado
 */
public class PresupuestoModel {
    
    SessionFactory factory = HibernateUtil.getSessionFactory();
    
    public List<Presupuesto> listarPresupuestos(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM Presupuesto e"); //Nombre de la tabla en Mayúsculas
        try{

        List<Presupuesto> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
    }

  
    public Presupuesto listarDetallesPresupuestoSeleccionado(int idPresupuesto){
        Session ses = factory.openSession();
        Query consulta = ses.createQuery("SELECT e FROM Presupuesto e WHERE id_presupuesto = "+idPresupuesto);
        
        Presupuesto presupuesto = (Presupuesto)consulta.list().get(0);
        ses.close();
        return presupuesto;
    }
    
    
}
