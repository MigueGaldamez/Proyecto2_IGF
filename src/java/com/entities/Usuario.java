package com.entities;
// Generated 10-28-2021 05:06:20 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Usuario generated by hbm2java
 */
@Entity
@Table(name="usuario"
    ,catalog="insaforp"
)
public class Usuario  implements java.io.Serializable {


     private int idUsuario;
     private Rol rol;
     private String nombreUsuario;
     private String apellidoUsuario;
     private String username;
     private String password;
     private String email;

    public Usuario() {
    }

	
    public Usuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    public Usuario(int idUsuario, Rol rol, String nombreUsuario, String apellidoUsuario, String username, String password, String email) {
       this.idUsuario = idUsuario;
       this.rol = rol;
       this.nombreUsuario = nombreUsuario;
       this.apellidoUsuario = apellidoUsuario;
       this.username = username;
       this.password = password;
       this.email = email; 
    }
   
     @Id 

    
    @Column(name="id_usuario", unique=true, nullable=false)
    public int getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_rol")
    public Rol getRol() {
        return this.rol;
    }
    
    public void setRol(Rol rol) {
        this.rol = rol;
    }

    
    @Column(name="nombre_usuario", length=50)
    public String getNombreUsuario() {
        return this.nombreUsuario;
    }
    
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    
    @Column(name="apellido_usuario", length=50)
    public String getApellidoUsuario() {
        return this.apellidoUsuario;
    }
    
    public void setApellidoUsuario(String apellidoUsuario) {
        this.apellidoUsuario = apellidoUsuario;
    }

    
    @Column(name="username", length=20)
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    
    @Column(name="password", length=200)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    
    @Column(name="email", length=30)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }




}


