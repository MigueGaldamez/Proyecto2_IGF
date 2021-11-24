
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Curso</h5>
                <a type="button" class="btn-close" href="<spring:url value="/cursos/list/"/>"></a>
                
              </div>
                  <form:form action="create" method="POST" modelAttribute="curso">
              <div class="modal-body px-4">
                <div class="row">
                   
                        <c:if test="${!empty curso.nombreCurso}">
                             <div class=" col-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <form:input type="hidden" path="idCurso" cssClass="form-control"/>
                                    <span class="input-group-addon"><span
                                   class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                            </div>
                        </c:if>
                    <div class=" col-6">
                            <div class="form-group">
                                <label for="nombreCurso">Nombre de curso </label>
                               <div class="input-group">
                                    <form:input path="nombreCurso" cssClass="form-control"/>
                                   <span class="input-group-addon"><span
                                   class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                        </div>
                        
                     <div class=" col-6">
                        <div class="form-group">
                            <label for="local">Local</label>
                            <div class="input-group">

                                <form:select path="local.idLocal" class="form-select" aria-label="Default select example">
                                    <option selected disabled >Menú de Local</option>

                                    <c:forEach items="${listarLocales}" var="Local">

                                        <option value="${Local.idLocal}"
                                                <c:if test="${ curso.local.idLocal == Local.idLocal }">
                                                    selected="selected"
                                                </c:if>>${Local.nombreLocal}</option>
                                    </c:forEach>

                                </form:select>
                            </div>
                        </div>
                     </div>     
                     <div class=" col-6">
                        <div class="form-group">
                                 <label for="programa">Programa</label>
                                 <div class="input-group">

                                     <form:select path="programa.idPrograma" class="form-select" aria-label="Default select example">
                                         <option selected disabled >Menú de Programa</option>

                                         <c:forEach items="${listarProgramas}" var="Programa">

                                             <option value="${Programa.idPrograma}"
                                                     <c:if test="${ curso.programa.idPrograma == Programa.idPrograma }">
                                                         selected="selected"
                                                     </c:if>>${Programa.nombrePrograma}</option>
                                         </c:forEach>

                                     </form:select>
                                 </div>
                        </div>  
                      </div>       
                      <div class=" col-6">
                        <div class="form-group">
                                 <label for="proveedor">Proveedor</label>
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
                      </div>
                        
                        
                        <div class=" col-6">
                             <div class="form-group">
                                <label for="estadoCurso">Estado:</label>
                                <div class="input-group">
                                    <form:select path="estadoCurso" id="estadoCurso" class="form-select" aria-label="Default select example">
                                        <option value="0">Activo</option>
                                        <option value="1">Inactivo</option>
                                    </form:select>
                                </div>
                            </div>
                         </div>
                         <div class=" col-6">
                        <div class="form-group">
                            <label for="curso">Curso prerequisito:</label>
                            <div class="input-group">
                                <form:select path="curso.idCurso" class="form-select" aria-label="Default select example">
                                    <option selected disabled >Menú de Curso</option>
                                    <option value="0"
                                        <c:if test="${ curso.curso.idCurso == 0 }">
                                            selected="selected"
                                        </c:if>>Sin prerequisito</option>
                                    <c:forEach items="${listarCursos}" var="Curso">

                                        <option value="${Curso.idCurso}"
                                                <c:if test="${ curso.curso.idCurso == Curso.idCurso }">
                                                    selected="selected"
                                                </c:if>>${Curso.nombreCurso}</option>
                                    </c:forEach>

                                </form:select>
                            </div>
                        </div>
                     </div> 
                         <div class=" col-6"> 
                        <div class="form-group">
                            <label for="cupo"> Cupo </label>
                           <div class="input-group">
                                <form:input path="cupo" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                                 
                        </div>
                        <div class=" col-6"> 
                            <div class="form-group">
                                <label for="duracionHoras"> Duración en hrs</label>
                               <div class="input-group">
                                    <form:input path="duracionHoras" cssClass="form-control"/>
                                   <span class="input-group-addon"><span
                                   class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                        </div>
                                   <c:set var="now" value="<%=new java.util.Date()%>" />
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${now}" var="now"/>
                        
                        
                               
                        <form:input path="fechaCreacion" id="fechaCreacion" type="hidden" name="fechaCreacion" class="form-control"
                                     value="${now}"></form:input>      
                            
                        <div class=" col-6"> 
                        <div class="form-group">
                            <label for="requisitos"> Requisitos</label>
                           <div class="input-group">
                                <form:textarea path="requisitos" cssClass="form-control"/>
                               <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>   
                        </div>
                        <div class=" col-6">
                            <div class="form-group">
                                <label for="descripcionCurso">Descripción del curso </label>
                               <div class="input-group">
                                    <form:textarea path="descripcionCurso" cssClass="form-control"/>
                                   <span class="input-group-addon"><span
                                   class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div> 
                         </div>
                         
                             
                         <div class=" col-6"> 
                            <div class="form-group">      
                                <label for="fechaInicioInscripcion">Fecha Inicio Incripcion</label>
                            <div class="input-group">
                            <form:input path="fechaInicioInscripcion" id="fechaInicioInscripcion"  type="date" name="fechaInicioInscripcion" class="form-control"></form:input>
                                </div>
                            </div>
                         </div>
                        <div class=" col-6"> 
                                <div class="form-group">         
                                <label for="fechaFinInscripcion">Fecha Fin Incripcion</label>
                                <div class="input-group">
                                <form:input path="fechaFinInscripcion" id="fechaFinInscripcion"  type="date" name="fechaFinInscripcion" class="form-control"></form:input>
                                </div>
                            </div>
                        </div>
                        <div class=" col-6"> 
                            <div class="form-group">  
                                <label for="fechaInicio">Fecha Inicio</label>
                                <div class="input-group">
                                <form:input path="fechaInicio" id="fechaInicio"  type="date" name="fechaInicio" class="form-control"></form:input>
                                </div>
                            </div>
                         </div>
                         <div class=" col-6"> 
                            <div class="form-group">  
                                <label for="fechaFin">Fecha Fin</label>
                                <div class="input-group">
                                <form:input path="fechaFin" id="fechaFin"  type="date" name="fechaFin" class="form-control"></form:input> 
                                </div>
                             </div>
                        </div>
                        
                        
            </div>  
              </div>
              <div class="modal-footer">
                <c:if test="${ empty curso.nombreCurso}">
                    <form:button class="btn btn-primary mt-4">Guardar</form:button>
                </c:if>
                <c:if test="${! empty curso.nombreCurso}">
                    <form:button class="btn btn-primary mt-4">Editar</form:button>
                </c:if>
                <a class="btn btn-danger mt-4" href="<spring:url value="/cursos/list/"/>">Cancelar</a>
              </div>
             </form:form>
            </div>
          </div>
        </div>
        </div>
        <!--FIN MODAL-->
        
        <!--fin de el primer contaioner-->
        <div class="container">
            <div class="my-3">
                <div class="row mt-2">
                    <h3>Lista de Cursos</h3>
                    <h3>hola ${cursoprueba}</h3>
                </div>
                <!--Inicio boton modal-->
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Nuevo Curso
                </button>
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <div class="col">
                    <!--<a class="btn btn-primary btn-md" href="<spring:url value="/cursos/create"/>"> Nuevo Usuario</a>
                    <br><br>-->
                    <table class="table table-striped table-bordered table-hover table-sm text-center table-responsive" id="tabla">
                        <thead class="table-dark">
                            <tr>
                               <th>Curso </th>
                               <th>Progama</th>
                               <th>Proveedor</th>
                               <th>Local </th>
                               <th>Estado</th>
                               
                               <th>Duracion Hrs</th>
                               <th>Requisito</th>
                               <th>Cupo</th>
                               <th>Última modificación</th>
                               
                               
                               <th>Operaciones</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach items="${listarCursos}" var="Curso">
                                 <tr>
                                    <td>${Curso.nombreCurso}</td>
                                    <td>${Curso.programa.nombrePrograma}</td>
                                    
                                    <td>${Curso.proveedor.nombreProveedor}</td>
                                    
                                    <td>${Curso.local.nombreLocal}</td>                            
                                    <td>
                                        <c:if test="${Curso.estadoCurso}">
                                            Inactivo
                                        </c:if>
                                        <c:if test="${!Curso.estadoCurso}">
                                            Activo
                                        </c:if>
                                    </td>
                                    
                                    <td>${Curso.duracionHoras}</td>
                                    <td>
                                        <c:if test="${!Curso.curso.nombreCurso.equals('')}">
                                            ${Curso.curso.nombreCurso}
                                        </c:if>
                                        <c:if test="${Curso.curso.nombreCurso == null}">
                                            -
                                        </c:if>
                                    </td>
                                    </td>
                                    <td>${Curso.cupo}</td>
                                    <td><fmt:formatDate pattern="dd-MM-yyyy" value="${Curso.fechaCreacion}" /></td>
                                   
                                    
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
            
            $('#cursos_nav').addClass('active');
           
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

