<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Locales</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
    <jsp:include page="/WEB-INF/jsp/navbar.jsp"/>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Local</h5>
                        <a type="button" class="btn-close" href="<spring:url value="/locales/list/"/>"></a>

                    </div>
                    <form:form action="create" method="POST" modelAttribute="local">
                        <div class="modal-body">
                            <div class="row">
                                <div class=" col">

                                    <div class="well well-sm">
                                        <strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong>
                                    </div>
                                    <c:if test="${!empty local.nombreLocal}">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <form:input type="hidden" path="idLocal" cssClass="form-control"/>
                                                <span class="input-group-addon"><span
                                                        class="glyphicon glyphicon-asterisk"></span></span>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="form-group">
                                        <label for="nombreLocal">Nombre del Local:</label>
                                        <div class="input-group">
                                            <form:input path="nombreLocal" cssClass="form-control"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-asterisk"></span></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="descripcionLocal">Descripción:</label>
                                        <div class="input-group">
                                            <form:input path="descripcionLocal" cssClass="form-control"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-asterisk"></span></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ubicacion">Ubicacion:</label>
                                        <div class="input-group">
                                            <form:input path="ubicacion" cssClass="form-control"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-asterisk"></span></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="capacidad">Capacidad</label>
                                        <div class="input-group">
                                            <form:input path="capacidad" cssClass="form-control"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-asterisk"></span></span>
                                        </div>
                                    </div>
                                    <!--Inicio del Select-->
                                    <div class="form-group">
                                        <label for="estadoLocal">Estado:</label>
                                        <div class="input-group">
                                            <form:select path="estadoLocal" id="estadoLocal" class="form-select" aria-label="Default select example">
                                                <option value="0"
                                                        <c:if test="${ local.estadoLocal == false }">
                                                                selected="selected"
                                                        </c:if>>Inactivo</option>
                                                <option value="1"
                                                        <c:if test="${ local.estadoLocal == true }">
                                                                selected="selected"
                                                        </c:if>>Activo</option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <!--Fin del Select-->
                                </div>
                            </div>  
                        </div>
                        <div class="modal-footer">
                            <c:if test="${ empty local.nombreLocal}">
                                <form:button class="btn btn-primary mt-4">Agregar Local</form:button>
                            </c:if>
                            <c:if test="${! empty local.nombreLocal}">
                                <form:button class="btn btn-primary mt-4">Guardar cambios</form:button>
                            </c:if>
                            <a class="btn btn-danger mt-4" href="<spring:url value="/locales/list/"/>">Cancelar</a>
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
                    <h3>Lista de Locales</h3>
                </div>
                <!--Inicio boton modal-->
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Nuevo Local
                </button>
            </div>
            <!--fin boton modal-->
            <div class="row mt-4">
                <div class="col">
                    <!--<a class="btn btn-primary btn-md" href="<spring:url value="/locales/create"/>"> Nuevo Usuario</a>
                    <br><br>-->
                    <table class="table table-striped table-bordered table-hover table-sm text-center" id="tabla">
                        <thead class="table-dark">
                            <tr>
                                <th>Nombre Local</th>
                                <th>Descripcion</th>
                                <th>Ubicacion</th>
                                <th>Capacidad</th>
                                <th>Estado</th>
                                <th>Operaciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listarLocales}" var="Local">
                                <tr>
                                    <td>${Local.nombreLocal}</td>
                                    <td>${Local.descripcionLocal}</td>
                                    <td>${Local.ubicacion}</td>
                                    <td>${Local.capacidad}</td>
                                    <td>
                                        <c:if test="${Local.estadoLocal}">
                                            Activo
                                        </c:if>
                                        <c:if test="${!Local.estadoLocal}">
                                            Inactivo
                                        </c:if>
                                    </td>
                                    <td colspan="2">
                                        <a class="btn btn-success btn-sm" id="botonEditar" href="<spring:url value="/locales/edit/${Local.idLocal}"/>">
                                            <span class="glyphicon glyphicon-edit"></span>Editar</a>
                                        <a class="btn btn-danger btn-sm" href="javascript:eliminar('${Local.idLocal}')">
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
                
                $('#locales_nav').addClass('active');
                
                var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                    keyboard: false
                });


                var editando = document.getElementById('idLocal');

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
