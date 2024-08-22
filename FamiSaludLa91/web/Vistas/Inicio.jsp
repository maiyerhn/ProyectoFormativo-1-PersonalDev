<!DOCTYPE html>
<html lang="es">
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - Famisalud la 91</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="container-fluid encabezado">
        <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="/FamiSaludLa91/imagenes/logo9.png" alt="Famisalud la 91 Logo">
                </a>
                <p class="navbar-text fs-3 fw-bold text-white">Famisalud la 91</p>
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
                            <li><a class="dropdown-item" href="#">Salir</a></li>
                        </ul>
                    </div>
            </div>
        </header>
    </div>
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
                                <div class="row row-cols-3 g-3">
                                    <div class="col">
                                        <a href="/FamiSaludLa91/CtrProductos?accion=Inicio" class="category-item d-flex align-items-center justify-content-center">
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
                                <div class="row row-cols-3 g-3">
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
                        <a href="/FamiSaludLa91/CtrProductos?accion=AgregarCarrito&id=${c.getId()}" class="add-to-cart">
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
</body>
</html>
