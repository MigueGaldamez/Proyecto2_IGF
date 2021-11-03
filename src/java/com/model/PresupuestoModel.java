/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Presupuesto;
/**
 *
 * @author Jeffry1
 */
public class PresupuestoModel {
    SessionFactory factory = HibernateUtil.getSessionFactory();
    
  
    public Presupuesto listarDetallesPresupuestoSeleccionado(int idPresupuesto){
        Session ses = factory.openSession();
        Query consulta = ses.createQuery("SELECT e FROM Presupuesto e WHERE id_presupuesto = "+idPresupuesto);
        
        Presupuesto presupuesto = (Presupuesto)consulta.list().get(0);
        ses.close();
        return presupuesto;
    }
    
    
}
