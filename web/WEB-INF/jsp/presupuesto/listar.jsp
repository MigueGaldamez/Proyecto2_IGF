<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Presupuestos</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
     <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
     
     
     
    <body>

        <!--fin de el primer contaioner-->
        <div class="container">
            <div class="my-3">
                <div class="row mt-2">
                    <h3>Lista de Presupuestos</h3>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col">
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>
                               <th>Curso</th>
                               <th>Fecha</th>
                               <th>Financiamiento</th>
                                <th>Gasto</th>
                                <th>Operaciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listarPresupuesto}" var="Presupuesto">
                                <tr>

                                    <td>${Presupuesto.curso.nombreCurso}</td>
                                    <td>${Presupuesto.curso.fechaCreacion }</td>
                                    <td> 
                                        <c:forEach items="${totalFinanciamientos}" var="montosFinanc">
                                            <c:if test="${ Presupuesto.idPresupuesto == montosFinanc.presupuesto.idPresupuesto }">
                                                $ ${ montosFinanc.monto }
                                            </c:if>
                                        
                                        </c:forEach>
                                        
                                    </td>
                                    <td>
                                        <c:forEach items="${totalGastos}" var="montosGastos">
                                            <c:if test="${ Presupuesto.idPresupuesto == montosGastos.presupuesto.idPresupuesto }">
                                                 $ ${ montosGastos.monto }
                                            </c:if>
                                        
                                        </c:forEach>
                                    </td>
                                    <td colspan="2">
                                        <a class="btn btn-success btn-sm" id="botonEditar" href="<spring:url value="/presupuestos/detalles/${Presupuesto.idPresupuesto}"/>">
                                            <span class="glyphicon glyphicon-edit"></span>Gestionar presupuesto</a>
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
            
            $('#presupuestacion_nav').addClass('active');

                var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                    keyboard: false
                });


                var editando = document.getElementById('idUsuario');

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
