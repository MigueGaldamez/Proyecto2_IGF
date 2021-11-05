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
               <a class="nav-link" aria-current="page" href="#">Inicio</a>
             </li>
             </li>
              <li class="nav-item">
               <a class="nav-link active" href="<spring:url value="/detalleGastos/list"/>">Detalle de gastos</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link active" href="<spring:url value="/usuarios/list"/>">Usuarios</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link active" href="<spring:url value="/roles/list"/>">Roles</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link active" href="<spring:url value="/proveedores/list"/>">Proveedores</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="#">Programas</a>
             </li>
              <li class="nav-item">
               <a class="nav-link " href="#">Cursos</a>
             </li>
             <li class="nav-item">
               <a class="nav-link active" href="<spring:url value="/gastos/list"/>">Gastos</a>
             </li>
             
              <li class="nav-item">
               <a class="nav-link" href="#">Presupuestacion</a>
             </li>
        </c:if>
        <c:if test="${empty usr}">
             <li class="nav-item">
               <a class="nav-link active" aria-current="page" href="<spring:url value="/"/>">Iniciar Sesión</a>
             </li>
             <li class="nav-item">
               <a class="nav-link active" href="<spring:url value="/registrar"/>">Registrarse</a>
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