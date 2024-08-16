<%-- 
    Document   : Inventario
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
        <title>Inventario - Famisalud la 91</title>
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
                        inventario
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
            <h2 class="titulo-inventario text-center fw-bold">Inventario</h2>
            <div class="input-group mb-3 d-flex justify-content-end " >
                <div class="input-group-append">
                    <form class="d-flex ">
                        <input class="ms-0" type="search" placeholder="Buscar productos..." aria-label="Buscar">
                        <button class="btn btn-outline-light bg-success me-2 fs-9" type="submit"><i class="bi bi-search"> Buscar </i></button>
                        <button class="btn btn-outline-light bg-success fs-9" id="agg" type="button" data-bs-toggle="modal" data-bs-target="#agregarproducto">Agregar</button>     
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
                                <a class="btn btn-warning" href="#" data-bs-toggle="modal" data-bs-target="#editarproducto">
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
                        var valorFormateado = valor.toLocaleString('es-CO', { minimumFractionDigits: 0, maximumFractionDigits: 0, style: 'currency', currency:'COP'});
                        precio.textContent = valorFormateado;
                    });
                </script>
                </tbody>
            </table>
        </div>

        <%-- modal de agregar productos --%>
        <div class="modal fade" id="agregarproducto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content"> 
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Producto</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-sing" action="#" method="POST" >
                            <div class="row">
                                <div class="col-6">
                                    <label>Nombre</label> 
                                    <input type="text" class="form-control" name="txtnombre" placeholder="nombre" required>
                                </div>  
                                <div class="col-6">
                                    <label>Precio</label> 
                                    <input type="number" class="form-control" name="txtprecio" placeholder="precio" required>
                                </div>
                                <div class="col-6">
                                    <label>Descripcion</label> 
                                    <input type="text" class="form-control" name="txtdescripcion" placeholder="descripcion" required>
                                </div>
                                <div class="col-6">
                                    <label>Stock</label> 
                                    <input type="number" class="form-control" name="txtstock" placeholder="disponibilidad" required>
                                </div>
                                <div class="col-6">
                                    <label>Categoria</label> 
                                    <select class="form-control" name="categoria">
                                        <c:forEach var="#" items="#">
                                            <option value="#"></option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-6">
                                    <label>Imagen</label> 
                                    <input type="file" class="form-control" name="foto" id="foto" required>
                                </div>
                            </div>    
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary mt-4 mb-2" name="btnagregar" value="Agregar">Agregar <i class="bi bi-floppy"></i></button>
                                <a class="btn btn-danger mt-4 mb-2" name="regresar" href="#">Regresar <i class="bi bi-box-arrow-left"></i></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%-- modal de editar productos --%>
        <div class="modal fade" id="editarproducto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Producto</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-sing" action="#" method="POST">
                            <div class="row">
                                <div class="col-6">
                                    <label>Nombre</label> 
                                    <input type="hidden" class="form-control" name="txtid" id="txtid" value="#"> 
                                    <input type="text" class="form-control" name="txtnombre" value="#" placeholder="nombre" required>
                                </div>  
                                <div class="col-6">
                                    <label>Precio</label> 
                                    <input type="number" class="form-control" name="txtprecio" value="#" placeholder="precio" required>
                                </div>
                                <div class="col-6">
                                    <label>Descripcion</label> 
                                    <input type="text" class="form-control" name="txtdescripcion" value="$#" placeholder="descripcion" required>
                                </div>
                                <div class="col-6">
                                    <label>Stock</label> 
                                    <input type="number" class="form-control" value="#" name="txtstock" placeholder="disponibilidad" required>
                                </div>
                                <div class="col-6">
                                    <label>Categoria</label> 
                                    <select class="form-control" name="categoria" onchange="actualizarInputOculto(this)">
                                        <c:forEach var="#" items="#">
                                            <option value="#"></option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" class="form-control" name="#" id="cat" value="#">

                                    <%-- scrip actualizar 1
                                    <script>
                                        function actualizarInputOculto(selectElement) {
                                            var inputOculto = document.getElementById("cat");
                                            inputOculto.value = selectElement.value;
                                        }
                                    </script>
                                    --%>
                                </div>
                                <div class="col-6">
                                    <label>Imagen</label> 
                                    <input type="file" class="form-control" name="foto" id="foto" onchange="actualizarInputOculto2(this)">
                                    <input type="hidden" class="form-control" value="#" name="foto2" id="foto2">

                                    <%-- scrip actualizar 2
                                    <script>
                                        function actualizarInputOculto2(selectElement) {
                                            var inputOculto = document.getElementById("foto2");
                                            var filePath = selectElement.value;
                                            var fileName = filePath.split('\\').pop().split('/').pop();
                                            inputOculto.value = "Imagenes/" + fileName;
                                        }
                                    </script>
                                    --%>

                                </div>
                            </div>    
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary mt-4 mb-2" name="btnagregar" value="Agregar">Guardar <i class="bi bi-floppy"></i></button>
                                <a class="btn btn-danger mt-4 mb-2" name="regresar" href="#">Regresar <i class="bi bi-box-arrow-left"></i></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>