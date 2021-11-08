/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entities.IncripcionCurso;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
/**
 *
 * @author Migue Galdamez
 */
public class IncripcionCursoModel {
    SessionFactory factory = HibernateUtil.getSessionFactory();

     public int insertarIncripcionCurso(IncripcionCurso incripcion_curso) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(incripcion_curso);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     public List<IncripcionCurso> listarIncripcionCursos(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM IncripcionCurso e");
        try{

        List<IncripcionCurso> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
     }
     public IncripcionCurso obtenerIncripcionCurso(String codigo) {
        Session ses= factory.openSession();
        try{
            int codigoI = Integer.parseInt(codigo);
            IncripcionCurso IncripcionCurso= (IncripcionCurso) ses.get(IncripcionCurso.class,codigoI);
            ses.close();
            return IncripcionCurso;
        }
        catch(Exception e){
            ses.close();
            return null;
        }
     }
      public IncripcionCurso obtenerIncripcionCursoPorCorreo(String correo) {
        Session ses= factory.openSession();
        try{
            Query query = ses.createQuery("FROM incripcion_curso e  where e.email = :email").setParameter("email", correo);            
            List lista = query.list();
            IncripcionCurso IncripcionCurso =(IncripcionCurso) lista.get(0);
            ses.close();
            return IncripcionCurso;
        }
        catch(Exception e){
        ses.close();
        return null;
        }

    }
     public int modificarIncripcionCurso(IncripcionCurso IncripcionCurso) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(IncripcionCurso);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
     public int eliminarIncripcionCurso(String id){
        int filasAfectadas=0;
        Session ses= factory.openSession();
        int codigoI = Integer.parseInt(id);

        try{
        IncripcionCurso IncripcionCurso= (IncripcionCurso) ses.get(IncripcionCurso.class,codigoI);
            if(IncripcionCurso!=null){
                Transaction tran= ses.beginTransaction();
                ses.delete(IncripcionCurso);
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
