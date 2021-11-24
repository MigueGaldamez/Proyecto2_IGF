<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
     <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
     
     
     
    <body>
        
        <!--fin de el primer contaioner-->
        <div class="container">
            <div class="my-3">
                <div class="row mt-2">
                    <h3>Bienvenido/a ${usr.nombreUsuario} ${usr.apellidoUsuario}</h3>
                </div>

            </div>
            <!--fin boton modal-->
            <div class="row">
                <div class="col-sm-12">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="card-title">SIFAFORP</h5>
                      <div class="row">
                          <div class="col-sm-6">
                              <p class="card-text">Desde el Sistema de Administrativo-Financiero Institucional del INSAFORP podrá realizar los siguientes procesos: </p>
                              <ol>
                                  <li>Gestión de programas de formación profesional</li>
                                  <li>Gestión de proveedores de formación profesional</li>
                                  <li>Presupuestación de los programas de capacitación, que debe incluir el aporte de fondos propios, fondos de entidades beneficiarias y financiamientos externos</li>
                                  <li>Control de ingresos y egresos relacionados a los programas de formación</li>
                                  <li>Registro de participantes en los programas de formación profesional y cada una de sus capacitaciones</li>
                                  
                              </ol>
                          </div>
                          <div class="col-sm-6">
                              <img class="h-100 img-fluid" width="100%" src="https://infowaresv.com/wp-content/uploads/2021/01/insaforp-1.png">
                          </div>
                          
                      </div>
                      
                    </div>
                  </div>
                </div>
             </div>
            <div class="row mt-4">
                <div class="col">
                    
                </div>
            </div>
        </div>  
        <script>

        $(document).ready(function(){
            
            $('#inicio_nav').addClass('active');

            });


        </script>
    </body>
</html>
