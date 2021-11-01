/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entities.Proveedor;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author juann
 */
public class ProveedorModel {
    
    SessionFactory factory = HibernateUtil.getSessionFactory();

     public int insertarProveedor(Proveedor proveedor) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(proveedor);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     public List<Proveedor> listarProveedores(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM Proveedor e");
        try{

        List<Proveedor> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
     }
     public Proveedor obtenerProveedor(String codigo) {
        Session ses= factory.openSession();
        try{
            int codigoI = Integer.parseInt(codigo);
            Proveedor proveedor= (Proveedor) ses.get(Proveedor.class,codigoI);
            ses.close();
            return proveedor;
        }
        catch(Exception e){
            ses.close();
            return null;
        }
     }
      public Proveedor obtenerUsuarioPorCorreo(String correo) {
        Session ses= factory.openSession();
        try{
            Query query = ses.createQuery("FROM Proveedor e  where e.email = :email").setParameter("email", correo);            
            List lista = query.list();
            Proveedor proveedor =(Proveedor) lista.get(0);
            ses.close();
            return proveedor;
        }
        catch(Exception e){
        ses.close();
        return null;
        }

    }
     public int modificarProveedor(Proveedor proveedor) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(proveedor);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     public int eliminarProveedor(String id){
        int filasAfectadas=0;
        Session ses= factory.openSession();
        int codigoI = Integer.parseInt(id);

        try{
        Proveedor proveedor= (Proveedor) ses.get(Proveedor.class,codigoI);
            if(proveedor!=null){
                Transaction tran= ses.beginTransaction();
                ses.delete(proveedor);
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
