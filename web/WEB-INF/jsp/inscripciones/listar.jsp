<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Inscripciones</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
     <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Inscripcion</h5>
                <a type="button" class="btn-close" href="<spring:url value="/inscripciones/list/"/>"></a>
                
              </div>
                  <form:form action="create" method="POST" modelAttribute="incripcionCurso">
              <div class="modal-body">
                <div class="row">
                <div class=" col">
                  
                        <div class="well well-sm">
                            <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong>
                        </div>
                        <c:if test="${!empty incripcionCurso.fechaInscripcion}">
                            <div class="form-group">
                                <div class="input-group">
                                    <form:input type="hidden" path="idInscripcion" cssClass="form-control"/>
                                    <span class="input-group-addon"><span
                                   class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                        </c:if>
                       <div class="form-group">
                            <label for="participante">Participante:</label>
                            <div class="input-group">

                                <form:select path="participante.idParticipante" id="paticipante.idParticipante" class="form-select" aria-label="Default select example">
                                    <option selected disabled >Menú de Participantes</option>

                                    <c:forEach items="${listarParticipantes}" var="Participante">

                                        <option value="${Participante.idParticipante}"
                                                <c:if test="${ incripcionCurso.participante.idParticipante == Participante.idParticipante }">
                                                    selected="selected"
                                                </c:if>>${Participante.nombreParticipante}</option>
                                    </c:forEach>

                                </form:select>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="curso">Curso:</label>
                            <div class="input-group">
                                <form:select path="curso.idCurso" class="form-select" aria-label="Default select example">
                                    <option selected disabled >Menú de Curso</option>
                                    
                                       
                                    <c:forEach items="${listarCursos}" var="Curso">

                                        <option value="${Curso.idCurso}"
                                                <c:if test="${ incripcionCurso.curso.idCurso == Curso.idCurso }">
                                                    selected="selected"
                                                </c:if>>${Curso.nombreCurso}</option>
                                    </c:forEach>

                                </form:select>
                            </div>
                        </div>
                        <c:set var="now" value="<%=new java.util.Date()%>" />
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${now}" var="now"/>
                        
                        
                        <div class="form-group">
                            <label for="fechaInscripcion"> Fecha Inscripcion:</label>
                            <div class="input-group">
                               
                                <form:input path="fechaInscripcion" id="fechaInscripcion" type="date" name="fechaInscripcion" class="form-control"
                                     value="${now}"></form:input>      
                            </div>
                        </div>
                       
                        
                     
       
                </div>
            </div>  
              </div>
              <div class="modal-footer">
                <c:if test="${ empty incripcionCurso.fechaInscripcion}">
                    <form:button class="btn btn-primary mt-4">Guardar</form:button>
                </c:if>
                <c:if test="${! empty incripcionCurso.fechaInscripcion}">
                    <form:button class="btn btn-primary mt-4">Editar</form:button>
                </c:if>
                <a class="btn btn-danger mt-4" href="<spring:url value="/inscripciones/list/"/>">Cancelar</a>
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
                    <h3>Lista de Inscripciones</h3>
                </div>
                <!--Inicio boton modal-->
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Nueva Inscripcion
                </button>
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <div class="col">
                    <!--<a class="btn btn-primary btn-md" href="<spring:url value="/inscripciones/create"/>"> Nuevo Usuario</a>
                    <br><br>-->
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>
                               <th>Nombre Usuario</th>
                               <th>Nombre Curso</th>
                               <th>Fecha Inscripcion</th>
                           
                               <th>Operaciones</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach items="${listarInscripcionCursos}" var="Inscripcion">
                                 <tr>
                                    <td>${Inscripcion.participante.nombreParticipante}</td>
                                    <td>${Inscripcion.curso.nombreCurso}</td>
                                    <td>${Inscripcion.fechaInscripcion}</td>
                                   
                                    <td colspan="2">
                                        <!--<a class="btn btn-success btn-sm" id="botonEditar" href="<spring:url value="/inscripciones/edit/${Inscripcion.idInscripcion}"/>">
                                        <span class="glyphicon glyphicon-edit"></span>Editar</a>-->
                                         <a class="btn btn-danger btn-sm" href="javascript:eliminar('${Inscripcion.idInscripcion}')">
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
           $('#inscripcion_nav').addClass('active');
           
            var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                keyboard: false
              });
          
           
            var editando = document.getElementById('idInscripcion');
            
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
