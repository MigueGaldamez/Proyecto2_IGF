<%-- 
    Document   : listarParticipantes
    Created on : 06-nov-2021, 15:16:11
    Author     : Oscar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Participantes</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
     <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Participante</h5>
                <a type="button" class="btn-close" href="<spring:url value="/participantes/list/"/>"></a>
                
              </div>
                  <form:form action="create" method="POST" modelAttribute="participante">
              <div class="modal-body">
                <div class="row">
               
                  
                        <div class="well well-sm">
                            <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong>
                        </div>
                        <c:if test="${!empty participante.nombreParticipante}">
                            
                                    <form:input type="hidden" path="idParticipante" cssClass="form-control"/>
                        
                        </c:if>
                        <div class="form-group col-6">
                            <label for="nombreParticipante">Nombre del Participante:</label>
                            <div class="input-group">
                                <form:input path="nombreParticipante" cssClass="form-control"/>
                                <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group col-6">
                            <label for="apellidoParticipante">Apellido del Participante:</label>
                           <div class="input-group">
                                <form:input path="apellidoParticipante" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        
                        <div class="form-group col-6">
                            <label for="dui">Dui:</label>
                           <div class="input-group">
                                <form:input path="dui" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                               
                        <div class="form-group col-6">
                            <label for="nit">NIT:</label>
                           <div class="input-group">
                                <form:input path="nit" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>    
                        <div class=" col-6"> 
                            <div class="form-group">  
                                <label for="fechaNacimiento">Fecha de nacimiento:</label>
                                <div class="input-group">
                                <form:input path="fechaNacimiento" id="fechaNacimiento"  type="date" name="fechaNacimiento" class="form-control"
                                             value="${now}"
                                             min="2021-01-01" max="2021-12-31"></form:input> 
                                </div>
                             </div>
                        </div>
                        
                               
                        <div class="form-group col-6">
                            <label for="escolaridad">Escolaridad:</label>
                           <div class="input-group">
                                <form:input path="escolaridad" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                         
                        <div class="form-group">
                            <label for="lugarTrabajo">Lugar de Trabajo:</label>
                           <div class="input-group">
                                <form:input path="lugarTrabajo" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>    
                        
                        <div class="form-group">
                            <label for="telefonoParticipante">Telefono del Participante:</label>
                           <div class="input-group">
                                <form:input path="telefonoParticipante" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="correoParticipante">Correo del Participante:</label>
                           <div class="input-group">
                                <form:input path="correoParticipante" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                               
                       
                         
          
                
            </div>  
              </div>
              <div class="modal-footer">
                <c:if test="${ empty participante.nombreParticipante}">
                    <form:button class="btn btn-primary mt-4">Guardar</form:button>
                </c:if>
                <c:if test="${! empty participante.nombreParticipante}">
                    <form:button class="btn btn-primary mt-4">Editar</form:button>
                </c:if>
                <a class="btn btn-danger mt-4" href="<spring:url value="/participantes/list/"/>">Cancelar</a>
              </div>
             </form:form>
            </div>
          </div>
        </div>
        <!--FIN MODAL-->
        
        <!--fin de el primer contaioner-->
        <div class="container">
            <div class="my-3">
                <div class="row mt-2">
                    <h3>Lista de Participantes</h3>
                </div>
                <!--Inicio boton modal-->
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Nuevo Participante
                </button>
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <div class="col">
                    <!--<a class="btn btn-primary btn-md" href="<spring:url value="/participantes/create"/>"> Nuevo Participante</a>
                    <br><br>-->
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>
                                <th>DUI</th>
                               <th>Nombre Participante</th>
                               <th>Apellido Participante</th>
                               <th>Telefono</th>
                               <th>Correo</th>
                               <th>Opciones</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach items="${listarParticipantes}" var="Participante">
                                 <tr>
                                     
                                   <td>${Participante.dui}</td>
                                    <td>${Participante.nombreParticipante}</td>
                                    <td>${Participante.apellidoParticipante}</td>
                                   <td>${Participante.telefonoParticipante}</td>
                                   <td>${Participante.correoParticipante}</td>
                                    <td colspan="2">
                                        <a class="btn btn-success btn-sm" id="botonEditar" href="<spring:url value="/participantes/edit/${Participante.idParticipante}"/>">
                                        <span class="glyphicon glyphicon-edit"></span>Editar</a>
                                         <a class="btn btn-danger btn-sm" href="javascript:eliminar('${Participante.idParticipante}')">
                                        <span class="glyphicon glyphicon-edit"></span>Eliminar</a>
                                    </td>
                                 </tr>
                             </c:forEach>
                         </tbody>
                    </table>
                </div>
            </div>
        </div>  
       <script>
            function eliminar(id){
                if(confirm("¿Realmente desea eliminar este registro?")){
                     var url= 'eliminar/'+id;
                     location.href=url;
                    
                };
             }
        $(document).ready(function(){
           $('#participantes_nav').addClass('active');
           $('#participante_nav').addClass('active');
           
            var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                keyboard: false
              });
          
           
            var editando = document.getElementById('idParticipante');
            
            if(editando.value != ""){
                  myModal.show()
            }
            $( "#botonEditar" ).click(function() {
              ;
            });

        });
       
       
        </script>
    </body>
</html>

