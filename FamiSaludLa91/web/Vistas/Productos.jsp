<%-- 
    Document   : Productos
    Created on : 7/08/2024, 01:22:08 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Productos - Famisalud la 91</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="../CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>


        <div class="container-fluid encabezado ">
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
            <h2 class="titulo-inventario text-center fw-bold">Productos</h2>
            <div class="input-group mb-3 d-flex justify-content-end " >
                <div class="input-group-append">
                    <form class="d-flex ">
                        <input class="ms-0" type="search" placeholder="Buscar productos..." aria-label="Buscar">
                        <button class="btn btn-outline-light bg-success me-2 fs-9" type="submit"><i class="bi bi-search"> Buscar </i></button>
                        <button class="btn btn-outline-light bg-success fs-9" id="agg" type="button" data-bs-toggle="modal" data-bs-target="#agregarproducto">Agregar</button>     
                    </form>

                </div>
            </div>

            <table class="table table-bordered" style="box-shadow: 5px 5px 15px rgb(0, 0, 0,.3); border-radius: 10px;">
                <thead class="thead-light">
                    <tr style="background-color: white">
                        <th scope="col" class="text-center border">Id</th>
                        <th scope="col" class="text-center border">Nombre</th>
                        <th scope="col" class="text-center border">Descripcion</th>
                        <th scope="col" class="text-center border">Precio</th>
                        <th scope="col" class="text-center border">Foto</th>
                        <th scope="col" class="text-center border">Categoria</th>
                        <th scope="col" class="text-center border">Stock</th>
                        <th scope="col" class="text-center border">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="pro" items="">  
                    <tr style="background-color: white">
                        <th scope="row" class="border"></th>
                        <td class="border text-center"></td>
                        <td class="border text-center" ></td>
                        <td class="border text-center"></td>
                        <td class="border d-flex justify-content-center"><img src="" width="100" height="80"></td>
                        <td class="border text-center"></td>
                        <td class="border text-center"></td>
                        <td scope="col" class ="border text-center">
                            <input type="hidden" name="id" id="id" value="">
                            <a class="btn btn-primary" href="#" data-bs-toggle="modal" data-bs-target="#editarproducto"><i class="bi bi-pencil-fill"></i></a>
                            <a class="btn btn-danger" id="btneliminar" href="#"><i class="bi bi-trash-fill"></i></a>
                        </td>
                    </tr>
                </c:forEach>
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
                        <form class="form-sing" action="/FamiSaludla91/CtrProductos?accion=Agregar" method="POST" >
                            <div class="row">
                                <div class="col-6">
                                    <label>Id</label> 
                                    <input type="text" class="form-control" name="txtid" placeholder="id" required>
                                </div> 
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
                                    <c:forEach var="cat" items="${Categorias}">
                                            <option value="${cat.getId()}">${cat.getNombre()}</option>
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
                                    <input type="text" class="form-control" name="txtnombre" value="" placeholder="nombre" required>
                                </div>  
                                <div class="col-6">
                                    <label>Precio</label> 
                                    <input type="number" class="form-control" name="txtprecio" value="#" placeholder="precio" required>
                                </div>
                                <div class="col-6">
                                    <label>Descripcion</label> 
                                    <input type="text" class="form-control" name="txtdescripcion" value="" placeholder="descripcion" required>
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

                                    
                                    <script>
                                        function actualizarInputOculto(selectElement) {
                                            var inputOculto = document.getElementById("cat");
                                            inputOculto.value = selectElement.value;
                                        }
                                    </script>
                                    
                                </div>
                                <div class="col-6">
                                    <label>Imagen</label> 
                                    <input type="file" class="form-control" name="foto" id="foto" onchange="actualizarInputOculto2(this)">
                                    <input type="hidden" class="form-control" value="#" name="foto2" id="foto2">

                                    
                                    <script>
                                        function actualizarInputOculto2(selectElement) {
                                            var inputOculto = document.getElementById("foto2");
                                            var filePath = selectElement.value;
                                            var fileName = filePath.split('\\').pop().split('/').pop();
                                            inputOculto.value = "Imagenes/" + fileName;
                                        }
                                    </script>
                                    

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