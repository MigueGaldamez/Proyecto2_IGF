/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entities.Gasto;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Migue Galdamez
 */
public class GastoModel {
    SessionFactory factory = HibernateUtil.getSessionFactory();

     public int insertarGasto(Gasto gasto) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(gasto);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     public List<Gasto> listarGastos(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM Gasto e");
        try{

        List<Gasto> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
     }
     public Gasto obtenerGasto(String codigo) {
        Session ses= factory.openSession();
        try{
           int codigoI = Integer.parseInt(codigo);
           Gasto gasto= (Gasto) ses.get(Gasto.class,codigoI);
            ses.close();
        return gasto;
        }
        catch(Exception e){
            ses.close();
            return null;
        }
     }
     public int modificarGasto(Gasto gasto) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(gasto);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     public int eliminarGasto(String id){
        int filasAfectadas=0;
        Session ses= factory.openSession();
        int codigoI = Integer.parseInt(id);

        try{
        Gasto gasto= (Gasto) ses.get(Gasto.class,codigoI);
            if(gasto!=null){
                Transaction tran= ses.beginTransaction();
                ses.delete(gasto);
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
