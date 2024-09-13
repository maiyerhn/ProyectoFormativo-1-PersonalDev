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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <title>Categorías - Famisalud la 91</title>       
    </head>
    <body>
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
            <h2 class="titulo-inventario text-center fw-bold titulos">Categorías</h2>
            <div class="input-group mb-3 d-flex justify-content-end">
                <div class="input-group-append">
                    <form class="d-flex" action="/FamiSaludLa91/CtrCategorias?accion=buscarCategoria" method="POST">
                        <input class="ms-0" type="search" name="busquedaCat" placeholder="Buscar productos..." aria-label="Buscar">
                        <button class="btn btn-outline-light bg-success me-2 fs-9" type="submit"><i class="bi bi-search"> Buscar </i></button>
                        <button class="btn btn-outline-light fs-9 bg-secondary" id="agg" type="button" data-bs-toggle="modal" data-bs-target="#crearCategoria">Agregar</button>
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
                                <a class="btn btn-primary" href="/FamiSaludLa91/CtrCategorias?accion=EditarCategoria&idc=${categoria.getId()}">
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

        <%-- modal de agregar Categorias --%>
        <div class="modal fade" id="crearCategoria" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Categoria</h1>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-sing" action="/FamiSaludLa91/CtrCategorias?accion=Agregar" method="POST">
                            <div class="row g-3">                               
                                <div class="col-md-6">
                                    <label for="txtnombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="txtnombre" name="txtnombre" placeholder="Ingrese nombre" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtdescripcion" class="form-label">Descripción</label>
                                    <input type="text" class="form-control" id="txtdescripcion" name="txtdescripcion" placeholder="Ingrese descripción" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtofertas" class="form-label">Ofertas</label>
                                    <input type="number" class="form-control" id="txtofertas" name="txtofertas" placeholder="Ingrese Oferta" required>
                                </div>
                            </div>
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-success" name="btnagregar" value="Agregar">Agregar <i class="bi bi-floppy"></i></button>
                                <a class="btn btn-secondary" name="regresar" href="/FamiSaludLa91/CtrCategorias?accion=listarCategorias">Regresar <i class="bi bi-box-arrow-left"></i></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%-- modal de editar Categorias --%>
        <div class="modal fade" id="editarCategoria" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Categoria</h1>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-sing" action="/FamiSaludLa91/CtrCategorias?accion=actualizarCategoria" method="POST">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="txtid" class="form-label">Id</label>actualizarCategoria
                                    <input type="number" class="form-control" id="txtid" name="txtid" value="${CategoriaE.getId()}" readonly required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtnombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="txtnombre" name="txtnombre" value="${CategoriaE.getNombre()}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtdescripcion" class="form-label">Descripción</label>
                                    <input type="text" class="form-control" id="txtdescripcion" name="txtdescripcion" value="${CategoriaE.getDescripcion()}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtofertas" class="form-label">Ofertas</label>
                                    <input type="number" class="form-control" id="txtofertas" name="txtofertas" value="${CategoriaE.getOfertas()}" required>
                                </div>
                            </div>
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-success" name="btnagregar" value="Agregar">Agregar <i class="bi bi-floppy"></i></button>
                                <a class="btn btn-secondary" name="regresar" href="/FamiSaludLa91/CtrCategorias?accion=listarCategorias">Regresar <i class="bi bi-box-arrow-left"></i></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/FamiSaludLa91/JSc/eliminarCategoria.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
        <script>
            $(document).ready(function () {

            <c:if test="${editarCat}">
                $('#editarCategoria').modal('show');
            </c:if>

            });
        </script>
    </body>
</html>
