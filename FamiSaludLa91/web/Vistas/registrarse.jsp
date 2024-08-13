<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="../CSS/EstilosEncabezadoLoginRegitro.css" rel="stylesheet" type="text/css"/>
    <link href="../CSS/EstilosBodyRegistro.css" rel="stylesheet" type="text/css"/>
    <title>Registrarse</title>
    
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
                    <form>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="Nombre">Nombre</label>
                                <input type="text" class="form-control" id="Nombre" placeholder="Ingresa Nombre">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="Apellidos">Apellidos</label>
                                <input type="text" class="form-control" id="Apellidos" placeholder="Ingresa Apellidos">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="Telefono">Telefono</label>
                                <input type="text" class="form-control" id="Telefono" placeholder="Ingresa Telefono">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="Direccion">Direccion</label>
                                <input type="text" class="form-control" id="Direccion" placeholder="Ingresa Direccion">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="User">Usuario (E-mail)</label>
                                <input type="text" class="form-control" id="User" placeholder="Ingresa Usuario">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="password">Contraseña</label>
                                <input type="password" class="form-control" id="password" placeholder="Ingresa Contraseña">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="password1">Confirmar Contraseña</label>
                                <input type="password" class="form-control" id="password1" placeholder="Confirma Contraseña">
                            </div>
                            <div class="col-md-12 mb-3">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="acceptTerms">
                                    <label class="form-check-label" for="acceptTerms">Aceptar Términos y Condiciones</label>
                                </div>
                            </div>
                        </div>
                        <div class="login-btn">
                            <button type="submit" class="btn btn-success ingresar">Registrarse</button>
                            <button type="button" id="btnCancelar" class="btn btn-danger botones"  id="cancelar">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
 
document.getElementById('btnCancelar').addEventListener('click', function () {
    window.location.href = '/FamiSaludLa91/Vistas/Referencia.jsp';
});

    </script>
    <script src="../JSc/ScriptRegistro.js" type="text/javascript"></script>
</body>
</html>
