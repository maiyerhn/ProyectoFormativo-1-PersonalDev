<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Carrito - Famisalud la 91</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="../CSS/EstilosReferencia.css" rel="stylesheet" type="text/css" />
    <style>
        .table-wrapper {
            max-height: 400px;
            overflow-y: auto;
        }
        #imagencarrito {
            margin-top: 50px; 
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

    <div class="container py-6">
        <div class="row">
            <div class="col-md-6">
                <img src="../imagenes/Amoxicilina.jpg" alt="Amoxicilina" width="400" height="400" id="imagencarrito" class="img-fluid rounded-lg" />
            </div>
            <div class="col-md-6">
                <div class="mb-4">
                    <h1 class="fw-bold fs-1">Carrito de Compra</h1>
                </div>
                <div class="table-wrapper mb-4">
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
                            <tr class="align-middle">
                                <td class="text-center">
                                    <img src="../imagenes/Paracetamol.jpg" alt="Paracetamol" width="64" height="64" class="img-fluid rounded" />
                                </td>
                                <td>Paracetamol</td>
                                <td>
                                    <input type="number" class="form-control form-control-sm" value="2" min="1" />
                                </td>
                                <td>$4.99</td>
                                <td>$9.98</td>
                            </tr>
                            <tr class="align-middle">
                                <td class="text-center">
                                    <img src="../imagenes/Ibuprofeno.jpg" alt="Ibuprofeno" width="64" height="64" class="img-fluid rounded" />
                                </td>
                                <td>Ibuprofeno</td>
                                <td>
                                    <input type="number" class="form-control form-control-sm" value="1" min="1" />
                                </td>
                                <td>$7.99</td>
                                <td>$7.99</td>
                            </tr>
                            <tr class="align-middle">
                                <td class="text-center">
                                    <img src="../imagenes/GelAntibacterial.jpg" alt="Gel Antibacterial" width="64" height="64" class="img-fluid rounded" />
                                </td>
                                <td>Gel Antibacterial</td>
                                <td>
                                    <input type="number" class="form-control form-control-sm" value="3" min="1" />
                                </td>
                                <td>$3.49</td>
                                <td>$10.47</td>
                            </tr>
                            <tr class="align-middle">
                                <td class="text-center">
                                    <img src="../imagenes/Vitaminas.jpg" alt="Multivitaminas" width="64" height="64" class="img-fluid rounded" />
                                </td>
                                <td>Multivitaminas</td>
                                <td>
                                    <input type="number" class="form-control form-control-sm" value="1" min="1" />
                                </td>
                                <td>$12.99</td>
                                <td>$12.99</td>
                            </tr>
                            <tr class="align-middle">
                                <td class="text-center">
                                    <img src="../imagenes/Tensiometro.jpg" alt="Tensiómetro" width="64" height="64" class="img-fluid rounded" />
                                </td>
                                <td>Tensiómetro</td>
                                <td>
                                    <input type="number" class="form-control form-control-sm" value="1" min="1" />
                                </td>
                                <td>$24.99</td>
                                <td>$24.99</td>
                            </tr>
                            <tr class="align-middle">
                                <td class="text-center">
                                    <img src="../imagenes/Oxigeno.jpg" alt="Oxímetro" width="64" height="64" class="img-fluid rounded" />
                                </td>
                                <td>Oxímetro</td>
                                <td>
                                    <input type="number" class="form-control form-control-sm" value="1" min="1" />
                                </td>
                                <td>$19.99</td>
                                <td>$19.99</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <hr />
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div class="fs-4 fw-medium">Total</div>
                    <div class="fs-1 fw-bold">$86.41</div>
                </div>
                <button type="button" class="btn btn-lg btn-primary">Proceder al Pago</button>
            </div>
        </div>
    </div>

    <script src="../JSc/carruselCategoria.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>

</html>
