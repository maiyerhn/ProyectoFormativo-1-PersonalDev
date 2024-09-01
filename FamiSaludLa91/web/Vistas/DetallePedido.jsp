<%-- 
    Document   : DetallePedido
    Created on : 8/08/2024, 08:42:52 AM
    Author     : SENA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid encabezado">
            <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="/FamiSaludLa91/imagenes/logo9.png" alt="" class="me-2" style="max-width: 100px;"/>
                    </a>
                    <p class="navbar-text fs-3 fw-bold text-white mb-0">Famisalud la 91</p>
                    <a class="ms-auto" href="#">
                        <i class="bi bi-person-fill text-white fs-3"></i>
                    </a>                   
                </div>        
            </header>

            <div class="menu">
                <div class="Lista">
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=listarInventario" id="navbarDropdown">
                        Inventario
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=listar" id="navbarDropdown">
                        Productos
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrPedido?accion=listarped" id="navbarDropdown">
                        Pedidos
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrPro?accion=listarp" id="navbarDropdown">
                        Proveedores
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrCategorias?accion=listarCategorias" id="navbarDropdown">
                        Categorias
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrUsuario?accion=listarU" id="navbarDropdown">
                        Usuarios
                    </a>
                </div>
            </div>
        </div>
        <div class="detalle-pedido">
            <div class="d-flex justify-content-between align-items-center">
                <div class="volver">
                    <a href="javascript:history.back()"><i class="bi bi-arrow-left"></i></a>
                </div>
                <div class="fecha-hora">
                    <p class="mb-4"><strong>Fecha:</strong> ${fechaCompleta}</p>
                </div>
            </div>
            <h3>Detalle de Pedido</h3>
            <div class="pedido-info">
                <p><strong>ID:</strong> ${idPedido}</p>
                <p><strong>Nombre:</strong> ${usuario.nombre} ${usuario.apellido}</p>
                <p><strong>Dirección:</strong> ${usuario.direccion}</p>
            </div>
            <div class="productos">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Cantidad</th>
                            <th>Precio unitario</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="producto" items="${productos}" varStatus="pos" >
                            <c:set var="dped" value="${Lped[pos.index]}"/>
                            <tr>
                                <td>${producto.nombre}</td>
                                <td>${dped.cantidad}</td>
                                <td>${producto.precio}</td>
                                <td>${dped.total}</td>
                            </tr>
                            <c:set var="totalFinal" value="${totalFinal + dped.total}" />
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="total d-flex justify-content-between">
                <p><strong>Total a Pagar:</strong> $ ${totalFinal}</p> 
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
