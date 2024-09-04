<%-- 
    Document   : Proveedores
    Created on : 7/08/2024, 01:23:46 PM
    Author     : USUARIO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Proveedores - Famisalud la 91</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    </head>
    <body>
        <div class="container-fluid encabezado ">
            <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="/FamiSaludLa91/imagenes/logo9.png" alt="" class="me-2"/>
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
            <h2 class="titulo-inventario text-center fw-bold titulos">Proveedores</h2>
            <div class="input-group mb-3 d-flex justify-content-end " >
                <div class="input-group-append">
                    <form class="d-flex " action="/FamiSaludLa91/CtrPro?accion=buscarp">
                        <input class="ms-0" type="text" name="txtbuscar" placeholder="Buscar proveedor..." aria-label="Buscar">
                        <button type="submit" class="btn btn-outline-light bg-success me-2 fs-9" name="accion" value="buscarp"><i class="bi bi-search"> Buscar </i></button>
                        
                        <button class="btn btn-outline-light bg-success  fs-9" id="agg" type="button" data-bs-toggle="modal" data-bs-target="#agregarproveedor">Agregar</button>      
                    </form>

                </div>
            </div>

            <table class="table table-bordered" style="box-shadow: 5px 5px 15px rgb(0, 0, 0,.3);" >
                <thead class="thead-light">
                    <tr style="background-color: white">
                        <th scope="col" class="text-center border">Id</th>
                        <th scope="col" class="text-center border">Nombre</th>
                        <th scope="col" class="text-center border">Correo</th>
                        <th scope="col" class="text-center border">Telefono</th>
                        <th scope="col" class="text-center border">Dirrecion</th>
                        <th scope="col" class="text-center border">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="p" items="${proveedor}">  
                    <tr style="background-color: white">
                        <th scope="row" class="border">${p.getId()}</th>
                        <td class="border">${p.getNombre()}</td>
                        <td class="border">${p.getCorreo()}</td>
                        <td class="border">${p.getTelefono()}</td>
                        <td class="border">${p.getDireccion()}</td>
                        <td scope="col" class ="text-center border">
                            <input type="hidden" name="id" id="id" value="${p.getId()}">
                            <a class="btn btn-primary" href="/FamiSaludLa91/CtrPro?accion=EditarProveedor&idpr=${p.getId()}"><i class="bi bi-pencil-fill"></i></a>
                            <a class="btn btn-danger" href="#" data-bs-toggle="modal" data-bs-target="#eliminar" data-id="${p.getId()}"><i class="bi bi-trash-fill"></i></a>
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
                        ¿Estás seguro de que quieres eliminar este Proveedor?
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

        <!-- Modal -->

        <div class="modal fade" id="agregarproveedor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content"> 
            <div class="modal-header bg-primary text-white">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Producto</h1>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="form-sing" action="/FamiSaludLa91/CtrPro?accion=Agregar" method="POST" >
                    <div class="row g-3">
                        <div class="col-md-6">
                                    <label for="txtid" class="form-label">ID</label> 
                                    <input type="number" class="form-control" name="txtid" placeholder="Ingrese ID" required>
                                </div>  
                                <div class="col-md-6">
                                    <label for="txtnombre" class="form-label">Nombre</label> 
                                    <input type="text" class="form-control" id="txtnombre" name="txtnombre" placeholder="Ingrese nombre" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtcorreo" class="form-label">Correo</label> 
                                    <input type="text" class="form-control" id="txtcorreo" name="txtcorreo" placeholder="Ingrese Correo" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txttelefono" class="form-label">Telefono</label> 
                                    <input type="number" class="form-control" id="txttelefono" name="txttelefono" placeholder="Ingrese Telefono" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtdireccion" class="form-label">Direccion</label> 
                                    <input type="txt" class="form-control" id="txtdireccion" name="txtdireccion" placeholder="Ingrese Direccion" required>
                                </div>
                            </div>    
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-success" name="btnagregar" value="Agregar">Agregar <i class="bi bi-floppy"></i></button>
                        <a class="btn btn-secondary" name="regresar" href="/FamiSaludLa91/CtrPro?accion=listarp">Regresar <i class="bi bi-box-arrow-left"></i></a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
        
                            
                            
           <div class="modal fade" id="editarproveedor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content"> 
            <div class="modal-header bg-primary text-white">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Proveedor</h1>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="form-sing" action="/FamiSaludLa91/CtrPro?accion=actualizarProveedor" method="POST" >
                    <div class="row g-3">
                        <div class="col-md-6">
                                    <label for="txtid" class="form-label">Id</label>actualizarProveedor
                                    <input type="number" class="form-control" id="txtid" name="txtid" value="${proveedorE.getId()}" readonly required>
                                </div>  
                                <div class="col-md-6">
                                    <label for="txtnombre" class="form-label">Nombre</label> 
                                    <input type="text" class="form-control" id="txtnombre" name="txtnombre" value="${proveedorE.getNombre()}" placeholder="Ingrese nombre" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtcorreo" class="form-label">Correo</label> 
                                    <input type="text" class="form-control" id="txtcorreo" name="txtcorreo" value="${proveedorE.getCorreo()}" placeholder="Ingrese Correo" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txttelefono" class="form-label">Telefono</label> 
                                    <input type="number" class="form-control" id="txttelefono" name="txttelefono" value="${proveedorE.getTelefono()}" placeholder="Ingrese Telefono" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtdireccion" class="form-label">Direccion</label> 
                                    <input type="txt" class="form-control" id="txtdireccion" name="txtdireccion" value="${proveedorE.getDireccion()}" placeholder="Ingrese Direccion" required>
                                </div>
                            </div>    
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-success" name="btnagregar" value="Agregar">Guardar <i class="bi bi-floppy"></i></button>
                        <a class="btn btn-secondary" name="regresar" href="/FamiSaludLa91/CtrPro?accion=listarp">Regresar<i class="bi bi-box-arrow-left"></i></a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/FamiSaludLa91/JSc/eliminarProveedores.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<script>
            $(document).ready(function() {
                
                    <c:if test="${editarPro}">
                        $('#editarproveedor').modal('show');
                    </c:if>
                
            });
</script>
</body>
</html>