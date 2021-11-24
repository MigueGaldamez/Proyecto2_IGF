
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Gastos</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
     <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
    <body>
        <c:set var="now" value="<%=new java.util.Date()%>" />
        <fmt:formatDate pattern="yyyy-MM-dd" value="${now}" var="now"/>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Editar gasto</h5>
                      <a type="button" class="btn-close" href="<spring:url value="/presupuestogasto/${presupuesto}/list"/>"></a>   
                  </div>
                  
                      <form:form action="${action}"  method="POST" modelAttribute="detalle_gasto">
                          <div class="modal-body">
                              <div class="row">
                                  <div class=" col">
                                      <div class="well well-sm">
                                          <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong> 
                                      </div>
                                    
                                         <c:if test="${!empty detalle_gasto.fechaRegistro}">
                                      <!-- Atributo de idDetalleGasto tipo int --> 
                                      <div class="form-group">
                                          <div class="input-group">
                                              <form:input type="hidden" path="idDetalleGasto" cssClass="form-control"/>
                                              <span class="input-group-addon"><span
                                               class="glyphicon glyphicon-asterisk"></span></span>
                                          </div>
                                      </div>
                                        </c:if>
                                      
                                      <!-- Atributo de gasto tipo Gasto -->
                                       <div class="form-group">
                                           <label for="gasto">Gasto:</label>
                                           <div class="input-group">
                                               <!-- Select -->
                                               <form:select path="gasto.idGasto" id="gasto.idGasto" class="form-select" aria-label="Default select example">
                                                   <option selected disabled >Seleccione el gasto</option>
                                                   <c:forEach items="${listarGastos}" var="Gasto">
                                                       <option value="${Gasto.idGasto}"
                                                               <c:if test="${ detalle_gasto.gasto.idGasto == Gasto.idGasto }">
                                                                   selected="selected"   
                                                               </c:if>> ${Gasto.nombreGasto}</option>
                                                  </c:forEach>
                                               </form:select>
                                               <!-- Fin del select -->
                                          </div>
                                       </div>
                                      
                                      <!-- Atributo de monto tipo BigDecimal -->
                                      <div class="form-group">
                                          <label for="monto">Monto:</label>
                                          <div class="input-group">
                                              <form:input path="monto" cssClass="form-control" type="number" step="0.5"/>
                                              <span class="input-group-addon"><span
                                                      class="glyphicon glyphicon-asterisk"></span></span>
                                          </div>
                                      </div>
                                      
                                       <!-- Atributo de fechaRegistro tipo Date -->        
                                       <div class="form-group">
                                           <div class="input-group">
                                               <form:input path="fechaRegistro" id="fechaRegistro" type="hidden" cssClass="form-control"  name="fechaRegistro" value="${now}" min="2021-01-01" max="2021-12-31"/>
                                               <span class="input-group-addon"><span
                                                       class="glyphicon glyphicon-asterisk"></span></span>
                                           </div>
                                               
                                       </div>
                                          
                                       <!-- Atributo de presupuesto tipo Presupuesto -->
                                       <div class="form-group">
                                           <div class="input-group">
                                               <!-- Select -->
                                               
                                               <form:input type="hidden" path="presupuesto.idPresupuesto" id="presupuesto.idPresupuesto" cssClass="form-control" value="${presupuesto}"/>
                                               <!-- Fin del select -->
                                           </div>
                                       </div>
                                   
                                      
                                  </div>
                              </div>
                          </div> 
                          
                          <div class="modal-footer">
                              <c:if test="${ empty detalle_gasto.monto}">
                                  <form:button class="btn btn-primary mt-4">Guardar</form:button>
                              </c:if>
                                  
                                  <c:if test="${! empty detalle_gasto.monto}">
                                   <form:button class="btn btn-primary mt-4">Editar</form:button>   
                                  </c:if>
                                  <a class="btn btn-danger mt-4" href="<spring:url value="/presupuestogasto/${presupuesto}/list"/>">Cancelar</a>
                          </div>
                          
                      </form:form>
              </div> 
          </div> 
        </div>
        <!--FIN MODAL-->
        
        <!-- Modal para agregar -->
        <div class="modal fade" id="exampleModal2"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Agregar Detalle de gasto</h5>
                      <a type="button" class="btn-close" href="<spring:url value="/presupuestogasto/${presupuesto}/list"/>"></a>   
                  </div>
                  
                      <form:form action="create"  method="POST" modelAttribute="detalle_gasto">
                          <div class="modal-body">
                              <div class="row">
                                  <div class=" col">
                                      <div class="well well-sm">
                                          <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong> 
                                      </div>
                                    
                                         <c:if test="${!empty detalle_gasto.fechaRegistro}">
                                      <!-- Atributo de idDetalleGasto tipo int --> 
                                      <div class="form-group">
                                          <div class="input-group">
                                              <form:input type="hidden" path="idDetalleGasto" cssClass="form-control"/>
                                              <span class="input-group-addon"><span
                                               class="glyphicon glyphicon-asterisk"></span></span>
                                          </div>
                                      </div>
                                        </c:if>
                                      
                                      <!-- Atributo de gasto tipo Gasto -->
                                       <div class="form-group">
                                           <label for="gasto">Gasto:</label>
                                           <div class="input-group">
                                               <!-- Select -->
                                               <form:select path="gasto.idGasto" id="gasto.idGasto" class="form-select" aria-label="Default select example">
                                                   <option selected disabled >Seleccione el gasto</option>
                                                   <c:forEach items="${listarGastos}" var="Gasto">
                                                       <option value="${Gasto.idGasto}"
                                                               <c:if test="${ detalle_gasto.gasto.idGasto == Gasto.idGasto }">
                                                                   selected="selected"   
                                                               </c:if>> ${Gasto.nombreGasto}</option>
                                                  </c:forEach>
                                               </form:select>
                                               <!-- Fin del select -->
                                          </div>
                                       </div>
                                      
                                      
                                      <!-- Atributo de monto tipo BigDecimal -->
                                      <div class="form-group">
                                          <label for="monto">Monto:</label>
                                          <div class="input-group">
                                              <form:input path="monto" cssClass="form-control" type="number" step="0.5"/>
                                              <span class="input-group-addon"><span
                                                      class="glyphicon glyphicon-asterisk"></span></span>
                                          </div>
                                      </div>
                                      
                                       <!-- Atributo de fechaRegistro tipo Date -->        
                                       <div class="form-group">
                                           <div class="input-group">
                                               <form:input type="hidden" path="fechaRegistro" id="fechaRegistro" cssClass="form-control" name="fechaRegistro" value="${now}" min="2021-01-01" max="2021-12-31"/>
                                               <span class="input-group-addon"><span
                                                       class="glyphicon glyphicon-asterisk"></span></span>
                                           </div>
                                               
                                       </div>
                                                  
                                       
                                        
                                       <!-- Atributo de presupuesto tipo Presupuesto -->
                                       <div class="form-group">
                                           <div class="input-group">
                                               <!-- Select -->
                                               
                                               <form:input type="hidden" path="presupuesto.idPresupuesto" id="presupuesto.idPresupuesto" cssClass="form-control" value="${presupuesto}"/>
                                               <!-- Fin del select -->
                                           </div>
                                       </div>
                                   
                                      
                                  </div>
                              </div>
                          </div> 
                          
                          <div class="modal-footer">
                              <c:if test="${ empty detalle_gasto.monto}">
                                  <form:button class="btn btn-primary mt-4">Guardar</form:button>
                              </c:if>
                                  
                                  <c:if test="${! empty detalle_gasto.monto}">
                                   <form:button class="btn btn-primary mt-4">Editar</form:button>   
                                  </c:if>
                                  <a class="btn btn-danger mt-4" href="<spring:url value="/presupuestogasto/${presupuesto}/list"/>">Cancelar</a>
                          </div>
                          
                      </form:form>
              </div> 
          </div> 
        </div>
        <!--FIN MODAL para agregar-->
        <!--fin de el primer contaoner-->
        
        <div class="container">
            <div class="my-3">
                <div class="row mt-2">
                    <h3>Lista de Gastos</h3>
                </div>
                
                <!--Inicio boton modal-->
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                    Nuevo gasto
                </button>
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <div class="col">
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>                               
                               <th>Gasto</th>
                               <th>Monto</th>
                               <th>Ultima modificiación</th>
                               <th>Operaciones</th>
                            </tr>
                            
                        </thead>
                        <tbody>
                            
                            <c:forEach items="${listarDetalleGastos}" var="DetalleGasto">
                                <tr>
                                    <td>${DetalleGasto.gasto.nombreGasto}</td>
                                    <td>${DetalleGasto.monto}</td>
                                    <td>${DetalleGasto.fechaRegistro}</td>
                                    <td colspan="2">
                                        <a class="btn btn-success btn-sm" id="botonEditar" href="<spring:url value="/presupuestogasto/${presupuesto}/edit/${DetalleGasto.idDetalleGasto}"/>">
                                        <span class="glyphicon glyphicon-edit"></span>Editar</a>
                                         <a class="btn btn-danger btn-sm" href="javascript:eliminar('${DetalleGasto.idDetalleGasto}')">
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
           
           $('#administracion_nav').addClass('active');
           $('#gastos_det_nav').addClass('active');
           
            var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                keyboard: false
              });
          
           
            var editando = document.getElementById('idDetalleGasto');
            
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
                    
          