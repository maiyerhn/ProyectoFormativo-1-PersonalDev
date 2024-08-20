<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
        <title>Categorías - Famisalud la 91</title>
        <style>
            /* Estilo personalizado para Toastr */
            .toast-success {
                background-color: #28a745;
                color: white;
            }
            .toast-error {
                background-color: #dc3545;
                color: white;
            }
            .toast-info {
                background-color: #17a2b8;
                color: white;
            }
            .toast-warning {
                background-color: #ffc107;
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid encabezado">
            <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="/FamiSaludLa91/imagenes/logo9.png" alt="Logo" class="me-2"/>
                    </a>
                    <p class="navbar-text fs-3 fw-bold text-white text-start ms-3">Famisalud la 91</p>
                    <a class="nav-link nav-link-icon carrito ms-auto" href="#" data-bs-toggle="modal" data-bs-target="#ModalError">
                        <i class="bi bi-person-fill text-white fs-3"></i>
                    </a>
                </div>
            </header>
            <div class="menu">
                <div class="Lista">
                    <a class="nav-link opciones" href="" id="navbarDropdown">Inicio</a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=listar" id="navbarDropdown">Inventario</a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">Pedidos</a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">Proveedores</a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrCategorias?accion=listarCategorias" id="navbarDropdown">Categorías</a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">Usuarios</a>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <h2 class="titulo-inventario text-center fw-bold">Categorías</h2>
            <div class="input-group mb-3 d-flex justify-content-end">
                <div class="input-group-append">
                    <form class="d-flex">
                        <input class="ms-0" type="search" placeholder="Buscar productos..." aria-label="Buscar">
                        <button class="btn btn-outline-light bg-success me-2 fs-9" type="submit"><i class="bi bi-search"> Buscar </i></button>
                        <button class="btn btn-outline-light bg-success fs-9" id="agg" type="button" data-bs-toggle="modal" data-bs-target="#agregarproducto">Agregar</button>
                    </form>
                </div>
            </div>

            <table class="table table-bordered" style="box-shadow: 5px 5px 15px rgb(0, 0, 0, 0.3);">
                <thead class="thead-light">
                    <tr style="background-color: white;">
                        <th scope="col" class="text-center border">ID</th>
                        <th scope="col" class="text-center border">Nombre</th>
                        <th scope="col" class="text-center border">Descripción</th>
                        <th scope="col" class="text-center border">Ofertas</th>
                        <th scope="col" class="text-center border">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${categoria}" var="categoria">
                        <tr style="background-color: white;">
                            <td class="border text-center">${categoria.getId()}</td>
                            <td class="border text-center">${categoria.getNombre()}</td>
                            <td class="border text-center">${categoria.getDescripcion()}</td>
                            <td class="border text-center">${categoria.getOfertas()}</td>
                            <td class="text-center border">
                                <a class="btn btn-primary" href="#">
                                    <i class="bi bi-pencil-fill"></i>
                                </a>
                                <a class="btn btn-danger" href="#" data-bs-toggle="modal" data-bs-target="#eliminar" data-id="${categoria.getId()}">
                                    <i class="bi bi-trash-fill"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
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
                        ¿Estás seguro de que quieres eliminar esta categoría?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <a id="confirmDeleteBtn" class="btn btn-danger" href="#">Eliminar</a>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="/FamiSaludLa91/JSc/eliminarCategoria.js" type="text/javascript"></script>
    </body>
</html>
