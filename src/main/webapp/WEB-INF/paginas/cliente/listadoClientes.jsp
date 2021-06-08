
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="es_AR"></fmt:setLocale>

    <section id="clientes">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-header">
                            <h4>Listado de Clientes</h4>
                        </div>
                        <table class="table table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Email</th>
                                    <th>Telefono</th>
                                    <th>Saldo</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cliente" items="${clientes}">
                                <tr>
                                    <td>${cliente.idCliente}</td>
                                    <td>${cliente.nombre}</td>
                                    <td>${cliente.apellido}</td>
                                    <td>${cliente.email}</td>
                                    <td>${cliente.telefono}</td>
                                    <td> <fmt:formatNumber value="${cliente.saldo}" type="currency"></fmt:formatNumber> </td>
                                        <td>
                                            <a href="${pageContentext.request.contextPath}/ServletControlador?accion=editar&idCliente=${cliente.idCliente}"
                                           class="btn btn-secondary">
                                            <i class="fas fa-angle-double-right"></i> Editar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- tarjetas para los totales -->
            <div class="col-md-3">
                <div class="card text-center bg-danger text-white mb-3">
                    <div class="card-header">
                        <h3>Saldo Total</h3>
                    </div>
                    <div class="card-body">
                        <h4 class="display-4">
                            <fmt:formatNumber value="${saldoTotal}" type="currency"></fmt:formatNumber>
                            </h4>
                        </div>
                    </div>
                            
                            
                    <div class="card text-center bg-success text-white mb-3">
                        <div class="card-header">
                            <h3>Total Clientes</h3>
                        </div>
                        <div class="card-body">
                            <h4 class="display-4">
                                <i class="fas fa-users"></i>
                                <br>
                            ${totalClientes}
                        </h4>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>
</section>