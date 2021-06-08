<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/e406cf489d.js" crossorigin="anonymous"></script>
        <title>Control de Clientes</title>
    </head>
    <body>

        <jsp:include page="WEB-INF/paginas/comunes/cabecero.jsp"></jsp:include>

        <jsp:include page="WEB-INF/paginas/comunes/botonesNavegacion.jsp"></jsp:include>  

        <jsp:include page="WEB-INF/paginas/cliente/listadoClientes.jsp"></jsp:include>

        <jsp:include page="WEB-INF/paginas/comunes/piePagina.jsp"></jsp:include>
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

    </body>
</html>
