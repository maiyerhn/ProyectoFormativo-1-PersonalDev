<!DOCTYPE html>
<html lang="es">
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio - Famisalud la 91</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid encabezado">
            <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/FamiSaludLa91/CtrProductos?accion=Inicio&id=" + ${user.getId()}">
                        <img src="/FamiSaludLa91/imagenes/logo9.png" alt="Famisalud la 91 Logo">
                    </a>
                    <p  class="navbar-text fs-3 fw-bold text-white">Famisalud la 91</p>
                    <form class="form-control ms-auto d-flex busqueda">
                        <input class="form-control me-1" type="search" placeholder="Buscar productos..." aria-label="Buscar">
                        <button class="btn btn-outline-light bg-success icono fs-9" type="submit">
                            <i class="bi bi-search"></i>
                        </button>
                    </form>
                    <a class="nav-link nav-link-icon carrito" href="/FamiSaludLa91/CtrProductos?accion=Carrito">
                        <i class="bi bi-cart3 fs-4">(<label style="color: darkorange">${contador}</label>)</i>
                    </a>
                    <div class="dropdown">
                        <a class="nav-link dropdown-toggle carrito" href="#" role="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-fill text-white fs-3"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="#">Usuario</a></li>
                            <li>
                                <form method="POST" action="/FamiSaludLa91/CtrValidar">
                                    <input type="hidden" name="accion" value="exit">
                                    <button type="submit" class="dropdown-item">Salir</button>
                                </form>
                                           </li>
                        </ul>
                    </div>
                </div>
            </header>
        </div>
        <section class="container-fluid py-1 encabezado">
            <div class="container ">
                <div class="col-md-4 align-items-center justify-content-center">
                        <div class="dropdown">
                            <button class="btn btn-primary btn-lg-custom dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                Categorías<i class="bi bi-arrow-down-short"></i>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <c:forEach var="cat" items="${Categorias}">
                                        <li><a class="dropdown-item" href="" >${cat.getNombre()}</a></li>
                                        <input type="hidden" value="${cat.getId()}" name="catid" id="catid">
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-9 d-flex justify-content-center py-1">
                        <div class="category-list d-flex flex-wrap align-items-center justify-content-center">
                            <a href="#" class="category-item d-flex align-items-center mb-3 me-4">
                                <i class="bi bi-capsule me-2"></i>
                                Medicamentos
                            </a>
                            <a href="#" class="category-item d-flex align-items-center mb-3 me-4">
                                <i class="bi bi-brush me-2"></i>
                                Belleza
                            </a>
                            <a href="#" class="category-item d-flex align-items-center mb-3 me-4">
                                <i class="bi bi-heart-pulse-fill me-2"></i>
                                Cuidado al Bebé
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="full-width-carousel">
            <div id="imageCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="3000">
                        <img src="https://www.shutterstock.com/image-vector/3d-medicine-concept-medical-pharmacy-260nw-2412705345.jpg" class="d-block w-100" alt="Imagen 1">
                    </div>
                    <div class="carousel-item" data-bs-interval="3000">
                        <img src="https://www.cofm.es/recursos/img/portal/2015/03/09/medicamentos-farmacia-carrusel-mini-1181x500.jpg" class="d-block w-100" alt="Imagen 2">
                    </div>
                    <div class="carousel-item" data-bs-interval="3000">
                        <img src="https://estaticosgn-cdn.deia.eus/clip/41324efa-3edc-4a1c-96d9-cc42bcc3f489_16-9-discover-aspect-ratio_default_0.jpg" class="d-block w-100" alt="Imagen 3">
                    </div>
                </div>
                <div class="thumbnail-indicators">
                    <img src="https://www.shutterstock.com/image-vector/3d-medicine-concept-medical-pharmacy-260nw-2412705345.jpg" alt="Imagen 1" data-bs-slide-to="0" class="active">
                    <img src="https://www.cofm.es/recursos/img/portal/2015/03/09/medicamentos-farmacia-carrusel-mini-1181x500.jpg" alt="Imagen 2" data-bs-slide-to="1">
                    <img src="https://estaticosgn-cdn.deia.eus/clip/41324efa-3edc-4a1c-96d9-cc42bcc3f489_16-9-discover-aspect-ratio_default_0.jpg" alt="Imagen 3" data-bs-slide-to="2">
                </div>
            </div>
        </section>
        <div class="container mt-5">
            <div class="row">
                <c:forEach var="c" items="${Productos}">
                    <div class="col-md-4">
                        <div class="product-card">
                            <h2 class="product-name"><label>${c.getNombre()}</label></h2>
                            <img src="${c.getFoto()}" alt="Producto">
                            <p class="product-description"><label>${c.getDescripcion()}</label></p>
                            <a href="/FamiSaludLa91/CtrProductos?accion=AgregarCarrito&idproducto=${c.getId()}" class="add-to-cart">
                                <button class="btn btn-primary text-light">Agregar al Carrito</button>
                            </a>
                            <button class="btn btn-success">Comprar</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="/FamiSaludLa91/JSc/funcion.js" type="text/javascript"></script>
        <script src="/FamiSaludLa91/JSc/carruselCategoria.js" type="text/javascript"></script>
        <script src="/FamiSaludLa91/JSc/CarruselImagenes.js" type="text/javascript"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
