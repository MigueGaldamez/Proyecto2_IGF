<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Usuarios</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
    <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Proveedor</h5>
                        <a type="button" class="btn-close" href="<spring:url value="/proveedores/list/"/>"></a>

                    </div>
                    <form:form action="create" method="POST" modelAttribute="proveedor">
                        <div class="modal-body">
                            <div class="row">
                                <div class=" col">

                                    <div class="well well-sm">
                                        <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong>
                                    </div>
                                    <c:if test="${!empty proveedor.nombreProveedor}">
                                        <div class="form-group">
                                            <label for="idProveedor">Codigo del proveedor:</label>
                                            <div class="input-group">
                                                <form:input path="idProveedor" cssClass="form-control"/>
                                                <span class="input-group-addon"><span
                                                        class="glyphicon glyphicon-asterisk"></span></span>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="form-group">
                                        <label for="nombreProveedor">Nombre del Proveedor:</label>
                                        <div class="input-group">
                                            <form:input path="nombreProveedor" cssClass="form-control"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-asterisk"></span></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="contactoProveedor">Contacto del Proveedor:</label>
                                        <div class="input-group">
                                            <form:input path="contactoProveedor" cssClass="form-control"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-asterisk"></span></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="telefonoProveedor">Telefono del Proveedor:</label>
                                        <div class="input-group">
                                            <form:input path="telefonoProveedor" cssClass="form-control"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-asterisk"></span></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="correoProveedor">Correo:</label>
                                        <div class="input-group">
                                            <form:input path="correoProveedor" cssClass="form-control"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-asterisk"></span></span>
                                        </div>
                                    </div>
                                    <!--Inicio del Select-->
                                    <div class="form-group">
                                        <label for="estadoProveedor">Estado:</label>
                                        <div class="input-group">
                                            <select class="form-select" aria-label="Default select example">
                                                <option value="1">Activo</option>
                                                <option value="2">Inactivo</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!--Fin del Select-->

                                    <!--Inicio del Select-->
                                    <div class="form-group">
                                        <label for="tipoProveedor">Estado:</label>
                                        <div class="input-group">
                                            <select class="form-select" aria-label="Default select example">
                                                <option value="1">Activo</option>
                                                <option value="2">Inactivo</option>
                                            </select>
                                        </div>
                                    </div>   
                                    <!--Fin del Select-->
                                </div>
                            </div>  
                        </div>
                        <div class="modal-footer">
                            <c:if test="${ empty proveedor.nombreProveedor}">
                                <form:button class="btn btn-primary mt-4">Agregar Proveedor</form:button>
                            </c:if>
                            <c:if test="${! empty proveedor.nombreProveedor}">
                                <form:button class="btn btn-primary mt-4">Guardar cambios</form:button>
                            </c:if>
                            <a class="btn btn-danger mt-4" href="<spring:url value="/proveedores/list/"/>">Cancelar</a>
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
                    <h3>Lista de Proveedores</h3>
                </div>
                <!--Inicio boton modal-->
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Nuevo Proveedor
                </button>
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <div class="col">
                    <!--<a class="btn btn-primary btn-md" href="<spring:url value="/proveedores/create"/>"> Nuevo Usuario</a>
                    <br><br>-->
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>
                                <th>Id Proveedor</th>
                                <th>Nombre Proveedor</th>
                                <th>Contacto Proveedor</th>
                                <th>Telefono</th>
                                <th>Correo</th>
                                <th>Estado</th>
                                <th>Tipo</th>
                                <th>Operaciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listarProveedores}" var="Proveedor">
                                <tr>

                                    <td>${Proveedor.idProveedor}</td>
                                    <td>${Proveedor.nombreProveedor}</td>
                                    <td>${Proveedor.contactoProveedor}</td>
                                    <td>${Proveedor.telefonoProveedor}</td>
                                    <td>${Proveedor.correoProveedor}</td>
                                    <td>${Proveedor.estadoProveedor}</td>
                                    <td>${Proveedor.tipoProveedor}</td>
                                    <td colspan="2">
                                        <a class="btn btn-success btn-sm" id="botonEditar" href="<spring:url value="/proveedores/edit/${Proveedor.idProveedor}"/>">
                                            <span class="glyphicon glyphicon-edit"></span>Editar</a>
                                        <a class="btn btn-danger btn-sm" href="javascript:eliminar('${Proveedor.idProveedor}')">
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
            function eliminar(id) {
                if (confirm("¿Realmente desea eliminar este registro?")) {
                    var url = 'eliminar/' + id;
                    location.href = url;

                }
                ;
            }
            $(document).ready(function () {

                var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                    keyboard: false
                });


                var editando = document.getElementById('idProveedor');

                if (editando.value != "") {
                    myModal.show()
                }
                $("#botonEditar").click(function () {
                    ;
                });

            });


        </script>
    </body>
</html>
