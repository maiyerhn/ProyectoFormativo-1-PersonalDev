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
    <style>
        .form-control.error {
            border-color: red;
        }

        .error-message {
            color: red;
            font-size: 0.875em; 
            margin-top: 0.25em; 
        }

        .modal-body {
            max-height: 60vh;
            overflow-y: auto; 
        }
   /* Estilos del modal de pedidos */
.modal-content {
    background-color: #f0f8ff; 
    color: #333; 
    border-radius: 8px;
}

.modal-header,
.modal-footer {
    background-color: #007bff; 
    color: #ffffff; 
}

.modal-title {
    color: #ffffff; 
}

.pedido-card {
    border: 1px solid #007bff; 
    border-radius: 8px;
    padding: 1em;
    margin-bottom: 1em;
    background-color: #ffffff; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.pedido-card h6 {
    margin-top: 0;
    font-size: 1.25em;
    color: #007bff;
}

.pedido-card p {
    margin: 0.5em 0;
    font-size: 1em;
    color: #333333; 
}

.pedido-card strong {
    color: #007bff;
}


.btn-outline-light.bg-success {
    border-color: #007bff; 
    color: #007bff;
}

.btn-outline-light.bg-success:hover {
    background-color: #007bff; 
    color: #ffffff; 
}

.category-item {
    color: #004085; 
}

.category-item:hover {
    color: #007bff; 
}
   /* Estilos del modal de notificaciones */
 .notification-card {
        border: 1px solid #007bff;
        border-radius: 8px;
        padding: 1em;
        margin-bottom: 1em;
        background-color: #ffffff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .notification-card h6 {
        margin-top: 0;
        font-size: 1.25em;
        color: #007bff;
    }

    .notification-card p {
        margin: 0.5em 0;
        font-size: 1em;
        color: #333333;
    }

    .notification-card strong {
        color: #007bff;
    }

    /* estilos del carrusel de productos */
    .product-carousel .carousel-item {
        padding: 10px;
    }
    
    .product-carousel .product-card {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 1em;
        background-color: #e6f0ff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 1em;
        max-height: 350px;
        max-width: 300px;
        height: auto;
        margin-left: auto;
        margin-right: auto;
    }
    
    .product-carousel .product-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }
    
    .product-carousel .carousel-control-prev,
    .product-carousel .carousel-control-next {
        filter: invert(1) brightness(1.5);
    }
    
    .product-carousel .carousel-control-prev:hover,
    .product-carousel .carousel-control-next:hover {
        filter: invert(0) brightness(1.2);
    }
</style>
</head>
<body>
<div class="container-fluid encabezado">
    <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
        <div class="container-fluid d-flex align-items-center">
            <a class="navbar-brand" href="/FamiSaludLa91/CtrProductos?accion=Inicio&id=${user.getId()}">
                <img src="/FamiSaludLa91/imagenes/logo9.png" alt="Famisalud la 91 Logo">
            </a>
            <p class="navbar-text fs-3 fw-bold text-white mb-0 me-2">Famisalud la 91</p>
            <div class="col-md-4 d-flex justify-content-center me-2">
                <div class="dropdown">
                    <button class="btn btn-primary btn-lg-custom dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                        Categorías <i class="bi bi-arrow-down-short"></i>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <c:forEach var="cate" items="${Categorias}">
                            <li><a class="dropdown-item" href="/FamiSaludLa91/CtrProductos?accion=buscarcateg&catid=${cate.getId()}">${cate.getNombre()}</a></li>
                            <input type="hidden" value="${cate.getId()}" name="catid" id="catid">
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <form class="form-control ms-auto d-flex busqueda" method="post" action="/FamiSaludLa91/CtrProductos?accion=buscarprod" style="max-width: 350px;">
                <input class="form-control me-1" type="search" name="txtbuscar" placeholder="Buscar productos..." aria-label="Buscar">
                <button class="btn btn-outline-light bg-success icono fs-9" name="accion" value="buscarprod" type="submit">
                    <i class="bi bi-search"></i>
                </button>
            </form>
            <a class="nav-link nav-link-icon carrito ms-2" href="/FamiSaludLa91/CtrCategorias?accion=buscarCatCarrito">
                <i class="bi bi-cart3 fs-4">(<label style="color: darkorange">${contador}</label>)</i>
            </a>
            <a class="nav-link nav-link-icon carrito ms-2" href="#" data-bs-toggle="modal" data-bs-target="#notificacionesModal">
                <i class="bi bi-bell fs-4"></i>
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

   
    <!-- Modal de Pedidos -->
