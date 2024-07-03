<%-- 
    Document   : Referencia
    Created on : 2/07/2024, 08:42:23 AM
    Author     : Maiyer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="../CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
       <nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid d-flex align-items-center">
        <ul class="nav nav-pills nav-fill">
            <li class="nav-item dropdown">
                <a class="nav-link active dropdown-toggle navbar-brand" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Menu</a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#" data-bs-target="#item"><i></i>categoria1</a></li>
                    <li><a class="dropdown-item" href="#" data-bs-target="#item"><i></i> 2</a></li>
                    <li><a class="dropdown-item" href="#" data-bs-target="#item"><i></i> 3</a></li>
                    <li><a class="dropdown-item" href="#" data-bs-target="#item"><i></i> 4</a></li>
                </ul>
            </li>
        </ul>
        <div class="d-flex align-items-center mx-auto">
            <img src="../Imagenes/Logo.png" alt="" height="50px" width="50px" />
            <p class="titt ms-3 mb-0">FamiSaludLa91</p>
        </div>
        <div class="d-flex align-items-center ms-auto">
            <form class="form-inline d-flex" action="/AppWeb/CtrUsuario?accion=buscar">
                <div class="form-group mx-sm-3 mb-2">
                    <input type="text" class="form-control" name="txtbuscar" placeholder="digite nombre">
                </div>
                <button type="submit" class="btn btn-success mb-2" name="accion" value="buscar"><i class="bi bi-search"></i> Buscar</button>
            </form>
            <button type="button" class="btn btn-outline-light mb-2 ms-2">
                <i class="bi bi-cart"></i>
            </button>
            <button type="button" class="btn btn-outline-light mb-2 ms-2">
                <i class="bi bi-person"></i>
            </button>
        </div>
    </div>
</nav>


                           
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>                         
    </body>
</html>
