<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Detalle de gastos</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
     <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Agregar Detalle de gasto</h5>
                      <a type="button" class="btn-close" href="<spring:url value="/detalleGastos/list/"/>"></a>   
                  </div>
                  
                      <form:form action="create" method="POST" modelAttribute="detalle_gasto">
                          <div class="modal-body">
                              <div class="row">
                                  <div class=" col">
                                      <div class="well well-sm">
                                          <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong> 
                                      </div>
                                      
                                      <!-- Atributo de idDetalleGasto tipo int --> 
                                      <div class="form-group">
                                          <label for="idDetalleGasto">Codigo de detalle gasto:</label>
                                          <div class="input-group">
                                              <form:input path="idDetalleGasto" cssClass="form-control"/>
                                              <span class="input-group-addon"><span
                                               class="glyphicon glyphicon-asterisk"></span></span>
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
                                           <label for="fechaRegistro">Fecha Registro:</label>
                                           <div class="input-group">
                                               <form:input path="fechaRegistro" id="fechaRegistro" cssClass="form-control" type="date" name="fechaRegistro" value="${now}" min="2021-01-01" max="2021-12-31"/>
                                               <span class="input-group-addon"><span
                                                       class="glyphicon glyphicon-asterisk"></span></span>
                                           </div>
                                               
                                       </div>
                                               
                                       <!-- Atributo de gasto tipo Gasto -->
                                       <div class="form-group">
                                           <label for="gasto">Gasto DetalleGasto</label>
                                           <div class="input-group">
                                               <!-- Select -->
                                               <form:select path="gasto.idGasto" id="gasto.idGasto" class="form-select" aria-label="Default select example">
                                                   <option selected disabled >Menú de Gastos</option>
                                                   <c:forEach items="${listarGastos}" var="Gasto">
                                                       <option value="${Gasto.idGasto}"
                                                               <c:if test="${ detalle_gasto.gasto.idGasto == Gasto.idGasto }">
                                                                   selected="selected"   
                                                               </c:if>${Gasto.nombreGasto}</option>
                                                  </c:forEach>
                                               </form:select>
                                               <!-- Fin del select -->
                                          </div>
                                       </div>
                                       
                                       <!-- Atributo de presupuesto tipo Presupuesto -->
                                       <div class="form-group">
                                           <label for="presupuesto">Presupuesto DetalleGasto</label>
                                           <div class="input-group">
                                               <!-- Select -->
                                               <form:select path="presupuesto.idPresupuesto" id="presupuesto.idPresupuesto" class="form-select" aria-label="Default select example">
                                                   <option selected disabled >Menú de Presupuesto</option>
                                                   <c:forEach items="${listarPresupuestos}" var="Presupuesto">
                                                       <option value="${Presupuesto.idPresupuesto}"
                                                               <c:if test="${ detalle_gasto.presupuesto.idPresupuesto == Presupuesto.idPresupuesto }">
                                                                   selected="selected"
                                                            </c:if>>${presupuesto.idPresupuesto} - ${presupuesto.fechaCreacion}</option>
                                 
                                                   </c:forEach>
                                              </form:select>
                                               <!-- Fin del select -->
                                           </div>
                                       </div>
                                   
                                      
                                  </div>
                              </div>
                          </div> 
                          <!--AQUI VA UN MODAAL FOOTER QUE NI IDEA COMO HAACERLOOOOO SE SUPONE QUE ES PARA LOS BOTONES-->
                          <div class="modal-footer">
                              <c:if test="${ empty DetalleGasto.idDetalleGasto}">
                                  <form:button class="btn btn-primary mt-4">Guardar</form:button>                  
                              </c:if>
                                  
                                  <c:if test="${! empty DetalleGasto.idDetalleGasto}">
                                   <form:button class="btn btn-primary mt-4">Editar</form:button>   
                                  </c:if>
                                  <a class="btn btn-danger mt-4" href="<spring:url value="/detalleGastos/list/"/>">Cancelar</a>
                          </div>
                          
                      </form:form>
              </div> 
          </div> 
        </div>
        <!--FIN MODAL-->
        <!--fin de el primer contaoner-->
        
        <div class="container">
            <div class="my-3">
                <div class="row mt-2">
                    <h3>Lista de Detalle de gastos</h3>
                </div>
                
                <!--Inicio boton modal-->
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Nuevo Detalle de gasto
                </button>
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <div class="col">
                    <!--<a class="btn btn-primary btn-md" href="<spring:url value="/detalleGastos/create"/>"> Nuevo Detalle de gasto</a>
                    <br><br>-->
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>
                               <th>Codigo de dellate gasto</th>
                               <th>Presupuesto</th>
                               <th>Gasto</th>
                               <th>Monto</th>
                               <th>Fecha de registro</th>
                               <th>Operaciones</th>
                            </tr>
                            
                        </thead>
                        <tbody>
                            <c:forEach items="${listarDetalleGastos}" var="DetalleGasto">
                                <tr>
                                    <td>${DetalleGasto.idDetalleGasto}</td>
                                    <td>${DetalleGasto.gasto.nombreGasto}</td>
                                    <td>${DetalleGasto.presupuesto.idPresupuesto}</td>  <!--DUDA ACÁ-->
                                    <td>${DetalleGasto.monto}</td>
                                    <td>${DetalleGasto.fechaRegistro}</td>
                                    <td colspan="2">
                                        <a class="btn btn-success btn-sm" id="botonEditar" href="<spring:url value="/detalleGastos/edit/${DetalleGasto.idDetalleGasto}"/>">
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
                    
          