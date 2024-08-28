<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
        <title>Usuarios - Famisalud la 91</title>
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
        <div class="container mt-5">
            <h2 class="titulo-inventario text-center fw-bold">Usuarios</h2>
            <div class="input-group mb-3 d-flex justify-content-end " >
                <div class="input-group-append">
                    <form class="d-flex ">
                        <input class="ms-0" type="text" name="txtbuscar" placeholder="Buscar usuarios..." aria-label="Buscar">
                        <button class="btn btn-outline-light bg-success me-2 fs-9" type="submit" name="accion" value="buscarus"><i class="bi bi-search"> Buscar </i></button>
                        <button class="btn btn-outline-light bg-secondary  fs-9" id="agg" type="button" data-bs-toggle="modal" data-bs-target="#agregarusuario">Agregar</button>      
                    </form>

                </div>
            </div>

            <table class="table table-bordered" style="box-shadow: 5px 5px 15px rgb(0, 0, 0, 0.3);">
                <thead class="thead-light">
                    <tr style="background-color: white;">
                        <th scope="col" class="text-center border">ID</th>
                        <th scope="col" class="text-center border">Nombre</th>
                        <th scope="col" class="text-center border">Apellidos</th>
                        <th scope="col" class="text-center border">Correo</th>
                        <th scope="col" class="text-center border">Teléfono</th>
                        <th scope="col" class="text-center border">Contraseña</th>
                        <th scope="col" class="text-center border">Dirección</th>
                        <th scope="col" class="text-center border">Rol</th>
                        <th scope="col" class="text-center border">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${listarUs}">
                        <tr style="background-color: white;">
                            <th scope="row" class="border">${u.getId()}</th>
                            <td class="border"><label>${u.getNombre()}</label></td>
                            <td class="border">${u.getApellido()}</td>
                            <td class="border">${u.getCorreo()}</td>
                            <td class="border">${u.getTelefono()}</td>
                            <td class="border">${u.getContrasena()}</td>
                            <td class="border">${u.getDireccion()}</td>
                            <td class="border">${u.getRol()}</td>
                            <td class="text-center border">
                                <a class="btn btn-primary" href="">
                                    <i class="bi bi-pencil-fill"></i>
                                </a>
                                <a class="btn btn-danger" href="#" >
                                    <i class="bi bi-trash-fill"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        
        <div class="modal fade" id="agregarusuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Usuario</h1>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body login-form">
                <form action="/FamiSaludLa91/CtrUsuario?accion=Agregar" method="GET">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="Nombre">Nombre</label>
                                <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingresa Nombre" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="Apellidos">Apellidos</label>
                                <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingresa Apellidos" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="Telefono">Telefono</label>
                                <input type="text" class="form-control"  name="telefono" id="telefono" placeholder="Ingresa Telefono" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="Direccion">Direccion</label>
                                <input type="text" class="form-control" name="direccion" id="direccion" placeholder="Ingresa Direccion" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="User">Usuario (E-mail)</label>
                                <input type="text" class="form-control" id="user" name="user" placeholder="Ingresa Usuario" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="password">Contraseña</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Ingresa Contraseña" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="password1">Confirmar Contraseña</label>
                                <input type="password" class="form-control" id="password1" name="password1" placeholder="Confirma Contraseña" required>
                            </div>
                            <div class="col-md-6 mb-3">
                            <label for="rol">Rol</label>
                                <select class="form-select" id="rol" name="rol" required>
                                    <option value="">Selecciona un rol</option>
                                    <option value="CLIENTE">Cliente</option>
                                    <option value="ADMINISTRADOR">Administrador</option>
                                </select>
                            </div>
                            <div class="col-md-12 mb-3">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="acceptTerms">
                                    <label class="form-check-label" for="acceptTerms">Aceptar Términos y Condiciones</label>
                                </div>
                            </div>
                        </div>
                        <div class="login-btn text-center mt-4">
                            <button type="submit" name="accion" value="Agregar" class="btn btn-success ingresar">Agregar</button>
                            <button type="button" id="btnCancelar" class="btn btn-danger botones"  id="cancelar">Cancelar</button>
                        </div>
                    </form>
            </div>
        </div>
    </div>
</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/FamiSaludLa91/JSc/Scripagregarusuario.js" type="text/javascript"></script>
    </body>
</html>
