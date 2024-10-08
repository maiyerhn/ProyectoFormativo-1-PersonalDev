<%-- 
    Document   : pedidos
    Created on : 7/08/2024, 10:22:12 AM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>pedidos - Famisalud la 91</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link rel="icon" type="image/png" href="/FamiSaludLa91/imagenes/logo9.png">

    </head>
    <body>
        <%
            if (session.getAttribute("log") == null || session.getAttribute("log").equals('0') || session.getAttribute("rol").equals("CLIENTE")) {
                response.sendRedirect("/FamiSaludLa91/Vistas/Login.jsp");
            }
        %>

        <div class="container-fluid encabezado">
            <div class="container-fluid encabezado">
                <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">
                            <img src="/FamiSaludLa91/imagenes/logo9.png" alt="Famisalud la 91" class="me-2" />
                        </a>
                        <p class="navbar-text fs-3 fw-bold text-white text-start ms-5">Famisalud la 91</p>
                        <div class="dropdown">
                            <a class="nav-link dropdown-toggle carrito" href="#" role="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-person-fill text-white fs-3"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                                <li>
                                    <form method="POST" action="/FamiSaludLa91/CtrValidar">
                                        <input type="hidden" name="accion" value="exit">
                                        <button type="submit" class="dropdown-item">Salir</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>                   
                </header>
            </div>
            <div class="menu">

                <div class="menu">
                    <div class="Lista">
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=listarInventario&id=${id}" id="navbarDropdown">
                            Inventario
                        </a>
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=listar&id=${id}" id="navbarDropdown">
                            Productos
                        </a>
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrPedido?accion=listarped&id=${id}" id="navbarDropdown">
                            Pedidos
                        </a>
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrPro?accion=listarp&id=${id}" id="navbarDropdown">
                            Proveedores
                        </a>
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrCategorias?accion=listarCategorias&id=${id}" id="navbarDropdown">
                            Categorias
                        </a>
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrUsuario?accion=listarU&id=${id}" id="navbarDropdown">
                            Usuarios
                        </a>
                    </div>
                </div>
            </div>
        </div>


        <div class="cuerpo">
            <div class="container mt-5">
                <h2 class="titulo-inventario text-center fw-bold titulos">Pedidos</h2>
                <div class="input-group mb-3 d-flex justify-content-end " >
                    <div class="input-group-append">
                        <form class="d-flex "  action="/FamiSaludLa91/CtrProductos?accion=buscarPedido" method="POST">
                            <input class="ms-0" type="search" placeholder="Buscar pedidos..." name="datoPedido" aria-label="Buscar">
                            <button class="btn btn-outline-light bg-success icono fs-9" type="submit" value="buscarPedido"><i class="bi bi-search"> Buscar </i></button> 
                        </form>

                    </div>
                </div>


                <div class="container mt-4">
                    <c:forEach var="ped" items="${listarped}" varStatus="status">
                        <c:set var="usuario" value="${usuarios[status.index]}"/>
                        <div class="pedido-card d-flex flex-column mb-3 p-3 border rounded bg-light">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="flex-grow-1">
                                    <p><strong>ID:</strong> ${ped.id}</p>
                                    <p><strong>Nombre:</strong> ${usuario.nombre} ${usuario.apellido}</p>
                                    <p><strong>Dirección:</strong> ${usuario.direccion}</p>
                                </div>
                                <div class="d-flex flex-column align-items-end ms-3">
                                    <select class="form-select" data-pedido-id="${ped.id}">
                                        <option value="Esperando" ${ped.estado == 'Esperando' ? 'selected' : ''}>Esperando</option>
                                        <option value="Enviado" ${ped.estado == 'Enviado' ? 'selected' : ''}>Enviado</option>
                                        <option value="Entregado" ${ped.estado == 'Entregado' ? 'selected' : ''}>Entregado</option>
                                    </select>
                                    <input type="hidden" value="${ped.id}" name="idPedido">
                                    <input type="hidden" value="${ped.fechaActual}" name="fechaCompleta">
                                    <a href="/FamiSaludLa91/CtrDetallePedido?accion=mostrar&idPedido=${ped.id}&fechaCompleta=${ped.fechaActual}"> <button class="btn btn-primary mt-2 redirect-btn" data-pedido-id="${ped.id}" >➔</button></a> 
                                    <p class="mt-2"><strong>Fecha:</strong> ${ped.fechaActual}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>

    </div>

   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script>
            document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.form-select').forEach(function(select) {
        select.addEventListener('change', function() {
            const pedidoId = this.dataset.pedidoId;
            const nuevoEstado = this.value;
            fetch('/FamiSaludLa91/CtrPedido?accion=actualizarEstado', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    id: pedidoId,
                    estado: nuevoEstado
                })
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    console.log("DataSucces");
                } else {
                    alert('Error al actualizar el estado. Por favor, inténtalo de nuevo.');
                }
            })
            .catch(error => {
                console.log('Detalles del error:', error);
                console.error('Error:', error.message);
                alert('Ocurrió un error inesperado. Por favor, inténtalo de nuevo.');
            })
        });
    });
});


        </script>
</body>
</html>