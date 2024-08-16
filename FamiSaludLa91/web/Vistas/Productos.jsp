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
    </head>
    <body>


        <div class="container-fluid encabezado ">
            <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="/FamiSaludLa91/imagenes/logo9.png" alt="" class="me-2" />
                    </a>
                    <p class="navbar-text fs-3 fw-bold text-white text-start ms-3">Famisalud la 91</p>

                    <a class="nav-link nav-link-icon carrito ms-auto" href="#" data-bs-toggle="modal" data-bs-target="#ModalError">
                        <i class="bi bi-person-fill text-white fs-3"></i>
                    </a>                   
                </div>        
            </header>
            <div class="menu">
                <div class="Lista">
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=home" id="navbarDropdown">
                        Inicio
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=listar" id="navbarDropdown">
                        Productos
                    </a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">
                        Pedidos
                    </a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">
                        Proveedores
                    </a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">
                        Categorias
                    </a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">
                        Usuarios
                    </a>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <h2 class="titulo-inventario text-center fw-bold">Productos</h2>
            <div class="input-group mb-3 d-flex justify-content-end " >
                <div class="input-group-append">
                    <form class="d-flex ">
                        <input class="ms-0" type="search" placeholder="Buscar productos..." aria-label="Buscar">
                        <button class="btn btn-outline-light bg-success me-2 fs-9" type="submit"><i class="bi bi-search"> Buscar </i></button>
                        <button class="btn btn-outline-light bg-secondary fs-9" id="agg" type="button" data-bs-toggle="modal" data-bs-target="#agregarproducto">Agregar</button>     
                    </form>

                </div>
            </div>
            <!-- Utilizamos una clase en lugar de ID -->
            <table class="table table-bordered" style="box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3); border-radius: 10px;">
                <thead class="thead-light">
                    <tr style="background-color: white;">
                        <th class="text-center border">Nombre</th>
                        <th class="text-center border">Descripción</th>
                        <th class="text-center border">Precio</th>
                        <th class="text-center border">Foto</th>
                        <th class="text-center border">Categoría</th>
                        <th class="text-center border">Stock</th>
                        <th class="text-center border">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listar}" var="p" >
                        <tr>
                            <td class="border text-center"><label>${p.getNombre()}</label></td>
                            <td class="border text-center">${p.getDescripcion()}</td>
                            <td class="border text-center precio">${p.getPrecio()}</td>
                            <td class="border d-flex justify-content-center">
                                <img src="${p.getFoto()}" width="100" height="80" alt="Foto del producto">
                            </td>
                            <td class="border text-center">${p.getIdCategoria()}</td>
                            <td class="border text-center">${p.getStock()}</td>
                            <td class="border text-center">
                                <input type="hidden" name="id" id="id" value="${p.getId()}">
                                <a class="btn btn-primary" href="#" data-bs-toggle="modal" data-bs-target="#editarproducto">
                                    <i class="bi bi-pencil-fill"></i>
                                </a>
                                <a class="btn btn-danger" id="btneliminar" href="#">
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
                                    <label for="txtid" class="form-label">Id</label>
                                    <input type="number" class="form-control" id="txtid" name="txtid" placeholder="Ingrese ID" required>
                                </div>
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
                                        <c:forEach var="categ" items="${Categorias}">
                                            <option value="${categ.getId()}">${categ.getNombre()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="foto" class="form-label">Imagen</label>
                                    <input type="file" class="form-control" id="foto" name="foto" required>
                                </div>
                            </div>
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-success" name="btnagregar" value="Agregar">Agregar <i class="bi bi-floppy"></i></button>
                                <a class="btn btn-secondary" name="regresar" href="#">Regresar <i class="bi bi-box-arrow-left"></i></a>
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
                        <form class="form-sing" action="#" method="POST" enctype="multipart/form-data">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="txtnombre" class="form-label">Nombre</label>
                                    <input type="hidden" class="form-control" name="txtid" id="txtid" value="#">
                                    <input type="text" class="form-control" id="txtnombre" name="txtnombre" value="" placeholder="Ingrese nombre" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtprecio" class="form-label">Precio</label>
                                    <input type="number" class="form-control" id="txtprecio" name="txtprecio" value="#" placeholder="Ingrese precio" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtdescripcion" class="form-label">Descripción</label>
                                    <input type="text" class="form-control" id="txtdescripcion" name="txtdescripcion" value="" placeholder="Ingrese descripción" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtstock" class="form-label">Stock</label>
                                    <input type="number" class="form-control" id="txtstock" name="txtstock" value="#" placeholder="Ingrese disponibilidad" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="categoria" class="form-label">Categoría</label>
                                    <select class="form-select" id="categoria" name="categoria" onchange="actualizarInputOculto(this)">
                                        <c:forEach var="#" items="#">
                                            <option value="#">#</option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" class="form-control" name="#" id="cat" value="#">
                                </div>
                                <div class="col-md-6">
                                    <label for="foto" class="form-label">Imagen</label>
                                    <input type="file" class="form-control" id="foto" name="foto" onchange="actualizarInputOculto2(this)">
                                    <input type="hidden" class="form-control" value="#" name="foto2" id="foto2">
                                </div>
                            </div>
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-success" name="btnagregar" value="Agregar">Guardar <i class="bi bi-floppy"></i></button>
                                <a class="btn btn-secondary" name="regresar" href="#">Regresar <i class="bi bi-box-arrow-left"></i></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function actualizarInputOculto(selectElement) {
                var inputOculto = document.getElementById("cat");
                inputOculto.value = selectElement.value;
            }

            function actualizarInputOculto2(selectElement) {
                var inputOculto = document.getElementById("foto2");
                var filePath = selectElement.value;
                var fileName = filePath.split('\\').pop().split('/').pop();
                inputOculto.value = "Imagenes/" + fileName;
            }
        </script>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>