<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medio de Pago</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="/FamiSaludLa91/CSS/EstilosReferencia.css" rel="stylesheet" type="text/css" />
        <link rel="icon" type="image/png" href="/FamiSaludLa91/imagenes/logo9.png">
        <style>
            .error-message {
                color: red;
                font-size: 0.875em;
            }
            .form-control.error {
                border-color: red;
            }
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("log") == null || session.getAttribute("log").equals('0')) {
                response.sendRedirect("/FamiSaludLa91/Vistas/Login.jsp");
            }
        %>
        <div class="container-fluid encabezado">
            <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="/FamiSaludLa91/imagenes/logo9.png" alt="Famisalud la 91 Logo">
                    </a>
                    <p class="navbar-text fs-3 fw-bold text-white">Famisalud la 91</p>
                </div>
            </header>
        </div>
        <div class="container my-5">
            <div class="row g-4">
                <!-- Información del usuario -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Información del usuario</h5>
                            <p class="card-text">Datos del Usuario con los que se va a realizar el pedido.</p>
                        </div>
                        <div class="card-body">
                            <form id="payment-form" action="/FamiSaludLa91/CtrProductos?accion=ActualizarUserPago" method="POST">
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
                                        <input type="text" id="editPhone" name="phone" class="form-control" required pattern="\d{10}" value="${user.getTelefono()}">
                                        <div class="error-message" id="errorPhone"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editDireccion" class="form-label">Dirección:</label>
                                        <input type="text" id="editDireccion" name="direccion" class="form-control" required minlength="2" maxlength="50" value="${user.getDireccion()}">
                                        <div class="error-message" id="errorDireccion"></div>
                                    </div>
                                </c:if>
                                <button type="submit" class="btn btn-primary" id="submitButton">Actualizar</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Resumen del pedido -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Resumen del pedido</h5>
                            <p class="card-text">Información del pedido.</p>
                        </div>
                        <div class="card-body">
                            <c:if test="${not empty ped}">
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Subtotal</span>
                                    <span>${ped.getTotal()}</span>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Envío</span>
                                    <span>No Definido</span>
                                </div>
                                <hr>
                                <div class="d-flex justify-content-between font-weight-bold">
                                    <span>Total</span>
                                    <span>${ped.getTotal()}</span>
                                </div>
                            </c:if>

                        </div>
                        <div class="card-footer">
                            <a href="/FamiSaludLa91/CtrProductos?accion=solicitarPedido&id=${ped.getId()}&idUser=${user.getId()}"><button type="button" class="btn btn-primary w-100" id="payButton">Solicitar Pedido</button></a>
                            <button type="button" class="btn btn-danger w-100" id="cancelButton">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var phoneInput = document.getElementById('editPhone');
                var emailInput = document.getElementById('editEmail');


                function validatePhone(phone) {
                    return /^\d{10}$/.test(phone);
                }


                function validateEmail(email) {
                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    return emailRegex.test(email);
                }

                function validateForm() {
                    const phone = phoneInput.value;
                    const email = emailInput.value;

                    let isValid = true;
                    const errorMessages = {
                        phone: '',
                        email: ''
                    };

                    if (!validatePhone(phone)) {
                        isValid = false;
                        errorMessages.phone = 'El teléfono debe tener exactamente 10 dígitos.';
                    }

                    if (!validateEmail(email)) {
                        isValid = false;
                        errorMessages.email = 'El correo electrónico no es válido. Debe tener el formato correcto.';
                    }

                    document.getElementById('errorPhone').textContent = errorMessages.phone;
                    document.getElementById('errorEmail').textContent = errorMessages.email;

                    phoneInput.classList.toggle('error', !!errorMessages.phone);
                    emailInput.classList.toggle('error', !!errorMessages.email);

                    return isValid;
                }

                function toggleSaveButton() {
                    const btnSave = document.getElementById('submitButton');
                    if (validateForm()) {
                        btnSave.disabled = false;
                    } else {
                        btnSave.disabled = true;
                    }
                }

                phoneInput.addEventListener('input', toggleSaveButton);
                emailInput.addEventListener('input', toggleSaveButton);


                toggleSaveButton();
            });
        </script>
    </body>
</html>
