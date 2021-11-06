package com.model;


import com.entities.Rol;
import com.model.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Migue Galdamez
 */
public class LocalModel {
    SessionFactory factory = HibernateUtil.getSessionFactory();
    
     public List<Rol> listarLocales(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM Local e");
        try{

        List<Rol> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
     }
}
