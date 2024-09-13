<!DOCTYPE html>
<html lang="es">
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventario - Famisalud la 91</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css">
    <style>
        .readonly-field {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            padding: 0.375rem 0.75rem;
            border-radius: 0.25rem;
            color: #495057;
        }
        .input-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }
    </style>
</head>
<body>
    <div class="container-fluid encabezado">
        <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="/FamiSaludLa91/imagenes/logo9.png" alt="Famisalud la 91" class="me-2" />
                </a>
                <p class="navbar-text fs-3 fw-bold text-white text-start ms-5">Famisalud la 91</p>
                <div class="dropdown">
                    <a class="nav-link dropdown-toggle carrito" href="#" role="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person-fill text-white fs-3"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
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
        <nav class="menu">
            <div class="Lista">
                <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=listarInventario&id=${id}" id="navbarDropdown">Inventario</a>
                <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=listar&id=${id}" id="navbarDropdown">Productos</a>
                <a class="nav-link opciones" href="/FamiSaludLa91/CtrPedido?accion=listarped&id=${id}" id="navbarDropdown">Pedidos</a>
                <a class="nav-link opciones" href="/FamiSaludLa91/CtrPro?accion=listarp&id=${id}" id="navbarDropdown">Proveedores</a>
                <a class="nav-link opciones" href="/FamiSaludLa91/CtrCategorias?accion=listarCategorias&id=${id}" id="navbarDropdown">Categorías</a>
                <a class="nav-link opciones" href="/FamiSaludLa91/CtrUsuario?accion=listarU&id=${id}" id="navbarDropdown">Usuarios</a>
            </div>
        </nav>
    </div>
    <main>
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
                    <form id="editForm" action="/FamiSaludLa91/CtrProductos?accion=ActualizarUserInventario" method="POST">
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
        <div class="container mt-5">
            <div class="row">
                <!-- Columna de pedidos en espera -->
                <div class="col-lg-12 mb-4">
                    <div class="recent-orders">
                        <h5>Pedidos En Espera</h5>
                        <small>Resumen de los Pedidos que se encuentran en Espera:</small>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Usuario</th>
                                        <th>Correo</th>
                                        <th>Estado</th>
                                        <th>Fecha y Hora</th>
                                        <th>Dirección</th>
                                        <th>Monto</th>
                                        <th>Envío</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="ped" items="${pedidos}" varStatus="status">
                                        <c:set var="usuario" value="${usuarios[status.index]}"/>
                                        <tr>
                                            <td>${usuario.nombre}</td>
                                            <td>${usuario.correo}</td>
                                            <td><span class="readonly-field">${ped.estado}</span></td>
                                            <td>${ped.fechaActual}</td>
                                            <td>${usuario.direccion}</td>
                                            <td>${ped.total}</td>
                                            <td>
                                                <div class="input-group">
                                                    <form method="POST" action="/FamiSaludLa91/CtrPedido?accion=enviarValor&iduser=${usuario.id}" style="display: flex; gap: 10px;">
                                                        <input type="hidden" name="pedidoId" value="${ped.id}">
                                                        <input type="text" name="envio" class="form-control" placeholder="Valor del Envío" required>
                                                        <button type="submit" class="btn btn-primary">Enviar Valor</button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Fila de estadísticas -->
                <div class="col-lg-12 mb-4">
                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <div class="icon-box">
                                <i class="bi bi-person"></i> 
                                <div class="text-box">
                                    <div>
                                        <strong>Usuarios:</strong>
                                        <p>${cantidadU}</p>
                                    </div>
                                    <a href="/FamiSaludLa91/CtrUsuario?accion=listarU" class="arrow"><i class="bi bi-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="icon-box">
                                <i class="bi bi-box"></i> 
                                <div class="text-box">
                                    <div>
                                        <strong>Productos:</strong>
                                        <p>${cantidadPro}</p>
                                    </div>
                                    <a href="/FamiSaludLa91/CtrProductos?accion=listar" class="arrow"><i class="bi bi-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="icon-box">
                                <i class="bi bi-cart"></i>
                                <div class="text-box">
                                    <div>
                                        <strong>Pedidos:</strong>
                                        <p>${cantidadPe}</p>
                                    </div>
                                    <a href="/FamiSaludLa91/CtrPedido?accion=listarped" class="arrow"><i class="bi bi-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="/FamiSaludLa91/JSc/validacionUser.js" type="text/javascript"></script>
</body>
</html>
