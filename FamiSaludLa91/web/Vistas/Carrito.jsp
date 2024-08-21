<!DOCTYPE html>
<html lang="es">

    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta charset="UTF-8">
        <title>Carrito - Famisalud la 91</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css" />
        <style>
            /* Estilo para el contenedor de la imagen grande */
            #imagenGrande {
                width: 100%; /* Ocupa el ancho completo del contenedor padre */
                text-align: center; /* Centra el contenido */
                margin-bottom: 20px; /* Espacio inferior */
                margin-top: 40px; /* Espacio superior */
            }

            /* Estilo para la imagen dentro del contenedor */
            #imagenGrande img {
                max-width: 100%;
                height: 500px; /* Ajusta la altura de la imagen grande */
                object-fit: contain; /* Para mantener la proporción de la imagen */
            }

            /* Estilo para las imágenes en la tabla */
            .table img {
                cursor: pointer;
                width: 80px; /* Tamaño uniforme para todas las imágenes */
                height: 80px;
                object-fit: cover; /* Asegura que las imágenes cubran el área del contenedor */
                transition: transform 0.2s ease;
            }

            /* Estilo para el efecto de hover en las imágenes de la tabla */
            .table img:hover {
                transform: scale(1.1);
            }

            /* Estilo para la tabla con scroll */
            .table-responsive {
                max-height: 400px; /* Ajusta la altura según tus necesidades */
                overflow-y: auto; /* Habilita el scroll vertical si el contenido excede la altura */
            }
        </style>
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
                    <a class="nav-link nav-link-icon carrito"  href="/FamiSaludLa91/CtrProductos?accion=Carrito">
                        <i class="bi bi-cart3 fs-4">(<label style="color: darkorange">${contador}</label>)</i>
                    </a>
                    <a class="nav-link nav-link-icon carrito" href="#">
                        <i class="bi bi-person-fill text-white fs-3"></i>
                    </a>
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
                        <div id="carouselCategorias" class="carousel slide">
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
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselCategorias" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselCategorias" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="container py-6">
            <div class="row">
                <!-- Imagen en grande -->
                <div class="col-md-6">
                    <div id="imagenGrande">
                        <img id="imagenGrandeImg" src="/FamiSaludLa91/imagenes/imagenCarrito.avif" alt="Imagen Grande">
                    </div>
                </div>

                <!-- Tabla del carrito -->
                <div class="col-md-6">
                    <div class="mb-4">
                        <h1 class="fw-bold fs-1">Carrito de Compra</h1>
                    </div>
                    <div class="table-responsive mb-4">
                        <table class="table table-bordered table-striped bg-white">
                            <thead>
                                <tr class="bg-light">
                                    <th scope="col">Imagen</th>
                                    <th scope="col">Producto</th>
                                    <th scope="col">Cantidad</th>
                                    <th scope="col">Precio</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="car" items="${carrito}">
                                    <tr class="align-middle">
                                        <td class="text-center">
                                            <img src="${car.foto}" alt="" class="img-fluid rounded" />
                                        </td>
                                        <td>${car.nombre}</td>
                                        <td>
                                            <input type="number" class="form-control form-control-sm" value="${car.cantidad}" min="1" />
                                        </td>
                                        <td>${car.preciocompra}</td>
                                        <td>${car.subTotal}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- Resumen de la compra -->
                    <div class="table-responsive summary-table">
                        <table class="table table-bordered bg-light">
                            <tbody>
                                <tr>
                                    <th scope="row">Subtotal</th>
                                    <td>$<c:out value="${subtotal}" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">Envío</th>
                                    <td>$<c:out value="${envio}" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">Total</th>
                                    <td class="fs-4 fw-bold">$<c:out value="${total}" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <button type="button" class="btn btn-lg btn-primary">Proceder al Pago</button>
                        <a href="/FamiSaludLa91/Productos" class="btn btn-lg btn-secondary">Seguir Comprando</a>
                    </div>
                </div>
            </div>
        </div>

        <script src="/FamiSaludLa91/JSc/manejoImagen.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>

</html>
