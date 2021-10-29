<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyecto IGF | Registrarse</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
      <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
    <body>
        <div class="container my-3">   
            <div class="card">
            <div class="row">
                <div class="col-7 px-5 pb-4 card-body">
                    
                        <h1 class="card-title">Registrarse</h1>
                        <form:form action="create" method="POST" modelAttribute="usuario">
                              <div class="row">
                            <div class="col form-group mb-3">
                               <label for="nombreUsuario">Nombre Usuario: <span class="text-danger"><b>*</b></span></label>
                               <div class="input-group">
                                   <form:input path="nombreUsuario" cssClass="form-control"/>
                                   <span class="input-group-addon"><span
                                  class="glyphicon glyphicon-asterisk"></span></span>
                               </div>
                           </div>
                           <div class="col form-group mb-3">
                               <label for="apellidoUsuario">Apellido Usuario: <span class="text-danger"><b>*</b></span></label>
                               <div class="input-group">
                                   <form:input path="apellidoUsuario" cssClass="form-control"/>
                                   <span class="input-group-addon"><span
                                  class="glyphicon glyphicon-asterisk"></span></span>
                               </div>
                           </div> 
                            <div class="form-group mb-3">
                               <label for="username">Alias: <span class="text-danger"><b>*</b></span></label>
                               <div class="input-group">
                                   <form:input path="username" cssClass="form-control"/>
                                   <span class="input-group-addon"><span
                                  class="glyphicon glyphicon-asterisk"></span></span>
                               </div>
                           </div>

                           <div class="col form-groupm mb-3">
                               <label for="password">Contraseña: <span class="text-danger"><b>*</b></span></label>
                               <div class="input-group">
                                   <form:input path="password" type="password" cssClass="form-control"/>
                                   <span class="input-group-addon"><span
                                  class="glyphicon glyphicon-asterisk"></span></span>
                               </div>
                           </div>
                            <div class="col form-group mb-3">
                               <label for="confirmarContrasenia">Confirmar Contraseña: <span class="text-danger"><b>*</b></span></label>
                               <div class="input-group">
                                   <input id="confirmarContrasenia" type="password" Class="form-control"/>
                                   <span class="input-group-addon"><span
                                  class="glyphicon glyphicon-asterisk"></span></span>
                               </div>
                           </div>
                            <div class="form-group mb-3">
                                <label for="email">Correo: <span class="text-danger"><b>*</b></span></label>
                               <div class="input-group">
                                   <form:input path="email" type="email" Class="form-control"/>
                                   <span class="input-group-addon"><span
                                  class="glyphicon glyphicon-asterisk"></span></span>
                               </div>
                            </div>
                              </div>
                                  
                                    <c:if test="${!empty errores}">
                                         <div class="w-100 ">
                                        
                                        <span class="text-danger"><b>${errores}</b></span>
                                         </div>
                                    </c:if>
                                  
                    <form:button class="btn btn-primary mt-3">Registrarse</form:button>
                    <a class="btn btn-danger mt-3" >Cancelar</a>
                        </form:form>
                        
                </div>
                <div class="col-5 bg-dark p-0">
                     <img class="h-100 img-fluid" src="https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/130238819/original/d4096d4950eba421600f21c6c753c19375222eb6/draw-you-a-landscape-image-with-ms-paint.png">

                </div>
            </div>
            </div>
        </div
    </body>
</html>
