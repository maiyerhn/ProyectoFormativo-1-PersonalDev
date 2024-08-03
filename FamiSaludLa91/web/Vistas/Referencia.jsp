<%-- 
    Document   : Referencia
    Created on : 2/07/2024, 08:42:23 AM
    Author     : Maiyer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid encabezado">
            <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
                <div class="container-fluid">

                    <a class="navbar-brand" href="#">
                        <img src="/FamiSaludLa91/Imagenes/logo9.png" alt="Logo" id="logo">
                    </a>


                    <p class="navbar-text fs-3 fw-bold text-white">Famisalud la 91</p>

                    <form class="form-control ms-auto d-flex busqueda">
                        <input class="me-1" type="search" placeholder="Buscar" aria-label="Buscar">
                        <button class="btn btn-outline-light bg-success icono fs-9" type="submit"><i class="bi bi-search"></i></button>
                    </form>

                    <a class="nav-link nav-link-icon" href="#">
                        <i class="bi bi-cart3 fs-4"></i>
                    </a>
                    <a class="nav-link nav-link-icon" href="#">
                        <i class="bi bi-person-circle fs-4"></i>
                    </a>
                </div>
            </header>

            <div class="menu">

                <div class="Lista">
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=home"  id="navbarDropdown">
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
        <div class="Container-fluid">
            <div class="row">
                <c:forEach var="c" items="${Productos}">
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-header">
                                <label>${c.getNombre()}</label>
                        </div>
                        <div class="card-body text-center">
                            <img src="${c.getFoto()}" width="200" height="180"><br>
                            <i>$.${c.getPrecio()}</i>
                        </div>
                        <div class="card-footer text-center">
                             <label>${c.getDescripcion()}</label>   
                        
                        <div>
                            <a href="#" class="btn btn-outline-info"><i class="bi bi-cart4"></i> Agregar Carrito</a>
                            <a href="#" class="btn btn-danger">Comprar</a>
                        </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/FamiSaludLa91/JSc/ReferenceScript.js" type="text/javascript"></script>

    </body>
</html>
