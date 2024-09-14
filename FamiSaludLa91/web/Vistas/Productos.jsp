<%-- 
    Document   : Productos
    Created on : 7/08/2024, 01:22:08 PM
    Author     : USUARIO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Productos - Famisalud la 91</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <link rel="icon" type="image/png" href="/FamiSaludLa91/imagenes/logo9.png">
    </head>
    <body>
        <%
            if (session.getAttribute("log") == null || session.getAttribute("log").equals('0') || session.getAttribute("rol").equals("CLIENTE")) {
                response.sendRedirect("/FamiSaludLa91/Vistas/Login.jsp");
            }
        %>

        <div class="container-fluid encabezado ">
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
                <nav class="menu">
                    <div class="Lista">
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=listarInventario&id=${id}" id="navbarDropdown">Inventario</a>
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=listar&id=${id}" id="navbarDropdown">Productos</a>
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrPedido?accion=listarped&id=${id}" id="navbarDropdown">Pedidos</a>
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrPro?accion=listarp&id=${id}" id="navbarDropdown">Proveedores</a>
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrCategorias?accion=listarCategorias&id=${id}" id="navbarDropdown">Categorías</a>
                        <a class="nav-link opciones" href="/FamiSaludLa91/CtrUsuario?accion=listarU&id=${id}" id="navbarDropdown">Usuarios</a>
                    </div>
                </nav>
            </div>
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
                    <a class="nav-link opciones"href="/FamiSaludLa91/CtrCategorias?accion=listarCategorias&id=${id}"  id="navbarDropdown">
                        Categorias
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrUsuario?accion=listarU&id=${id}" id="navbarDropdown">
                        Usuarios
                    </a>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <h2 class="titulo-inventario text-center fw-bold titulos">Productos</h2>
            <div class="input-group mb-3 d-flex justify-content-end " >
                <div class="input-group-append">
                    <form class="d-flex " action="/FamiSaludLa91/CtrProductos?accion=buscarpr">

                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <button class="btn btn-outline-light bg-secondary fs-9 me-2"  type="button" data-bs-toggle="dropdown" aria-expanded="false">Categorias</button> 
                                <ul class="dropdown-menu dropdown-menu-primary">
                                    <c:forEach var="cat" items="${Categorias}">
                                        <li><a class="dropdown-item" href="/FamiSaludLa91/CtrProductos?accion=buscarcat&catid=${cat.getId()}" >${cat.getNombre()}</a></li>
                                        <input type="hidden" value="${cat.getId()}" name="catid" id="catid">
                                    </c:forEach>
                                    <li><a class="dropdown-item" href="/FamiSaludLa91/CtrProductos?accion=listar" ><i></i> Todas</a></li>
                                </ul>
                            </li>
                        </ul>
                        <input class="ms-0" type="text" name="txtbuscar" placeholder="Buscar productos..." aria-label="Buscar">
                        <button type="submit" class="btn btn-outline-light bg-success me-2 fs-9" name="accion" value="buscarpr"><i class="bi bi-search"> Buscar </i></button>

                        <button class="btn btn-outline-light bg-secondary fs-9" id="agg" type="button" data-bs-toggle="modal" data-bs-target="#agregarproducto">Agregar</button>     
                    </form>

                </div>
            </div>
            <!-- Utilizamos una clase en lugar de ID -->
            <table class="table table-bordered" style="box-shadow: 5px 5px 15px rgb(0, 0, 0,.3);">
                <thead class="thead-light">
                    <tr style="background-color: white;">
                        <th class="text-center border">Nombre</th>
                        <th class="text-center border">Descripción</th>
                        <th class="text-center border">Precio</th>
                        <th class="text-center border">Foto</th>
                        <th class="text-center border">Categoría</th>
                        <th class="text-center border">Stock</th>
                        <th class="text-center border">Fecha Vencimiento</th>
                        <th class="text-center border">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listar}" var="p" >
                        <tr style="background-color: white">
                            <td class="border text-center"><label>${p.getNombre()}</label></td>
                            <td class="border text-center">${p.getDescripcion()}</td>
                            <td class="border text-center precio">${p.getPrecio()}</td>
                            <td class="border d-flex justify-content-center">
                                <img src="${p.getFoto()}" width="100" height="80" alt="Foto del producto">
                            </td>
                            <td class="border text-center">${p.getIdCategoria()}</td>
                            <td class="border text-center">${p.getStock()}</td>
                            <td class="border text-center">${p.getFechaVencimiento()}</td>
                            <td class="border text-center">
                                <input type="hidden" name="id" id="id" value="${p.getId()}">
                                <a class="btn btn-primary" href="/FamiSaludLa91/CtrProductos?accion=EditarProducto&idp=${p.getId()}">
                                    <i class="bi bi-pencil-fill"></i>
                                </a>
                                <a class="btn btn-danger"  href="#" data-bs-toggle="modal" data-bs-target="#eliminar" data-id="${p.getId()}">
                                    <i class="bi bi-trash-fill"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                <script>
                    var precios = document.querySelectorAll('.precio');
                    precios.forEach(function (precio) {
                        var valor = parseFloat(precio.textContent);
                        var valorFormateado = valor.toLocaleString('es-CO', {minimumFractionDigits: 0, maximumFractionDigits: 0, style: 'currency', currency: 'COP'});
                        precio.textContent = valorFormateado;
                    });
                </script>
                </tbody>
            </table>
        </div>

        <!-- Modal de Confirmación de Eliminación -->
        <div class="modal fade" id="eliminar" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirmar Eliminación</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ¿Estás seguro de que quieres eliminar este producto?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <a id="confirmDeleteBtn" class="btn btn-danger" href="#">Eliminar</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de Notificación -->
        <div class="modal fade" id="mensajeModal" tabindex="-1" aria-labelledby="mensajeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content bg-success text-light"> 
                    <div class="modal-header">
                        <h5 class="modal-title" id="mensajeModalLabel">Notificación</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="mensajeModalBody">
                    </div>
                </div>
            </div>
        </div>




        <%-- modal de agregar productos --%>
        <div class="modal fade" id="agregarproducto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Producto</h1>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-sing" action="/FamiSaludLa91/CtrProductos?accion=Agregar" method="POST" enctype="multipart/form-data">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="txtnombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="txtnombre" name="txtnombre" placeholder="Ingrese nombre" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtprecio" class="form-label">Precio</label>
                                    <input type="number" class="form-control" id="txtprecio" name="txtprecio" placeholder="Ingrese precio" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtdescripcion" class="form-label">Descripción</label>
                                    <input type="text" class="form-control" id="txtdescripcion" name="txtdescripcion" placeholder="Ingrese descripción" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtstock" class="form-label">Stock</label>
                                    <input type="number" class="form-control" id="txtstock" name="txtstock" placeholder="Ingrese disponibilidad" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="categoria" class="form-label">Categoría</label>
                                    <select class="form-select" id="categoria" name="categoria" required>
                                        <c:forEach var="cat" items="${Categorias}">
                                            <option value="${cat.getId()}">${cat.getNombre()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="foto" class="form-label">Imagen</label>
                                    <input type="file" class="form-control" id="foto" name="foto" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="proveedor" class="form-label">Proveedor</label>
                                    <select class="form-select" id="proveedor" name="proveedor" required>
                                        <c:forEach var="prov" items="${Proveedor}">
                                            <option value="${prov.getId()}">${prov.getNombre()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtfechavencimiento" class="form-label">Fecha de Vencimiento</label>
                                    <input type="date" class="form-control" id="txtfechavencimiento" name="txtfechavencimiento" required 
                                           min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>">
                                </div>
                            </div>
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-success" name="btnagregar" value="Agregar">Agregar <i class="bi bi-floppy"></i></button>
                                <a class="btn btn-secondary" name="regresar" href="/FamiSaludLa91/CtrProductos?accion=listar">Regresar <i class="bi bi-box-arrow-left"></i></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <%-- modal de editar productos --%>
        <div class="modal fade" id="editarproducto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Producto</h1>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-sing" action="/FamiSaludLa91/CtrProductos?accion=actualizarProducto" method="POST">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="txtnombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="txtnombre" name="txtnombre" value="${productoE.getNombre()}" placeholder="Ingrese nombre" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtprecio" class="form-label">Precio</label>
                                    <input type="number" class="form-control" id="txtprecio" name="txtprecio" value="${productoE.getPrecio()}" placeholder="Ingrese precio" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtdescripcion" class="form-label">Descripción</label>
                                    <input type="text" class="form-control" id="txtdescripcion" name="txtdescripcion" value="${productoE.getDescripcion()}" placeholder="Ingrese descripción" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtstock" class="form-label">Stock</label>
                                    <input type="number" class="form-control" id="txtstock" name="txtstock" value="${productoE.getStock()}" placeholder="Ingrese disponibilidad" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="categoria" class="form-label">Categoría</label>
                                    <input type="hidden" class="form-control" value="${productoE.getIdCategoria()}" name="categoria" id="categoria">
                                    <select class="form-select" id="categoria" name="categorias" onchange="actualizarInputOculto(this)">
                                        <c:forEach var="cat" items="${Categorias}">
                                            <option value="${cat.getId()}">${cat.getNombre()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="foto" class="form-label">Imagen</label>
                                    <input type="file" class="form-control" id="foto" name="foto" onchange="actualizarInputOculto2(this)">
                                    <input type="hidden" class="form-control" value="${productoE.getFoto()}" name="foto2" id="foto2">
                                </div>
                                <div class="col-md-6">
                                    <label for="proveedor" class="form-label">Proveedor</label>
                                    <input type="hidden" class="form-control" value="${productoE.getProveedor()}" name="proveedor" id="proveedor">
                                    <select class="form-select" id="proveedor" name="proveedores" onchange="actualizarInputOculto3(this)">
                                        <c:forEach var="prov" items="${Proveedor}">
                                            <option value="${prov.getId()}">${prov.getNombre()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="fechaVencimiento" class="form-label">Fecha de Vencimiento</label>
                                    <input type="date" class="form-control" id="fechaVencimiento" name="fechaVencimiento" required>
                                </div>
                            </div>
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-success" name="btnagregar" value="Agregar">Guardar <i class="bi bi-floppy"></i></button>
                                <a class="btn btn-secondary" name="regresar" href="/FamiSaludLa91/CtrProductos?accion=listar">Regresar <i class="bi bi-box-arrow-left"></i></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Script para restringir la fecha mínima -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var fechaVencimiento = document.getElementById('fechaVencimiento');
                var hoy = new Date().toISOString().split('T')[0];
                fechaVencimiento.setAttribute('min', hoy);
            });
        </script>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/FamiSaludLa91/JSc/eliminarProductos.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
        <script>
    $(document).ready(function () {

            <c:if test="${editarPro}">
        $('#editarproducto').modal('show');
            </c:if>

    });
        </script>
    </body>
</html>