<div class="modal fade" id="pedidosModal" tabindex="-1" aria-labelledby="pedidosModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="pedidosModalLabel">Mis Pedidos</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Aquí se cargarán los pedidos del usuario -->
                <div id="pedidosList">
                    <c:forEach var="pedido" items="${pedidos}">
                        <div class="pedido-card">
                            <h6>Pedido #${pedido.getId()}</h6>
                            <p><strong>Estado:</strong> ${pedido.getEstado()}</p>
                            <p><strong>Fecha:</strong> ${pedido.getFechaActual()}</p>
                            <p><strong>Total:</strong> ${pedido.getTotal()}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>


    <!-- Modal de Información de Usuario -->
    <section class="full-width-carousel">
        <div class="overlay"></div>
        <div class="custom-confirm">
            <div class="modal-header">
                <img src="/FamiSaludLa91/imagenes/icons.jpg" alt="User Avatar" id="imgIcon" />
            </div>
            <div class="modal-body">
                <div class="view-mode">
                    <c:if test="${not empty user}">
                        <p><strong>Nombre:</strong> <span id="view-nombre">${user.getNombre()}</span></p>
                        <p><strong>Apellidos:</strong> <span id="view-apellido">${user.getApellido()}</span></p>
                        <p><strong>Email:</strong> <span id="view-email">${user.getCorreo()}</span></p>
                        <p><strong>Contraseña:</strong> <span id="view-contrasena">${user.getContrasena()}</span></p>
                        <p><strong>Teléfono:</strong> <span id="view-telefono">${user.getTelefono()}</span></p>
                        <p><strong>Dirección:</strong> <span id="view-direccion">${user.getDireccion()}</span></p>
                        </c:if>
                </div>
                <div class="edit-mode">
                    <h2>Editar Información</h2>
                    <form id="editForm" action="/FamiSaludLa91/CtrProductos?accion=ActualizarUser" method="POST">
                        <c:if test="${not empty user}">
                            <div class="mb-3">
                                <label for="editName" class="form-label">Nombre:</label>
                                <input type="hidden" id="editId" name="id" class="form-control" value="${user.getId()}">
                                <input type="text" id="editName" name="name" class="form-control" required minlength="2" maxlength="50" value="${user.getNombre()}">
                                <div class="error-message" id="errorName"></div>
                            </div>
                            <div class="mb-3">
                                <label for="editApellidos" class="form-label">Apellido:</label>
                                <input type="text" id="editApellidos" name="apellidos" class="form-control" required minlength="2" maxlength="50" value="${user.getApellido()}">
                                <div class="error-message" id="errorApellidos"></div>
                            </div>
                            <div class="mb-3">
                                <label for="editEmail" class="form-label">Correo Electrónico:</label>
                                <input type="email" id="editEmail" name="email" class="form-control" required value="${user.getCorreo()}">
                                <div class="error-message" id="errorEmail"></div>
                            </div>
                            <div class="mb-3">
                                <label for="editPhone" class="form-label">Teléfono:</label>
                                <input type="number" id="editPhone" name="phone" class="form-control" required pattern="\d{10}" value="${user.getTelefono()}">
                                <div class="error-message" id="errorPhone"></div>
                            </div>
                            <div class="mb-3">
                                <label for="editDireccion" class="form-label">Dirección:</label>
                                <input type="text" id="editDireccion" name="direccion" class="form-control" required minlength="2" maxlength="50" value="${user.getDireccion()}">
                                <div class="error-message" id="errorDireccion"></div>
                            </div>
                            <div class="mb-3">
                                <label for="editPassword" class="form-label">Contraseña:</label>
                                <input type="password" id="editPassword" name="password" class="form-control" required minlength="8" maxlength="20" value="${user.getContrasena()}">
                                <div class="error-message" id="errorPassword"></div>
                            </div>
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Confirmar Contraseña:</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required minlength="8" maxlength="20" value="${user.getContrasena()}">
                                <div class="error-message" id="errorConfirmPassword"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-save" id="btnSave" disabled>Guardar</button>
                                <button type="button" class="btn btn-cancel" onclick="toggleEditMode()">Cancelar</button>
                            </div>
                        </c:if>
                    </form>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-edit">Editar</button>
                <a href=""><button type="button" class="btn btn-save" style="display: none;">Guardar Cambios</button></a>
                <button type="button" class="btn btn-cerrar btn-secondary">Cerrar</button>
            </div>
        </div>
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
                <img src="https://www.shutterstock.com/image-vector/3d-medicine-concept-medical-pharmacy-260nw-2412705345.jpg" alt="Thumbnail 1" data-bs-slide-to="0" class="active">
                <img src="https://www.cofm.es/recursos/img/portal/2015/03/09/medicamentos-farmacia-carrusel-mini-1181x500.jpg" alt="Thumbnail 2" data-bs-slide-to="1">
                <img src="https://estaticosgn-cdn.deia.eus/clip/41324efa-3edc-4a1c-96d9-cc42bcc3f489_16-9-discover-aspect-ratio_default_0.jpg" alt="Thumbnail 3" data-bs-slide-to="2">
            </div>
        </div>
    </section>
    
    <!-- carrusel de productos en descuento -->
    <section class="container mt-5">
        <div id="productCarousel" class="carousel slide product-carousel" data-bs-ride="carousel">
            <div class="carousel-inner">
                
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>

    
    <!-- Productos -->
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
    
   <!-- Modal de Notificaciones -->
<div class="modal fade" id="notificacionesModal" tabindex="-1" aria-labelledby="notificacionesModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="notificacionesModalLabel">Notificaciones</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Aquí se cargarán las notificaciones -->
                <div id="notificacionesList">
                    <c:forEach var="ped" items="${ped}">
                        <div class="notification-card">
                            <h6>Notificación</h6>
                            <p><strong>El pedido ha sido revisado, el valor del envío ingresado por el Administrador es: </strong></p>
                            <p><strong>${ped.envio}</strong></p>
                            <a href="/FamiSaludLa91/CtrPedido?accion=eliminarSolicitud&idPedido=${ped.id}&idUser=${user.getId()}"><button type="button" class="btn btn-danger">cancelar Pedido</button></a>
                            <a href="/FamiSaludLa91/CtrPedido?accion=terminarPedido&idPedido=${ped.id}&idUser=${user.getId()}"><button type="button" class="btn btn-primary">Realizar Pedido</button></a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>



    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="/FamiSaludLa91/JSc/validacionUser.js" type="text/javascript"></script>
    <script src="/FamiSaludLa91/JSc/funcion.js" type="text/javascript"></script>
    <script src="/FamiSaludLa91/JSc/CarruselImagenes.js" type="text/javascript"></script>
</body>
</html>
