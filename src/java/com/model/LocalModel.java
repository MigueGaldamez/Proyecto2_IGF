package com.model;


import com.entities.Local;
import com.model.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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
    
    public int insertarLocal(Local local) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(local);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
    }
    
    public List<Local> listarLocales(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM Local e");
        try{

        List<Local> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
    }
    
    public Local obtenerLocal(String codigo) {
        Session ses = factory.openSession();
        try {
            int codigoI = Integer.parseInt(codigo);
            Local local = (Local) ses.get(Local.class, codigoI);
            ses.close();
            return local;
        } catch (Exception e) {
            ses.close();
            return null;
        }
    }

    public int modificarLocal(Local local) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(local);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
    }

    public int eliminarLocal(String id) {
        int filasAfectadas = 0;
        Session ses = factory.openSession();
        int codigoI = Integer.parseInt(id);

        try {
            Local local = (Local) ses.get(Local.class, codigoI);
            if (local != null) {
                Transaction tran = ses.beginTransaction();
                ses.delete(local);
                tran.commit();
                filasAfectadas = 1;
            }
            ses.close();
            return filasAfectadas;
        } catch (Exception e) {
            ses.close();
            return filasAfectadas;
        }
    }
}
