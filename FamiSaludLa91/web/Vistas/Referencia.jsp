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
                        <img src="/FamiSaludLa91/imagenes/logo9.png" alt=""/>
                    </a>


                    <p class="navbar-text fs-3 fw-bold text-white">Famisalud la 91</p>

                    <form class="form-control ms-auto d-flex busqueda">
                        <input class="me-1" type="search" placeholder="Buscar productos..." aria-label="Buscar">
                        <button class="btn btn-outline-light bg-success icono fs-9" type="submit"><i class="bi bi-search"></i></button>
                    </form>

                    <a class="nav-link nav-link-icon carrito" href="#" data-bs-toggle="modal" data-bs-target="#ModalError">
                        <i class="bi bi-cart3 fs-4"></i>
                    </a>
                    <a class="nav-link nav-link-icon iniciar" href="/FamiSaludLa91/Vistas/Login.jsp">
                        <p>Iniciar Sesión</p>
                    </a>
                </div>
            </header>


            <section class="container-categoria py-3">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-2">
                        <h2 class="fs-4 fw-bold text-white mb-2">Categorías</h2>
                    </div>
                    <div class="col-md-10">
                        <div id="carouselCategories" class="carousel slide">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="row row-cols-3 g-3"> <!-- Show 3 categories per slide -->
                                        <div class="col">
                                            <a  href="/FamiSaludLa91/CtrProductos?accion=home" class="category-item d-flex align-items-center justify-content-center">
                                                <i class="bi bi-house me-4"></i>
                                                Inicio
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a href="#" class="category-item d-flex align-items-center justify-content-center">
                                                <i class="bi bi-capsule me-4"></i>
                                                <span>Medicamentos</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a href="#" class="category-item d-flex align-items-center justify-content-center">
                                                <i class="bi bi-brush me-4"></i>
                                                <span>Belleza</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row row-cols-3 g-3"> <!-- Show 3 categories per slide -->
                                        <div class="col">
                                            <a href="#" class="category-item d-flex align-items-center justify-content-center">
                                                <i class="bi bi-heart-pulse-fill"></i>
                                                <span>Cuidado al Bebé</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a href="#" class="category-item d-flex align-items-center justify-content-center">
                                                <i class="bi bi-basket me-4"></i>
                                                <span>Alimentos y Bebidas</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a href="#" class="category-item d-flex align-items-center justify-content-center">
                                                <i class="bi bi-box me-4"></i>
                                                <span>Otros</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselCategories" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselCategories" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        </div>

        <div class="container mt-5">
            <div class="row">
                <c:forEach var="c" items="${Productos}">
                    <div class="col-md-4">
                        <div class="product-card">
                            <h2 class="product-name"> <label>${c.getNombre()}</label></h2>
                            <img src="${c.getFoto()}" alt="Producto">
                            <p class="product-description"><label>${c.getDescripcion()}</label>  </p>
                            <button class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#ModalError">Agregar al Carrito</button>
                            <button class="btn btn-success"  data-bs-toggle="modal" data-bs-target="#ModalError">Comprar </button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="ModalError" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel" style=" font-weight: bold;">Error</h5>
                    </div>
                    <div class="modal-body" style=" text-align: center;">
                        <p class="modal-contenido" style="width: 100%;">Para Realizar esta accion debes logearte.</p>
                        <button type="button" id="btnLogin" class="btn btn-success" style=" border-radius: 30px;">Iniciar Sesion</button>
                        <button type="button" id="btnRegistrarse" class="btn btn-secondary" style=" border-radius: 30px;" >Registrarse</button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" style=" border-radius: 30px;">Cerrar</button>
                    </div>
                </div>
                
            </div>
        </div>
        <script src="/FamiSaludLa91/JSc/carruselCategoria.js" type="text/javascript"></script>
        <script src="/FamiSaludLa91/JSc/redireciones.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  
    </body>
</html>
