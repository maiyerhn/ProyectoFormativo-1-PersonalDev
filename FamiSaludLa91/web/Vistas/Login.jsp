<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="../CSS/EstilosBodyLogin.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/EstilosEncabezadoLoginRegitro.css" rel="stylesheet" type="text/css"/>
        <title>Login</title>
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
                        <h1 class="text-center">Login</h1>
                    </div>
                    <i class="bi bi-person-circle"></i>
                    <p>Ingresa tu usuario (E-mail) de Famisalud la 91</p>
                </div>
                <div class="login-registro">
                    <div class="login-form">
                        <form>
                            <div class="form-group">
                                <label for="email">Usuario (E-mail)</label>
                                <input type="email" class="form-control" id="email" placeholder="Ingresa Usuario">
                            </div>
                            <div class="form-group">
                                <label for="password">Contraseña</label>
                                <input type="password" class="form-control" id="password" placeholder="Ingresa Contraseña">
                                <label class="form-check-label" for="rememberMe">Olvidaste tu contraseña</label>
                            </div>
                            <button type="submit" class="btn btn-success ingresar">Ingresar</button>
                        </form>
                    </div>
                    <div class="texto-stile">
                        <p> Otros</p>
                    </div>
                    <div class="login-form">
                        <div class="login-btn">
                            <button type="button" class="btn btn-primary botones">Registrarse</button>
                            <button type="button" class="btn btn-danger botones">Cancelar</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>
