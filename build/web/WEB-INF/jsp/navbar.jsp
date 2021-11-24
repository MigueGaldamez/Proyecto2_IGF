<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">SIFAFORP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
   
    <div class="collapse navbar-collapse" id="navbarText">
        
   
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          
        
            
        
        <c:if test="${! empty usr}">
            <li class="nav-item">
               <a id="inicio_nav" class="nav-link" aria-current="page" href="<spring:url value="/"/>">Inicio</a>
             </li>
             </li>
             <!--
              <li class="nav-item">
               <a class="nav-link active" href="<spring:url value="/detalleGastos/list"/>">Detalle de gastos</a>
             </li>

             <li class="nav-item">
                 <a class="nav-link active" href="<spring:url value="/usuarios/list"/>">Usuarios</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link active" href="<spring:url value="/roles/list"/>">Roles</a>
             </li>-->
             <c:if test="${ usr.rol.nombreRol == 'Administrador'}">
                <li class="nav-item">
                    <a id="proveedores_nav" class="nav-link" href="<spring:url value="/proveedores/list"/>">Proveedores</a>
                </li>
                <li class="nav-item">
                    <a id="locales_nav" class="nav-link" href="<spring:url value="/locales/list"/>">Locales</a>
                </li>
                <li class="nav-item">
                  <a id="programas_nav" class="nav-link" href="<spring:url value="/programas/list"/>">Programas</a>
                </li>
                 <li class="nav-item">
                  <a id="cursos_nav" class="nav-link " href="<spring:url value="/cursos/list"/>">Cursos</a>
                </li>
                <li class="nav-item dropdown">
                    <a id="acceso_nav" class="nav-link dropdown-toggle" href="#" id="navAc" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Acceso
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navAc">
                      <li><a id="usuario_nav" class="dropdown-item text-dark"  href="<spring:url value="/usuarios/list"/>">Usuarios</a></li>
                      <li><a id="roles_nav" class="dropdown-item text-dark"  href="<spring:url value="/roles/list"/>">Roles</a></li>


                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a id="administracion_nav" class="nav-link dropdown-toggle" href="#" id="navAd" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Administracion
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navAd">
                        <li><a id="financiamientos_nav" class="dropdown-item text-dark" href="<spring:url value="/financiamientos/list"/>">Financiamientos</a></li>
                        <li><a id="gastos_nav" class="dropdown-item text-dark"  href="<spring:url value="/gastos/list"/>">Gastos</a></li>
                        <!--<li><hr class="dropdown-divider"></li>-->
                        <!--<li><a id="gastos_det_nav" class="dropdown-item text-dark" href="<spring:url value="/detalleGastos/list"/>">Detalle de gastos</a></li>-->
                    </ul>
                </li>
                <li class="nav-item">
                    <a id="presupuestacion_nav" class="nav-link"href="<spring:url value="/presupuestos/list"/>">Presupuestacion</a>
                </li>
                <li class="nav-item dropdown">
                    <a id="participantes_nav" class="nav-link dropdown-toggle" href="#" id="navAd" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Participantes
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navAd">
                        <li class="nav-item">
                            <a id="participante_nav" class="dropdown-item text-dark" href="<spring:url value="/participantes/list"/>">Gestionar participantes</a>
                        </li>
                        <li class="nav-item">
                            <a id="inscripcion_nav" class="dropdown-item text-dark" href="<spring:url value="/inscripciones/list"/>">Inscribir participante a curso</a>
                        </li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${ usr.rol.nombreRol == 'Contador'}">
                <li class="nav-item">
                    <a id="presupuestacion_nav" class="nav-link"href="<spring:url value="/presupuestos/list"/>">Presupuestacion</a>
                </li>
            </c:if>
                
            <c:if test="${ usr.rol.nombreRol == 'Secretaria'}">
                <li class="nav-item dropdown">
                    <a id="participantes_nav" class="nav-link dropdown-toggle" href="#" id="navAd" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Participantes
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navAd">
                        <li class="nav-item">
                            <a id="participante_nav" class="dropdown-item text-dark" href="<spring:url value="/participantes/list"/>">Gestionar participantes</a>
                        </li>
                        <li class="nav-item">
                            <a id="inscripcion_nav" class="dropdown-item text-dark" href="<spring:url value="/inscripciones/list"/>">Inscribir participante a curso</a>
                        </li>
                    </ul>
                </li>
                
            </c:if>
             
                
            
            
             
             
             
        </c:if>
        <c:if test="${empty usr}">
             <li class="nav-item">
               <a class="nav-link active" aria-current="page" href="<spring:url value="/login"/>">Iniciar Sesión</a>
             </li>
        </c:if>
      </ul>
       <c:if test="${! empty usr}">
      <span class="navbar-text py-0">
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                ${usr.nombreUsuario}
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li><a class="dropdown-item text-dark" href="#">Perfil</a></li>
                <li><a class="dropdown-item text-dark" href="#">configuracion</a></li>
                 <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item text-dark" href="<spring:url value="/cerrarSesion"/>">Salir</a></li>
              </ul>
            </li>
          </ul>
      </span>
      </c:if>
    </div>
  </div>
</nav>

<nav class="navbar fixed-bottom navbar-dark bg-dark py-0">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Copy Right</a>
  </div>
</nav>