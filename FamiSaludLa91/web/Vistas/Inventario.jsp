<!DOCTYPE html>
<html>
    <head>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inventario - Famisalud la 91</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css">
        <style>
            .info-box, .recent-orders, .admin-info, .top-products {
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: #f8f9fa;
                margin-bottom: 30px;
            }
            .info-box h5, .recent-orders h5, .admin-info h5, .top-products h5 {
                margin-bottom: 10px;
            }
            .info-box small, .recent-orders small {
                display: block;
                margin-bottom: 20px;
                color: #6c757d;
            }
            .info-item {
                display: flex;
                align-items: center;
                padding: 15px;
                border-radius: 8px;
                background-color: #e9ecef;
                margin-bottom: 10px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            }
            .info-item i {
                font-size: 2rem;
                margin-right: 15px;
                color: #007bff;
            }
            .info-item strong {
                display: block;
                font-size: 1.1rem;
            }
            .icon-box {
                display: flex;
                align-items: center;
                padding: 15px;
                border-radius: 8px;
                background-color: #e9ecef;
                margin-bottom: 10px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                position: relative;
            }
            .icon-box i {
                font-size: 2.5rem;
                margin-right: 15px;
                color: #007bff;
            }
            .icon-box .text-box {
                flex: 1;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .icon-box .text-box h6 {
                margin: 0;
                font-size: 1rem;
            }
            .icon-box .text-box p {
                font-size: 1.5rem;
                margin: 0;
                font-weight: bold;
            }
            .icon-box .text-box a {
                color: #007bff;
                text-decoration: none;
            }
            .icon-box .text-box a:hover {
                text-decoration: underline;
            }
            .icon-box .arrow {
                font-size: 1.5rem;
                color: #007bff;
            }
            .recent-orders {
                overflow-x: auto;
                margin-bottom: 30px;
                margin-top: 40px;
            }
            .recent-orders .table th, .recent-orders .table td {
                text-align: center;
            }
            .admin-info {
                position: relative;
                padding-left: 60px;
                display: flex;
                align-items: flex-start;
                justify-content: center;
                text-align: left;
                margin-top: 40px;
            }
            .admin-info .admin-details {
                padding: 15px;
                border-radius: 8px;
                background-color: #e9ecef;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            }
            .admin-info .admin-details strong {
                display: block;
                font-size: 1.1rem;
            }
            .admin-info i {
                position: absolute;
                top: 15px;
                left: 15px;
                font-size: 3rem;
                color: #007bff;
            }
            .admin-info-container {
                margin-bottom: 40px;
            }
            .top-products ul {
                list-style: none;
                padding: 0;
            }
            .top-products ul li {
                padding: 8px;
                background-color: #e9ecef;
                border-radius: 8px;
                margin-bottom: 8px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            }
            @media (max-width: 768px) {
                .admin-info-container, .recent-orders {
                    margin-bottom: 20px;
                }
                .admin-info, .recent-orders {
                    margin-right: 0;
                    margin-left: 0;
                }
            }
        </style>
    </head>
    <body>
        <div class="container-fluid encabezado ">
            <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="/FamiSaludLa91/imagenes/logo9.png" alt="" class="me-2" />
                    </a>
                    <p class="navbar-text fs-3 fw-bold text-white text-start ms-3">Famisalud la 91</p>
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
            <div class="menu">
                <div class="Lista">
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=home" id="navbarDropdown">
                        Inventario
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=listar" id="navbarDropdown">
                        Productos
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrPedido?accion=listarped" id="navbarDropdown">
                        Pedidos
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrPro?accion=listarp" id="navbarDropdown">
                        Proveedores
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrCategorias?accion=listarCategorias" id="navbarDropdown">
                        Categorias
                    </a>
                    <a class="nav-link opciones" href="/FamiSaludLa91/CtrUsuario?accion=listarU" id="navbarDropdown">
                        Usuarios
                    </a>
                </div>
            </div>
        </div>
        <h2 class="titulo-inventario text-center fw-bold titulos">Inventario</h2>
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-4 admin-info-container">
                    <div class="admin-info">
                        <i class="bi bi-person-fill-lock"></i> 
                        <div class="admin-details">
                            <h5>Información del Administrador</h5>
                            <strong>Nombre:</strong> ${usuario.getNombre()}
                            <strong>Email:</strong> ${usuario.getCorreo()}
                            <strong>Teléfono:</strong> ${usuario.getTelefono()}
                            <strong>Rol:</strong> ${usuario.getRol()}
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 mb-4">
                    <div class="recent-orders">
                        <h5>Pedidos Recientes</h5>
                        <small>Resumen de los últimos 5 pedidos realizados:</small>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Correo</th>
                                    <th>Estado</th>
                                    <th>Fecha y Hora</th>
                                    <th>Monto</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>juan.perez@ejemplo.com</td>
                                    <td>En espera</td>
                                    <td>2024-08-14 10:30 AM</td>
                                    <td>$120,000 COP</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="icon-box">
                        <i class="bi bi-person"></i> 
                        <div class="text-box">
                            <div>
                                <strong>Usuarios:</strong>
                                <p>1,234</p>
                            </div>
                            <a href="#" class="arrow"><i class="bi bi-chevron-right"></i></a>
                        </div>
                    </div>
                    <div class="icon-box">
                        <i class="bi bi-box"></i> 
                        <div class="text-box">
                            <div>
                                <strong>Productos:</strong>
                                <p>890</p>
                            </div>
                            <a href="#" class="arrow"><i class="bi bi-chevron-right"></i></a>
                        </div>
                    </div>
                    <div class="icon-box">
                        <i class="bi bi-cart"></i>
                        <div class="text-box">
                            <div>
                                <strong>Pedidos:</strong>
                                <p>123</p>
                            </div>
                            <a href="#" class="arrow"><i class="bi bi-chevron-right"></i></a>
                        </div>
                    </div>
                    <div class="icon-box">
                        <i class="bi bi-activity"></i>
                        <div class="text-box">
                            <div>
                                <strong>Ingresos Totales:</strong>
                                <p>$12,345,000 COP</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 mb-4">
                    <div class="top-products">
                        <h5>5 Productos Más y Menos Vendidos</h5>
                        <div class="row">
                            <div class="col-md-6">
                                <h6>Más Vendidos</h6>
                                <ul>
                                    <li>Producto A - 500 unidades</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6>Menos Vendidos</h6>
                                <ul>
                                    <li>Producto F - 50 unidades</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
</html>
