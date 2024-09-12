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
        .custom-confirm {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 300px;
            padding: 20px;
            background: #007bff;
            color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            z-index: 1000;
        }

        .custom-confirm .modal-title {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .custom-confirm .modal-buttons {
            margin-top: 20px;
        }

        .custom-confirm .btn {
            margin: 0 10px;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
    </style>
</head>

<body>
   <div class="container-fluid encabezado">
    <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
        <div class="container-fluid d-flex align-items-center">
            <a class="navbar-brand" href="/FamiSaludLa91/CtrProductos?accion=Inicio&id=${id}">
                <img src="/FamiSaludLa91/imagenes/logo9.png" alt="Famisalud la 91 Logo">
            </a>
            <p class="navbar-text fs-3 fw-bold text-white mb-0 me-2">Famisalud la 91</p>
            <div class="col-md-4 d-flex justify-content-center me-2">
                <div class="dropdown">
                    <button class="btn btn-primary btn-lg-custom dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                        Categorías <i class="bi bi-arrow-down-short"></i>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <c:forEach var="cat" items="${Categorias}">
                            <li><a class="dropdown-item" href="#">${cat.getNombre()}</a></li>
                            <input type="hidden" value="${cat.getId()}" name="catid" id="catid">
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <form class="form-control ms-auto d-flex busqueda" style="max-width: 350px;">
                <input class="form-control me-1" type="search" placeholder="Buscar productos..." aria-label="Buscar">
                <button class="btn btn-outline-light bg-success icono fs-9" type="submit">
                    <i class="bi bi-search"></i>
                </button>
            </form>
            <a class="nav-link nav-link-icon carrito ms-2" href="/FamiSaludLa91/CtrProductos?accion=Carrito">
                <i class="bi bi-cart3 fs-4">(<label style="color: darkorange">${contador}</label>)</i>
            </a>
            <div class="dropdown">
                <a class="nav-link dropdown-toggle carrito" href="#" role="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-person-fill text-white fs-3"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item btn-Usuario" href="#">Usuario</a></li>
                    <li><a class="dropdown-item btn-pedidos" href="#" data-bs-toggle="modal" data-bs-target="#pedidosModal">Pedidos</a></li>
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
            <div class="overlay"></div>
<div class="custom-confirm">
    <div class="modal-title">Confirmar eliminación</div>
    <div class="modal-buttons">
        <button class="btn btn-danger btn-confirm">Confirmar</button>
        <button class="btn btn-secondary btn-cancel">Cancelar</button>
    </div>
</div>

    <div class="container py-6">
        <div class="row">
            <div class="col-md-6">
                <div id="imagenGrande">
                    <img id="imagenGrandeImg" src="/FamiSaludLa91/imagenes/imagenCarrito.avif" alt="Imagen Grande">
                </div>
            </div>

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
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="pro" items="${productos}" varStatus="pos">
                                <c:set var="det" value="${carrito[pos.index]}"/>
                                <tr class="align-middle">
                                    <td class="text-center">
                                        <img src="${pro.foto}" alt="" class="img-fluid rounded" />
                                    </td>
                                    <td>${pro.nombre}</td>
                                    <td>
                                        <input class="precio" type="hidden" value="${pro.precio}" />
                                        <input class="idpro" type="hidden" value="${det.id}" />
                                        <input class="cantidad" id="cantidad" type="number" value="${det.cantidad}" min="1" />
                                    </td>
                                    <td>${pro.precio}</td>
                                    <td>${det.total}</td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-danger btn-sm btn-eliminar" data-id="${det.id}">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                                <c:set var="totalFinal" value="${totalFinal + dped.total}" />
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="table-responsive summary-table">
                    <table class="table table-bordered bg-light">
                        <tbody>
                            <tr>
                                <th scope="row">Total</th>
                                <td class="fs-4 fw-bold" >${total}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <a href="/FamiSaludLa91/CtrProductos?accion=listaPago&id=${idUsuario}"><button type="button" class="btn btn-lg btn-primary">Proceder al Pago</button></a>
                    <a href="/FamiSaludLa91/CtrProductos?accion=Inicio&id=${idUsuario}" class="btn btn-lg btn-secondary">Seguir Comprando</a>
                </div>
            </div>
        </div>
    </div>

    <script src="/FamiSaludLa91/JSc/manejoImagen.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/FamiSaludLa91/JSc/ActualizarCantidad.js" type="text/javascript"></script>
    <script src="/FamiSaludLa91/JSc/EliminarDeCarrito.js" type="text/javascript"></script>
</body>

</html>

