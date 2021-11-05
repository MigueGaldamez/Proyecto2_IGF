
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Cursos</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
     <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Agregar Curso</h5>
                <a type="button" class="btn-close" href="<spring:url value="/cursos/list/"/>"></a>
                
              </div>
                  <form:form action="create" method="POST" modelAttribute="curso">
              <div class="modal-body">
                <div class="row">
                <div class=" col">
                  
                      
                        <c:if test="${!empty curso.nombreCurso}">
                            <div class="form-group">
                                <label for="idCurso">Codigo del Curso:</label>
                                <div class="input-group">
                                    <form:input path="idCurso" cssClass="form-control"/>
                                    <span class="input-group-addon"><span
                                   class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                        </c:if>
                        
                        <div class="form-group">
                            <label for="curso">Curso prerequisito:</label>
                            <div class="input-group">
                                <form:input path="curso.idCurso" cssClass="form-control"/>
                                <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="local">Local:</label>
                           <div class="input-group">
                                <form:input path="local.idLocal" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                          <div class="form-group">
                            <label for="programa">Programa</label>
                           <div class="input-group">
                                <form:input path="programa.idPrograma" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                       
                        <div class="form-group">
                                 <label for="proveedor">proveedor</label>
                                 <div class="input-group">

                                     <form:select path="proveedor.idProveedor" class="form-select" aria-label="Default select example">
                                         <option selected disabled >Menú de Proveedores</option>

                                         <c:forEach items="${listarProveedores}" var="Proveedor">

                                             <option value="${Proveedor.idProveedor}"
                                                     <c:if test="${ curso.proveedor.idProveedor == Proveedor.idProveedor }">
                                                         selected="selected"
                                                     </c:if>>${Proveedor.nombreProveedor}</option>
                                         </c:forEach>

                                     </form:select>
                                 </div>
                             </div>  
                        <div class="form-group">
                            <label for="nombreCurso">Nombre de curso </label>
                           <div class="input-group">
                                <form:input path="nombreCurso" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="descripcionCurso">Descripcion Curso </label>
                           <div class="input-group">
                                <form:input path="descripcionCurso" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div> 
                               
                        <div class="form-group">
                                        <label for="estadoCurso">Estado:</label>
                                        <div class="input-group">
                                            <form:select path="estadoCurso" id="estadoCurso" class="form-select" aria-label="Default select example">
                                                <option value="0">Activo</option>
                                                <option value="1">Inactivo</option>
                                            </form:select>
                                        </div>
                        </div>
                               
                        <div class="form-group">
                            <label for="duracionHoras"> duracion en hrs</label>
                           <div class="input-group">
                                <form:input path="duracionHoras" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                               
                        <div class="form-group">
                            <label for="requisitos"> Requisitos</label>
                           <div class="input-group">
                                <form:input path="requisitos" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>   
                        
                        <div class="form-group">
                            <label for="cupo"> Cupo </label>
                           <div class="input-group">
                                <form:input path="cupo" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                           <div class="form-group">
                            <label for="fechaCreacion"> Fecha Creacion </label>
                           <div class="input-group">
                               
                                <form:input path="fechaCreacion" id="fechaCreacion"  type="date" name="fechaCreacion" class="form-control"
                                     value="${now}"
                                     min="2021-01-01" max="2021-12-31"></form:input>      
                            </div>
                        </div>
                       
                               
                        <label for="fechaInicioInscripcion">Fecha Inicio Incripcion</label>
                        <form:input path="fechaInicioInscripcion" id="fechaInicioInscripcion"  type="date" name="fechaInicioInscripcion" 
                                     value="${now}"
                                     min="2021-01-01" max="2021-12-31"></form:input>
                        
                        <label for="fechaFinInscripcion">Fecha Fin Incripcion</label>
                        <form:input path="fechaFinInscripcion" id="fechaFinInscripcion"  type="date" name="fechaFinInscripcion" 
                                     value="${now}"
                                     min="2021-01-01" max="2021-12-31"></form:input>
                        
                        <label for="fechaInicio">Fecha Inicio</label>
                        <form:input path="fechaInicio" id="fechaInicio"  type="date" name="fechaInicio" 
                                     value="${now}"
                                     min="2021-01-01" max="2021-12-31"></form:input>
                        
                        <label for="fechaFin">Fecha Fin</label>
                        <form:input path="fechaFin" id="fechaFin"  type="date" name="fechaFin" 
                                     value="${now}"
                                     min="2021-01-01" max="2021-12-31"></form:input> 
                        
                        
            </div>  
              </div>
              <div class="modal-footer">
                <c:if test="${ empty curso.nombreCurso}">
                    <form:button class="btn btn-primary mt-4">Guardar</form:button>
                </c:if>
                <c:if test="${! empty curso.nombreCurso}">
                    <form:button class="btn btn-primary mt-4">Editar</form:button>
                </c:if>
                <a class="btn btn-danger mt-4" href="<spring:url value="/curso/list/"/>">Cancelar</a>
              </div>
             </form:form>
            </div>
          </div>
        </div>
        </div>
        <!--FIN MODAL-->
        
        <!--fin de el primer contaioner-->
        <div class="container-fluid">
            <div class="my-3">
                <div class="row mt-2">
                    <h3>Lista de Cursos</h3>
                </div>
                <!--Inicio boton modal-->
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Nuevo Curso
                </button>
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <div class="col col-12">
                    <!--<a class="btn btn-primary btn-md" href="<spring:url value="/cursos/create"/>"> Nuevo Usuario</a>
                    <br><br>-->
                    <table class="table table-striped table-bordered table-hover table-sm text-center table-responsive" id="tabla">
                        <thead class="table-dark">
                            <tr>
                               <th>id Curso</th>
                               <th>Curso </th>
                               <th>Local </th>
                               <th>Progama</th>
                               
                               <th>Proveedor</th>
                               <th>Nombre Curso</th>
                               <th>Descripcion Curso</th>
                               <th>Estado Curso</th>
                               
                               <th>Duracion Hrs</th>
                               <th>Requisitos</th>
                               <th>Cupo</th>
                               <th>Fecha Creacion</th>
                               
                               <th>Fecha Inicio Inscripcion</th>
                               <th>Fecha Fin Inscripcions</th>
                               <th>Fecha Inicio</th>
                               <th>Fecha Fin</th>
                               
                               <th>Operaciones</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach items="${listarCursos}" var="Curso">
                                 <tr>
                                     
                                    <td>${Curso.idCurso}</td>
                                    <td>${Curso.curso.nombreCurso}</td>
                                    <td>${Curso.local.nombreLocal}</td>
                                    <td>${Curso.programa.nombrePrograma}</td>
                                    
                                    <td>${Curso.proveedor.nombreProveedor}</td>
                                    <td>${Curso.nombreCurso}</td>
                                    <td>${Curso.descripcionCurso}</td>                                  
                                    <td>
                                        <c:if test="${Curso.estadoCurso}">
                                            Inactivo
                                        </c:if>
                                        <c:if test="${!Curso.estadoCurso}">
                                            Activo
                                        </c:if>
                                    </td>
                                    
                                    <td>${Curso.duracionHoras}</td>
                                    <td>${Curso.requisitos}</td>
                                    <td>${Curso.cupo}</td>
                                    <td>${Curso.fechaCreacion}</td>
                                   
                                    
                                    <td>${Curso.fechaInicioInscripcion}</td>
                                    <td>${Curso.fechaFinInscripcion}</td>
                                    <td>${Curso.fechaInicio}</td>
                                    <td>${Curso.fechaFin}</td>
                                    <td colspan="2">
                                        <a class="btn btn-success btn-sm" id="botonEditar" href="<spring:url value="/cursos/edit/${Curso.idCurso}"/>">
                                        <span class="glyphicon glyphicon-edit"></span>Editar</a>
                                         <a class="btn btn-danger btn-sm" href="javascript:eliminar('${Curso.idCurso}')">
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
          
           
            var editando = document.getElementById('idCurso');
            
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

