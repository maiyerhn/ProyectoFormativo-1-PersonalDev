<%-- 
    Document   : DetallePedido
    Created on : 8/08/2024, 08:42:52 AM
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="../CSS/EstilosReferencia.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid encabezado">
        <header class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="/FamiSaludLa91/imagenes/logo9.png" alt="" class="me-2" style="max-width: 100px;"/>
                </a>
                <p class="navbar-text fs-3 fw-bold text-white mb-0">Famisalud la 91</p>
                <a class="ms-auto" href="#">
                    <i class="bi bi-person-fill text-white fs-3"></i>
                </a>                   
            </div>        
        </header>

        <div class="menu">
            <div class="Lista">
                <a class="nav-link opciones" href="/FamiSaludLa91/CtrProductos?accion=home" id="navbarDropdown">
                    Inicio
                </a>
                <a class="nav-link opciones" href="#" id="navbarDropdown">
                    Medicamentos
                    <ul class="dropdown-menu">
                        <li>Alivio del Dolor</li>
                        <li>Salud Digestiva</li>
                        <li>Salud y Medicamentos</li>
                        <li>Tratamiento de la Gripe</li>
                    </ul>
                </a>
                <a class="nav-link opciones" href="#" id="navbarDropdown">
                    Belleza
                    <ul class="dropdown-menu">
                        <li>Belleza 1</li>
                        <li>Belleza 2</li>
                        <li>Belleza 3</li>
                    </ul>
                </a>
                <a class="nav-link opciones" href="#" id="navbarDropdown">
                    Cuidado al Bebé
                    <ul class="dropdown-menu">
                        <li>Cuidado al Bebé 1</li>
                        <li>Cuidado al Bebé 2</li>
                        <li>Cuidado al Bebé 3</li>
                    </ul>
                </a>
                <a class="nav-link opciones" href="#" id="navbarDropdown">
                    Alimentos y Bebidas
                    <ul class="dropdown-menu">
                        <li>Alimentos y Bebidas 1</li>
                        <li>Alimentos y Bebidas 2</li>
                        <li>Alimentos y Bebidas 3</li>
                    </ul>
                </a>
                <a class="nav-link opciones" href="#" id="navbarDropdown">
                    Otros
                </a>
            </div>
        </div>
    </div>

    <div class="detalle-pedido">
        <div class="volver">
            <a href="javascript:history.back()"><i class="bi bi-arrow-left"></i></a>
        </div>
        <div class="fecha-hora">
            <p><strong>Fecha:</strong> 13/12/2023</p>
        </div>
        <h3>Detalle de Pedido</h3>
        <div class="pedido-info">
            <p><strong>ID:</strong> 23</p>
            <p><strong>Nombre:</strong> Maiyer Hernández</p>
            <p><strong>Dirección:</strong> Kra 21 # 15-52</p>
        </div>
        <div class="productos">
            <table>
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Mieltertos</td>
                        <td>$ 32.500</td>
                        <td>3</td>
                    </tr>
                    <tr>
                        <td>Noraver Gripa</td>
                        <td>$ 14.600</td>
                        <td>3</td>
                    </tr>
                    <tr>
                        <td>Noxpirin Plus</td>
                        <td>$ 7.155</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>Envío</td>
                        <td>$ 10.000</td>
                        <td>1</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="total">
            <p>Total a Pagar: $ 158.455</p> <p class="k"><strong>Hora:</strong> 10:50 AM</p>
        </div>
    </div>
    </body>
</html>
