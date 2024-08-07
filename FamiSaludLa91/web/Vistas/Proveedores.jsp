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
                        Medicamentos
                        <ul class="dropdown-menu">
                            <li>Alivio del Dolor</li>
                            <li>Salud Digestiva</li>
                            <li>Salud y Medicamentos</li>
                            <li>Tratamiento de la Gripe</li>
                        </ul>
                    </a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">
                        Belleza
                        <ul class="dropdown-menu">
                            <li>Belleza 1</li>
                            <li>Belleza 2</li>
                            <li>Belleza 3</li>
                        </ul>
                    </a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">
                        Cuidado al Bebé
                        <ul class="dropdown-menu">
                            <li>Cuidado al Bebé 1</li>
                            <li>Cuidado al Bebé 2</li>
                            <li>Cuidado al Bebé 3</li>
                        </ul>
                    </a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">
                        Alimentos y Bebidas
                        <ul class="dropdown-menu">
                            <li>Alimentos y Bebidas 1</li>
                            <li>Alimentos y Bebidas 2</li>
                            <li>Alimentos y Bebidas 3</li>
                        </ul>
                    </a>
                    <a class="nav-link opciones" href="#" id="navbarDropdown">
                        Otros
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
                    <button class="btn btn-outline-light bg-success  fs-9" id="agg" type="button">Agregar</button>      
                </form>

            </div>
        </div>

        <table class="table table-bordered">
            <thead class="thead-light">
                <tr>
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
                <tr>
                    <th scope="row" class="border"></th>
                    <td class="border"></td>
                    <td class="border"></td>
                    <td class="border"></td>
                    <td class="border"></td>
                    <td scope="col" class ="text-center border">
                        <input type="hidden" name="id" id="id" value="">
                        <a class="btn btn-warning" href="/AxppWeb/CtrProducto?accion=EditarPro&idpro="><i class="bi bi-pencil-fill"></i></a>
                        <a class="btn btn-danger" id="btneliminar" href="#"><i class="bi bi-trash-fill"></i></a>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
