<%-- 
    Document   : detalles
    Created on : 11-02-2021, 03:47:04 PM
    Author     : ML19039
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Presupuesto</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
    <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
    <body>
        <div class="container">
            <div class="my-3">
                <div class="row mt-2">
                    <h3>Presupuesto</h3>
                </div>

               
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <h4> Fuentes de financiamiento: </h4>
                <h5>Total financiamientos  <span class="badge bg-secondary">${totalFinanciamientos}</span></h5>
                <div class="col">
                   
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>
                               <th>Financiamiento</th>
                               <th>Última modificación</th>
                               <th>Monto</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach items="${conjuntoFinanciamientos}" var="DetalleFinanciamiento">
                                 <tr>
                                    <td>${DetalleFinanciamiento.financiamiento.nombreFinanciamiento}</td>
                                    <td>${DetalleFinanciamiento.fechaRegistro}</td>
                                    <td>${DetalleFinanciamiento.monto}</td>
                                 </tr>
                             </c:forEach>
                         </tbody>
                    </table>
                    
                    <a class="btn btn-primary" href="<spring:url value="/presupuestoingreso/${presupuesto}/list"/>">
                    Gestionar fuentes de financiamiento</a>
                </div>
            </div>
            
            
             <div class="row mt-4">
                 
                 <h4>Gastos: </h4>
                 <h5>Total gastos  <span class="badge bg-secondary">${totalGastos}</span></h5>
                 
                <div class="col mb-5">
                   
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>
                               <th>Gasto</th>
                               <th>Última modificación</th>
                               <th>Monto</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                             <c:forEach items="${conjuntoGastos}" var="DetalleGatos">
                                 <tr>
                                    <td>${DetalleGatos.gasto.nombreGasto}</td>
                                    <td>${DetalleGatos.fechaRegistro}</td>
                                    <td>${DetalleGatos.monto}</td>
                                 </tr>
                                
                             </c:forEach>
                         </tbody>
                    </table>
                    <a class="btn btn-primary" href="<spring:url value="/presupuestogasto/${presupuesto}/list"/>">
                    Gestionar gastos</a>
                </div>
            </div>
        </div>
    </body>
</html>
