<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Carrito - Famisalud la 91</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="../CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
   
</head>

<body>
    <div class="container-fluid encabezado">
        <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="/FamiSaludLa91/imagenes/logo9.png" alt="Famisalud la 91 Logo" style="max-width: 100px;"/>
                </a>
                <p class="navbar-text fs-3 fw-bold text-white">Famisalud la 91</p>
                <form class="form-control ms-auto d-flex busqueda">
                    <input class="form-control me-1" type="search" placeholder="Buscar productos..." aria-label="Buscar">
                    <button class="btn btn-outline-light bg-success icono fs-9" type="submit">
                        <i class="bi bi-search"></i>
                    </button>
                </form>
                <a class="nav-link nav-link-icon carrito" href="#" data-bs-toggle="modal" data-bs-target="#ModalError">
                    <i class="bi bi-cart3 fs-4"></i>
                </a>
                <a class="nav-link nav-link-icon carrito" href="#" data-bs-toggle="modal" data-bs-target="#ModalError">
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
                    <div id="carouselCategories" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row row-cols-3 g-3">
                                    <div class="col">
                                        <a href="/FamiSaludLa91/CtrProductos?accion=home" class="category-item d-flex align-items-center justify-content-center">
                                            <i class="bi bi-house me-4"></i>
                                            Inicio
                                        </a>
                                    </div>
                                    <div class="col">
                                        <a href="#" class="category-item d-flex align-items-center justify-content-center">
                                            <i class="bi bi-capsule me-4"></i>
                                            Medicamentos
                                        </a>
                                    </div>
                                    <div class="col">
                                        <a href="#" class="category-item d-flex align-items-center justify-content-center">
                                            <i class="bi bi-brush me-4"></i>
                                            Belleza
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row row-cols-3 g-3">
                                    <div class="col">
                                        <a href="#" class="category-item d-flex align-items-center justify-content-center">
                                            <i class="bi bi-heart-pulse-fill me-4"></i>
                                            Cuidado al Bebé
                                        </a>
                                    </div>
                                    <div class="col">
                                        <a href="#" class="category-item d-flex align-items-center justify-content-center">
                                            <i class="bi bi-basket me-4"></i>
                                            Alimentos y Bebidas
                                        </a>
                                    </div>
                                    <div class="col">
                                        <a href="#" class="category-item d-flex align-items-center justify-content-center">
                                            <i class="bi bi-box me-4"></i>
                                            Otros
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

    <div class="container my-5">
        <h1 class="mb-4">Carrito de compras</h1>
        <div class="row">
            <div class="col-md-8">
                <ul class="list-group mb-4">
                    <li class="list-group-item d-flex align-items-center">
                        <img src="/images/aspirin.jpg" alt="Aspirina" class="rounded me-3" style="width: 80px; height: 80px; object-fit: cover;">
                        <div class="flex-grow-1">
                            <h5 class="mb-1">Aspirina</h5>
                            <div class="d-flex align-items-center">
                                <input type="number" class="form-control me-3" value="1" min="1" style="width: 80px;">
                                <span>Total: $5.99</span>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item d-flex align-items-center">
                        <img src="/images/antibiotic.jpg" alt="Antibiótico" class="rounded me-3" style="width: 80px; height: 80px; object-fit: cover;">
                        <div class="flex-grow-1">
                            <h5 class="mb-1">Antibiótico</h5>
                            <div class="d-flex align-items-center">
                                <input type="number" class="form-control me-3" value="1" min="1" style="width: 80px;">
                                <span>Total: $12.99</span>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item d-flex align-items-center">
                        <img src="/images/vitamin.jpg" alt="Vitaminas" class="rounded me-3" style="width: 80px; height: 80px; object-fit: cover;">
                        <div class="flex-grow-1">
                            <h5 class="mb-1">Vitaminas</h5>
                            <div class="d-flex align-items-center">
                                <input type="number" class="form-control me-3" value="2" min="1" style="width: 80px;">
                                <span>Total: $19.98</span>
                            </div>
                        </div>
                    </li>
                </ul>
                <div>
                    <button class="btn btn-outline-primary">Continuar comprando</button>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-2">
                            <span>Subtotal</span>
                            <span>$38.96</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Impuestos</span>
                            <span>$7.79</span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between fw-bold">
                            <span>Total</span>
                            <span>$46.75</span>
                        </div>
                        <button class="btn btn-success w-100 mt-3">Comprar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../JSc/carruselCategoria.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
