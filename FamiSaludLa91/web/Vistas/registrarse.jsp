<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="/FamiSaludLa91/CSS/EstilosEncabezadoLoginRegitro.css" rel="stylesheet" type="text/css"/>
    <link href="/FamiSaludLa91/CSS/EstilosBodyRegistro.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" type="image/png" href="/FamiSaludLa91/imagenes/logo9.png">
    <title>Registrarse</title>
    <style>
        .error-message {
            color: red;
            font-size: 0.875em;
            margin-top: 0.25em;
        }
    </style>
</head>
<body>
    <div class="container-fluid encabezado">
        <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <div class="container-fluid contenedor">
                <a class="navbar-brand" href="#">
                    <img src="../imagenes/logo9.png" alt="Logo" id="logo">
                </a>
                <p class="navbar-text fs-3 fw-bold text-white">Famisalud la 91</p>
            </div>
        </header>
    </div>
    <div class="login-container">
        <div class="login-body">
            <div class="icon-text">
                <div class="login-header">
                    <h1 class="text-center">Registrarse</h1>
                </div>
                <i class="bi bi-person-add"></i>
                <p>Ingresa los datos para crear tu cuenta en Famisalud la 91</p>
            </div>
            <div class="login-registro">
                <div class="login-form">
                    <form action="/FamiSaludLa91/CtrUsuario?accion=registrarse" method="GET">
                        <div class=""  role="alert">
                            <c:if test="${not empty error}">
                                <p style="color: red;">${error}</p>
                            </c:if>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="Nombre">Nombre</label>
                                <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingresa Nombre">
                                <div id="nombre-error" class="error-message"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="Apellidos">Apellidos</label>
                                <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingresa Apellidos">
                                <div id="apellido-error" class="error-message"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="Telefono">Telefono</label>
                                <input type="text" class="form-control"  name="telefono" id="telefono" placeholder="Ingresa Telefono">
                                <div id="telefono-error" class="error-message"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="Direccion">Direccion</label>
                                <input type="text" class="form-control" name="direccion" id="direccion" placeholder="Ingresa Direccion">
                                <div id="direccion-error" class="error-message"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="User">Usuario (E-mail)</label>
                                <input type="text" class="form-control" id="user" name="user" placeholder="Ingresa Usuario">
                                <div id="user-error" class="error-message"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="password">Contraseña</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Ingresa Contraseña">
                                <div id="password-error" class="error-message"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="password1">Confirmar Contraseña</label>
                                <input type="password" class="form-control" id="password1" name="password1" placeholder="Confirma Contraseña">
                                <div id="password1-error" class="error-message"></div>
                            </div>
                            <div class="col-md-12 mb-3">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="acceptTerms">
                                    <label class="form-check-label" for="acceptTerms">Aceptar Términos y Condiciones</label>
                                </div>
                                <div id="acceptTerms-error" class="error-message"></div>
                            </div>
                        </div>
                        <div class="login-btn">
                            <button type="submit" name="accion" value="registrarse" class="btn btn-success ingresar">Registrarse</button>
                            <button type="button" id="btnCancelar" class="btn btn-danger botones">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="/FamiSaludLa91/JSc/ScriptRegistro.js" type="text/javascript"></script>
</body>
</html>
