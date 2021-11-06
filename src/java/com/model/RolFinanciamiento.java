
package com.model;


import com.entities.Rol;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
/**
 * @author FireFox1995
 */
public class RolFinanciamiento {
    
    SessionFactory factory = HibernateUtil.getSessionFactory();
    
    
    public int insertarRol(Rol rol) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(rol);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
    
    
    
    public List<Rol> listarRoles(){

        Session ses= factory.openSession();
        Query consulta= ses.createQuery("SELECT e FROM Rol e");
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
    
    
    
    public Rol obtenerRol(String id) {
        Session ses= factory.openSession();
        try{
           int codigoI = Integer.parseInt(id);
           Rol rol= (Rol) ses.get(Rol.class,codigoI);
            ses.close();
        return rol;
        }
        catch(Exception e){
            ses.close();
            return null;
        }
     }
    
    
    
    public int modificarRol(Rol rol) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(rol);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
     }
    
    
    
    public int eliminarRol(String id){
        int filasAfectadas=0;
        Session ses= factory.openSession();
        int codigoI = Integer.parseInt(id);

        try{
        Rol rol= (Rol) ses.get(Rol.class,codigoI);
            if(rol!=null){
                Transaction tran= ses.beginTransaction();
                ses.delete(rol);
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
