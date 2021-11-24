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
        <title>Lista de Financiamientos</title>
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
                      <h5 class="modal-title" id="exampleModalLabel">Editar Financiamiento</h5>
                      <a type="button" class="btn-close" href="<spring:url value="/presupuestoingreso/${presupuesto}/list"/>"></a>   
                  </div>
                  
                      <form:form action="${action}"  method="POST" modelAttribute="detalle_financiamiento">
                          <div class="modal-body">
                              <div class="row">
                                  <div class=" col">
                                      <div class="well well-sm">
                                          <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong> 
                                      </div>
                                    
                                         <c:if test="${!empty detalle_financiamiento.fechaRegistro}">
                                      <!-- Atributo de idDetalleFinanciamieto tipo int --> 
                                      <div class="form-group">
                                          <div class="input-group">
                                              <form:input type="hidden" path="idDetalleFinanciamieto" cssClass="form-control"/>
                                              <span class="input-group-addon"><span
                                               class="glyphicon glyphicon-asterisk"></span></span>
                                          </div>
                                      </div>
                                        </c:if>
                                      
                                      <!-- Atributo de financiamiento tipo Financiamiento -->
                                       <div class="form-group">
                                           <label for="financiamiento">Financiamiento:</label>
                                           <div class="input-group">
                                               <!-- Select -->
                                               <form:select path="financiamiento.idFinanciamiento" id="financiamiento.idFinanciamiento" class="form-select" aria-label="Default select example">
                                                   <option selected disabled >Seleccionar financiamiento</option>
                                                   <c:forEach items="${listarFinanciamientos}" var="Financiamiento">
                                                       <option value="${Financiamiento.idFinanciamiento}"
                                                               <c:if test="${ detalle_financiamiento.financiamiento.idFinanciamiento == Financiamiento.idFinanciamiento }">
                                                                   selected="selected"   
                                                               </c:if>> ${Financiamiento.nombreFinanciamiento}</option>
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
                                               <form:input path="fechaRegistro" id="fechaRegistro" cssClass="form-control" type="hidden" name="fechaRegistro" value="${now}"/>
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
                              <c:if test="${ empty detalle_financiamiento.monto}">
                                  <form:button class="btn btn-primary mt-4">Guardar</form:button>
                              </c:if>
                                  
                                  <c:if test="${! empty detalle_financiamiento.monto}">
                                   <form:button class="btn btn-primary mt-4">Editar</form:button>   
                                  </c:if>
                                  <a class="btn btn-danger mt-4" href="<spring:url value="/presupuestoingreso/${presupuesto}/list"/>">Cancelar</a>
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
                    <h5 class="modal-title" id="exampleModalLabel">Agregar Detalle de financiamiento</h5>
                    <a type="button" class="btn-close" href="<spring:url value="/presupuestoingreso/${presupuesto}/list"/>"></a>   
                </div>

                    <form:form action="create"  method="POST" modelAttribute="detalle_financiamiento">
                        <div class="modal-body">
                            <div class="row">
                                <div class=" col">
                                    <div class="well well-sm">
                                        <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong> 
                                    </div>

                                       <c:if test="${!empty detalle_financiamiento.fechaRegistro}">
                                    <!-- Atributo de idDetalleFinanciamieto tipo int --> 
                                    <div class="form-group">
                                        <div class="input-group">
                                            <form:input type="hidden" path="idDetalleFinanciamieto" cssClass="form-control"/>
                                            <span class="input-group-addon"><span
                                             class="glyphicon glyphicon-asterisk"></span></span>
                                        </div>
                                    </div>
                                      </c:if>
                                    
                                    <!-- Atributo de financiamiento tipo Financiamiento -->
                                     <div class="form-group">
                                         <label for="financiamiento">Financiamiento:</label>
                                         <div class="input-group">
                                             <!-- Select -->
                                             <form:select path="financiamiento.idFinanciamiento" id="financiamiento.idFinanciamiento" class="form-select" aria-label="Default select example">
                                                 <option selected disabled >Seleccionar financiamiento</option>
                                                 <c:forEach items="${listarFinanciamientos}" var="Financiamiento">
                                                     <option value="${Financiamiento.idFinanciamiento}"
                                                             <c:if test="${ detalle_financiamiento.financiamiento.idFinanciamiento == Financiamiento.idFinanciamiento }">
                                                                 selected="selected"   
                                                             </c:if>> ${Financiamiento.nombreFinanciamiento}</option>
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
                                             <form:input path="fechaRegistro" id="fechaRegistro" cssClass="form-control" type="hidden" name="fechaRegistro" value="${now}" min="2021-01-01" max="2021-12-31"/>
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
                            <c:if test="${ empty detalle_financiamiento.monto}">
                                <form:button class="btn btn-primary mt-4">Guardar</form:button>
                            </c:if>

                                <c:if test="${! empty detalle_financiamiento.monto}">
                                 <form:button class="btn btn-primary mt-4">Editar</form:button>   
                                </c:if>
                                <a class="btn btn-danger mt-4" href="<spring:url value="/presupuestoingreso/${presupuesto}/list"/>">Cancelar</a>
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
                    <h3>Lista de Financiamientos</h3>
                </div>
                
                <!--Inicio boton modal-->
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                    Nuevo Financiamiento
                </button>
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <div class="col">
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>                               
                               <th>Financiamiento</th>
                               <th>Monto</th>
                               <th>Ultima modificación</th>
                               <th>Operaciones</th>
                            </tr>
                            
                        </thead>
                        <tbody>
                            
                            <c:forEach items="${listarDetalleFinanciamientos}" var="DetalleFinanciamiento">
                                <tr>
                                    <td>${DetalleFinanciamiento.financiamiento.nombreFinanciamiento}</td>
                                    <td>${DetalleFinanciamiento.monto}</td>
                                    <td>${DetalleFinanciamiento.fechaRegistro}</td>
                                    <td colspan="2">
                                        <a class="btn btn-success btn-sm" id="botonEditar" href="<spring:url value="/presupuestoingreso/${presupuesto}/edit/${DetalleFinanciamiento.idDetalleFinanciamieto}"/>">
                                        <span class="glyphicon glyphicon-edit"></span>Editar</a>
                                         <a class="btn btn-danger btn-sm" href="javascript:eliminar('${DetalleFinanciamiento.idDetalleFinanciamieto}')">
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
           $('#financiamientos_det_nav').addClass('active');
           
            var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                keyboard: false
              });
          
           
            var editando = document.getElementById('idDetalleFinanciamieto');
            
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