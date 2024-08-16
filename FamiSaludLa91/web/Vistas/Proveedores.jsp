<%-- 
    Document   : Proveedores
    Created on : 7/08/2024, 01:23:46 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Proveedores - Famisalud la 91</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="../CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
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
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=home" id="navbarDropdown">
                        Inicio
                    </a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">
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
            <h2 class="titulo-inventario text-center fw-bold">Proveedores</h2>
            <div class="input-group mb-3 d-flex justify-content-end " >
                <div class="input-group-append">
                    <form class="d-flex ">
                        <input class="ms-0" type="search" placeholder="Buscar productos..." aria-label="Buscar">
                        <button class="btn btn-outline-light bg-success me-2 fs-9" type="submit"><i class="bi bi-search"> Buscar </i></button>
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
                <c:forEach var="pro" items="">  
                    <tr style="background-color: white">
                        <th scope="row" class="border"></th>
                        <td class="border"></td>
                        <td class="border"></td>
                        <td class="border"></td>
                        <td class="border"></td>
                        <td scope="col" class ="text-center border">
                            <input type="hidden" name="id" id="id" value="">
                            <a class="btn btn-warning" href="/AxppWeb/CtrProducto?accion=EditarPro&idpro=" data-bs-toggle="modal" data-bs-target="#editarproveedor"><i class="bi bi-pencil-fill"></i></a>
                            <a class="btn btn-danger" id="btneliminar" href="#"><i class="bi bi-trash-fill"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Modal -->

        <div class="modal fade" id="agregarproveedor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                    <label>ID</label> 
                                    <input type="text" class="form-control" name="txtid" placeholder="ID" required="">
                                </div>  
                                <div class="col-6">
                                    <label>Nombre</label> 
                                    <input type="text" class="form-control" name="txtnombre" placeholder="Nombre" required="">
                                </div>
                                <div class="col-6">
                                    <label>Correo</label> 
                                    <input type="text" class="form-control" name="txtcorreo" placeholder="Correo" required="">
                                </div>
                                <div class="col-6">
                                    <label>Telefono</label> 
                                    <input type="text" class="form-control" name="txttelefono" placeholder="Telefono" required="">
                                </div>
                                <div class="col-6">
                                    <label>Direccion</label> 
                                    <input type="direcion" class="form-control" name="txtdireccion" placeholder="Direccion" required="">
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
        
                            
                            
           <div class="modal fade" id="editarproveedor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Proveedor</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-sing" action="#" method="POST">
                            <div class="row">
                                <div class="col-6">
                                    <label>ID</label> 
                                    <input type="text" class="form-control" name="txtid" placeholder="ID" required="">
                                </div>  
                                <div class="col-6">
                                    <label>Nombre</label> 
                                    <input type="text" class="form-control" name="txtnombre" placeholder="Nombre" required="">
                                </div>
                                <div class="col-6">
                                    <label>Correo</label> 
                                    <input type="text" class="form-control" name="txtcorreo" placeholder="Correo" required="">
                                </div>
                                <div class="col-6">
                                    <label>Telefono</label> 
                                    <input type="text" class="form-control" name="txttelefono" placeholder="Telefono" required="">
                                </div>
                                <div class="col-6">
                                    <label>Direccion</label> 
                                    <input type="direcion" class="form-control" name="txtdireccion" placeholder="Direccion" required="">
                                </div
                            </div>    
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary mt-4 mb-2" name="btnagregar" value="Agregar">Guardar <i class="bi bi-floppy"></i></button>
                                <a class="btn btn-danger mt-4 mb-2" name="regresar" href="#">Regresar <i class="bi bi-box-arrow-left"></i></a>
                            </div>
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