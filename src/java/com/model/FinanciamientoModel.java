package com.model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
//librerias importadas

import com.entities.Financiamiento;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;



/**
 *
 * @author FireFox1995
 */
public class FinanciamientoModel {
    SessionFactory factory = HibernateUtil.getSessionFactory();
    
    public int insertarFinanciamiento(Financiamiento financiamiento) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(financiamiento);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
       
     }
    
    
    public List<Financiamiento> listarFinanciamiento(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM Financiamiento e");
        try{

        List<Financiamiento> lista= consulta.list();
        ses.close();
        return lista;

        }
        catch(Exception e){
        ses.close();
        return null;
        }
     }

    
    public Financiamiento obtenerFinanciamiento(String codigo) {
        Session ses= factory.openSession();
        try{
            int codigoI = Integer.parseInt(codigo);
            Financiamiento financiamiento = (Financiamiento) ses.get(Financiamiento.class,codigoI);
            ses.close();
            return financiamiento;
        }
        catch(Exception e){
            ses.close();
            return null;
        }
     }
    
    
    public Financiamiento obtenerFinanciamientoPorId(int id) {
        Session ses= factory.openSession();
        try{
            Query query = ses.createQuery("FROM financiamiento e  where e.id_financiamiento = :id_financiamiento").setParameter("ID", id);            
            List lista = query.list();
            Financiamiento financiamiento =(Financiamiento) lista.get(0);
            ses.close();
            return financiamiento;
        }
        catch(Exception e){
        ses.close();
        return null;
        }

    }
    
    
    
    public int modificarFinanciamiento(Financiamiento financiamiento) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(financiamiento);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
    
    
    
    public int eliminarFinanciamiento(String id){
        int filasAfectadas=0;
        Session ses= factory.openSession();
        int codigoI = Integer.parseInt(id);

        try{
        Financiamiento financiamiento = (Financiamiento) ses.get(Financiamiento.class,codigoI);
            if(financiamiento!=null){
                Transaction tran= ses.beginTransaction();
                ses.delete(financiamiento);
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
