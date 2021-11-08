<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Programas</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
     <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registrar Programa</h5>
                <a type="button" class="btn-close" href="<spring:url value="/programas/list/"/>"></a>

              </div>
                  <form:form action="create" method="POST" modelAttribute="programa">
              <div class="modal-body">
                <div class="row">
                <div class=" col">
                  
                        <div class="well well-sm">
                            <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong>
                        </div>
                        <c:if test="${!empty programa.nombrePrograma}">
                            <div class="form-group">
                                <label for="idPrograma">Codigo del programa:</label>
                                <div class="input-group">
                                    <form:input path="idPrograma" cssClass="form-control"/>
                                    <span class="input-group-addon"><span
                                   class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="nombrePrograma">Nombre del Programa:</label>
                            <div class="input-group">
                                <form:input path="nombrePrograma" cssClass="form-control"/>
                                <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descripcionPrograma">Descripcion del Programa:</label>
                           <div class="input-group">
                                <form:input path="descripcionPrograma" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                                <div class="form-group">
                                    <label for="estadoPrograma">Estado:</label>
                                    <div class="input-group">
                                        <form:select path="estadoPrograma" id="estadoPrograma" class="form-select" aria-label="Default select example">
                                            <option value="0">Inactivo</option>
                                            <option value="1">Activo</option>
                                        </form:select>
                                    </div>
                            </div>
                </div>
              </div>
          </div>
              <div class="modal-footer">
                <c:if test="${ empty programa.nombrePrograma}">
                    <form:button class="btn btn-primary mt-4">Registrar Programa</form:button>
                </c:if>
                <c:if test="${! empty programa.nombrePrograma}">
                    <form:button class="btn btn-primary mt-4">Guardar Cambios</form:button>
                </c:if>
                <a class="btn btn-danger mt-4" href="<spring:url value="/programas/list/"/>">Cancelar</a>
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
                    <h3>Lista de Programas</h3>
                </div>
                <!--Inicio boton modal-->
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Nuevo Programa
                </button>
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <div class="col">
                    <!--<a class="btn btn-primary btn-md" href="<spring:url value="/programas/create"/>"> Nuevo Programa</a>
                    <br><br>-->
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>
                               <th>Id Programa</th>
                               <th>Nombre</th>
                               <th>Descripcion</th>
                               <th>Estado</th>
                               <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach items="${listarProgramas}" var="Programa">
                                 <tr>
                                     
                                    <td>${Programa.idPrograma}</td>
                                    <td>${Programa.nombrePrograma}</td>
                                    <td>${Programa.descripcionPrograma}</td>
                                   <td>
                                        <c:if test="${Programa.estadoPrograma}">
                                            Activo
                                        </c:if>
                                        <c:if test="${!Programa.estadoPrograma}">
                                            Inactivo
                                        </c:if>
                                    </td>
                                    <td colspan="2">
                                        <a class="btn btn-success btn-sm" id="botonEditar" href="<spring:url value="/programas/edit/${Programa.idPrograma}"/>">
                                        <span class="glyphicon glyphicon-edit"></span>Editar</a>
                                         <a class="btn btn-danger btn-sm" href="javascript:eliminar('${Programa.idPrograma}')">
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
           
            var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                keyboard: false
              });
          
           
            var editando = document.getElementById('idPrograma');
            
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
