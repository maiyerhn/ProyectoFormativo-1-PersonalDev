<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="/FamiSaludLa91/CSS/EstilosBodyLogin.css" rel="stylesheet" type="text/css"/>
        <link href="/FamiSaludLa91/CSS/EstilosEncabezadoLoginRegitro.css" rel="stylesheet" type="text/css"/>
         <link rel="icon" type="image/png" href="/FamiSaludLa91/imagenes/logo9.png">
        <title>Login</title>
    </head>
    <body>
        <div class="container-fluid m">
            <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
                <div class="container-fluid contenedor">
                    <a class="navbar-brand" href="#">
                        <img src="/FamiSaludLa91/imagenes/logo9.png" alt="Logo" id="logo">
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
                        <div class=""  role="alert">
                            <c:if test="${not empty error}">
                                <p style="color: red;">${error}</p>
                            </c:if>
                        </div>
                        <form method="POST" action="/FamiSaludLa91/CtrValidar?accion=ingresar">
                            <div class="form-group">
                                <label for="email">Usuario (E-mail)</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Ingresa Usuario">
                            </div>
                            <div class="form-group">
                                <label for="password">Contraseña</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Ingresa Contraseña">
                                <label class="form-check-label" for="rememberMe">Olvidaste tu contraseña</label>
                            </div>
                            <button type="submit" name="accion" value="ingresar" class="btn btn-success ingresar">Ingresar</button>
                        </form>
                    </div>
                    <div class="texto-stile">
                        <p> Otros</p>
                    </div>
                    <div class="login-form">
                        <div class="login-btn">
                            <button type="button" id="btnRegistrarse" class="btn btn-primary botones">Registrarse</button>
                            <button type="button" id="btnCancelar" class="btn btn-danger botones">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script>
            document.getElementById('btnRegistrarse').addEventListener('click', function () {
                window.location.href = '/FamiSaludLa91/Vistas/registrarse.jsp';
            });

            document.getElementById('btnCancelar').addEventListener('click', function () {
                window.location.href = '/FamiSaludLa91/Vistas/Referencia.jsp';
            });

        </script>
    </body>
</html>
