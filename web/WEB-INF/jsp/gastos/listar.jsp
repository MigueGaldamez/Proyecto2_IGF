<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Gastos</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
     <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Agregar Gasto</h5>
                <a type="button" class="btn-close" href="<spring:url value="/gastos/list/"/>"></a>
                
              </div>
                  <form:form action="create" method="POST" modelAttribute="gasto">
              <div class="modal-body">
                <div class="row">
                <div class=" col">
                  
                        <div class="well well-sm">
                            <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong>
                        </div>
                        <c:if test="${!empty gasto.nombreGasto}">
                            <div class="form-group">
                                <label for="idGasto">Codigo del Gasto:</label>
                                <div class="input-group">
                                    <form:input path="idGasto" cssClass="form-control"/>
                                    <span class="input-group-addon"><span
                                   class="glyphicon glyphicon-asterisk"></span></span>
                                </div>
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="nombreGasto">Nombre del Gasto:</label>
                            <div class="input-group">
                                <form:input path="nombreGasto" cssClass="form-control"/>
                                <span class="input-group-addon"><span
                               class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                       
                      
                        
          
                </div>
            </div>  
              </div>
              <div class="modal-footer">
                <c:if test="${ empty gasto.nombreGasto}">
                    <form:button class="btn btn-primary mt-4">Guardar</form:button>
                </c:if>
                <c:if test="${!empty gasto.nombreGasto}">
                    <form:button class="btn btn-primary mt-4">Editar</form:button>
                </c:if>
                <a class="btn btn-danger mt-4" href="<spring:url value="/gastos/list/"/>">Cancelar</a>
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
                    <h3>Lista de Gastos</h3>
                </div>
                <!--Inicio boton modal-->
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Nuevo gasto
                </button>
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <div class="col">
                    <!--<a class="btn btn-primary btn-md" href="<spring:url value="/roles/create"/>"> Nuevo Proveedor</a>
                    <br><br>-->
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>
                               <th>Codigo Gasto</th>
                               <th>Nombre Gasto</th>
                             
                               <th>Operaciones</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach items="${listarGastos}" var="Gasto">
                                 <tr>
                                     
                                    <td>${Gasto.idGasto}</td>
                                    <td>${Gasto.nombreGasto}</td>
                                  
                                    <td colspan="2">
                                        <a class="btn btn-success btn-sm" id="botonEditar" href="<spring:url value="/gastos/edit/${Gasto.idGasto}"/>">
                                        <span class="glyphicon glyphicon-edit"></span>Editar</a>
                                         <a class="btn btn-danger btn-sm" href="javascript:eliminar('${Gasto.idGasto}')">
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
           $('#gastos_nav').addClass('active');
           
            var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                keyboard: false
              });
          
           
            var editando = document.getElementById('idGasto');
            
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
