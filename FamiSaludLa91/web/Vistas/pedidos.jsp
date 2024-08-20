<%-- 
    Document   : pedidos
    Created on : 7/08/2024, 10:22:12 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>pedidos - Famisalud la 91</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="../CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.3/font/bootstrap-icons.min.css" rel="stylesheet">


    </head>
    <body>


        <div class="container-fluid encabezado">
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
                        Inventario
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


        <div class="cuerpo">
            <div class="container mt-5">
                <h2 class="h2 text-center fw-bold">Pedidos</h2>
                <div class="input-group mb-3 d-flex justify-content-end " >
                    <div class="input-group-append">
                        <form class="d-flex ">
                            <input class="ms-0" type="search" placeholder="Buscar pedido..." aria-label="Buscar">
                            <button class="btn btn-outline-light bg-success icono fs-9" type="submit"><i class="bi bi-search"> Buscar </i></button> 
                        </form>

                    </div>
                </div>


            <div class="container mt-4">
                <div class="pedido-card d-flex flex-column mb-3 p-3 border rounded bg-light">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="flex-grow-1">
                            <p><strong>ID:</strong> </p>
                            <p><strong>Nombre:</strong> </p>
                            <p><strong>Dirección:</strong> </p>
                        </div>
                        <div class="d-flex flex-column align-items-end ms-3">
                            <p><strong>Fecha:</strong> </p>
                            <button class="btn btn-primary">➔</button>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
</body>
</html>