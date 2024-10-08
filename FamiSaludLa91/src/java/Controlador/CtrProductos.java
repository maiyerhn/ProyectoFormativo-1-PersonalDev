/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Configuracion.conectar;
import Modelo.Categoria;
import Modelo.CategoriaDAO;
import Modelo.DetallePedido;
import Modelo.DetallePedidoDAO;
import Modelo.Pedido;
import Modelo.PedidoDAO;
import Modelo.Productos;
import Modelo.ProductosDAO;
import Modelo.Proveedor;
import Modelo.ProveedorDAO;
import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Maiyer
 */
@WebServlet(name = "CtrProductos", urlPatterns = {"/CtrProductos"})
@MultipartConfig
public class CtrProductos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    List<DetallePedido> listacarrito;
    List<Productos> listaProductos = new ArrayList();
    List<Categoria> categoria = new ArrayList();
    List<Proveedor> proveedor = new ArrayList();
    List<Pedido> listapEspera = new ArrayList();
    List<Pedido> listaSolicitado = new ArrayList();
    UsuarioDAO usudao = new UsuarioDAO();
    PedidoDAO pedidodao = new PedidoDAO();
    ProductosDAO pdao = new ProductosDAO();
    CategoriaDAO cdao = new CategoriaDAO();
    ProveedorDAO prdao = new ProveedorDAO();
    DetallePedidoDAO detalleDAO = new DetallePedidoDAO();
    Productos pro = new Productos();
    Usuario user;
    Pedido ped;
    DetallePedido detalleP;
    String fvEdit;
    int subtotal, idDetalle;
    int cantidad, idp, prep, catp, stocp, prove;
    int cantidadUsuarios, cantidadPedidos, cantidadProductos;
    int totalpagar;
    String ultimoP, nomp, descp, fotop;

    public static String encriptarcontrasena(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String nombre, descripcion, fotos;
        int id, precio, stock, categ;
        System.out.println("accion= " + accion);
        try {
            List<Productos> productos = pdao.obtenerProductos();
            List<Productos> lpro = pdao.obtenerProductos();
            System.out.println("productos " + productos.get(0).getNombre());
            Productos p = new Productos();

            switch (accion) {
                case "home":
                    request.setAttribute("Productos", productos);
                    System.out.println("Entro A enviar los Productos");
                    request.getRequestDispatcher("/Vistas/Referencia.jsp").forward(request, response);
                    break;
                case "listar":
                    categoria = cdao.listar();
                    System.out.println("categorias: " + categoria.size());
                    request.setAttribute("Categorias", categoria);

                    proveedor = prdao.obtenerproveedor();
                    System.out.println("proveedor: " + proveedor.size());
                    request.setAttribute("Proveedor", proveedor);

                    request.setAttribute("listar", lpro);
                    System.out.println("Entro A Listar los Productos");
                    request.getRequestDispatcher("/Vistas/Productos.jsp").forward(request, response);
                    break;
                case "Agregar":
                    try {
                        nombre = request.getParameter("txtnombre");
                        System.out.println("nombre: " + nombre);

                        descripcion = request.getParameter("txtdescripcion");
                        System.out.println("descripcion: " + descripcion);

                        precio = Integer.parseInt(request.getParameter("txtprecio"));
                        System.out.println("precio: " + precio);

                        Part filePart = request.getPart("foto");
                        String fileName = getFileName(filePart);
                        String uploadPath = getServletContext().getRealPath("/imagenes");
                        System.out.println("Ruta de subida: " + uploadPath);

                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) {
                            System.out.println("Directorio no existe, creando carpeta 'imagenes'");
                            uploadDir.mkdir();
                        }

                        if (uploadDir.canWrite()) {
                            System.out.println("Se puede escribir en la carpeta 'imagenes'");
                        } else {
                            System.out.println("No se puede escribir en la carpeta 'imagenes'");
                        }

                        File file = new File(uploadDir, fileName);
                        filePart.write(file.getAbsolutePath());

                        fotos = "imagenes/" + fileName;
                        System.out.println("fotos: " + fotos);

                        categ = Integer.parseInt(request.getParameter("categoria"));
                        System.out.println("categoria: " + categ);

                        stock = Integer.parseInt(request.getParameter("txtstock"));
                        System.out.println("stock: " + stock);

                        prove = Integer.parseInt(request.getParameter("proveedor"));
                        System.out.println("proveedor: " + prove);

                        System.out.println("nombre: " + nombre);
                        System.out.println("descripcion: " + descripcion);
                        System.out.println("precio: " + precio);
                        System.out.println("foto: " + fotos);
                        System.out.println("categoria: " + categ);
                        System.out.println("stock: " + stock);
                        String fv = request.getParameter("txtfechavencimiento");
                        SimpleDateFormat formatoDate = new SimpleDateFormat("yyyy-MM-dd");
                        Date fechaVencimiento = null;
                        java.sql.Date fechaVencimientoSql = null;
                        try {
                            fechaVencimiento = formatoDate.parse(fv);
                            fechaVencimientoSql = new java.sql.Date(fechaVencimiento.getTime());
                        } catch (Exception e) {
                            System.out.println("Error al convertir los Datos de String a DATE");
                        }
                        pro.setNombre(nombre);
                        pro.setDescripcion(descripcion);
                        pro.setPrecio(precio);
                        pro.setFoto(fotos);
                        pro.setIdCategoria(categ);
                        pro.setStock(stock);
                        pro.setProveedor(prove);
                        pro.setFechaVencimiento(fechaVencimientoSql);

                        if (pdao.crear(pro)) {
                            System.out.println("Se creó el producto");
                            request.getRequestDispatcher("CtrProductos?accion=listar").forward(request, response);
                        } else {
                            System.out.println("Error al crear el producto");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case "Inicio":
                    idp = Integer.parseInt(request.getParameter("id"));
                    System.out.println("ingreso el usuario con id: " + idp);
                    String estado = "CARRITO";
                    int total = 0;
                    user = usudao.listarT(idp);
                    System.out.println("el usuario es: " + user.getNombre() + " " + user.getId());

                    boolean dato = pedidodao.buscarPedido(idp);
                    if (dato == true) {
                        System.out.println("tiene pedido? " + dato);
                        ped = pedidodao.obtenerPedido(idp);
                        System.out.println("encontro el pedido con id:" + ped.getId());
                        boolean dato1 = pedidodao.buscarDetalle(ped.getId());
                        if (dato1 == true) {
                            System.out.println("contiene detalle de pedido? " + dato1);
                            listacarrito = new ArrayList();
                            listacarrito = pedidodao.obtenerDetalle(ped.getId());
                        } else if (dato1 == false) {
                            System.out.println("contiene detalle de pedido? " + dato1);
                            listacarrito = new ArrayList();
                        }
                    } else if (dato == false) {
                        System.out.println("tiene pedido? " + dato);
                        boolean dato2 = pedidodao.crearPedido(idp, estado, total);
                        System.out.println("se creo el pedido? " + dato2);
                        System.out.println("creo el pedido: " + ped);
                        listacarrito = new ArrayList();
                    }
                    List<Productos> productosDes = pdao.obtenerProductosDescuento();
                    List<Pedido> pedidosUser = pedidodao.pedidoUser(idp);
                    CategoriaDAO catdao = new CategoriaDAO();
                    List<Categoria> cat = catdao.listarT();
                    List<Pedido> pedidos = pedidodao.pedidoProsesado(idp);
                    List<Categoria> catDes = catdao.obtenerCategoriaDescuento();
                    request.setAttribute("ped", pedidos);
                    request.setAttribute("ProductosDes", productosDes);
                    request.setAttribute("catDes", catDes);
                    request.setAttribute("pedidos", pedidosUser);
                    request.setAttribute("Categorias", cat);
                    request.setAttribute("Productos", productos);
                    System.out.println("Entro A enviar los Productos");
                    request.setAttribute("contador", listacarrito.size());
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/Vistas/Inicio.jsp").forward(request, response);
                    break;
                case "AgregarCarrito":
                    System.out.println("Entró a agregar un producto al carrito");
                    int idproducto = Integer.parseInt(request.getParameter("idproducto"));
                    System.out.println("ID del producto: " + idproducto);
                    System.out.println("ID del usuario: " + idp);

                    ped = pedidodao.obtenerPedido(idp);
                    cantidad = 1;
                    int posicion = 0;
                    p = pdao.listarId(idproducto);
                    System.out.println("Producto: " + p.getNombre() + " " + p.getId());
                    Categoria catcarrito = cdao.listarT(p.getIdCategoria());
                    int descuento = 0;
                    if (catcarrito.getOfertas() > 0) {
                        descuento = catcarrito.getOfertas();
                        System.out.println("La categoría del producto tiene un descuento del: " + descuento + "%");
                    }
                    int precioConDescuento = p.getPrecio();
                    if (descuento > 0) {
                        precioConDescuento = p.getPrecio() - (p.getPrecio() * descuento / 100);
                        System.out.println("Precio con descuento aplicado: " + precioConDescuento);
                    }
                    if (listacarrito.size() > 0) {
                        System.out.println("Tiene productos en el carrito");
                        for (int i = 0; i < listacarrito.size(); i++) {
                            if (idproducto == listacarrito.get(i).getIdProducto()) {
                                posicion = i;
                            }
                        }
                        if (idproducto == listacarrito.get(posicion).getIdProducto()) {
                            cantidad = cantidad + listacarrito.get(posicion).getCantidad();
                            total = cantidad * precioConDescuento;  // Usar precio con descuento
                            listacarrito.get(posicion).setCantidad(cantidad);
                            listacarrito.get(posicion).setTotal(total);

                            idDetalle = listacarrito.get(posicion).getId();
                            System.out.println("ID del detalle pedido a actualizar");
                            System.out.println(ped.getTotal() + " " + precioConDescuento);

                            ped.setTotal(ped.getTotal() + precioConDescuento);
                            pedidodao.agregarTotal(ped.getId(), ped.getTotal());

                            boolean d2 = pedidodao.actualizarDetalle(idDetalle, cantidad, total);
                        } else {
                            System.out.println("El producto no está en el carrito");
                            detalleP = new DetallePedido();
                            detalleP.setIdProducto(p.getId());
                            detalleP.setIdPedido(ped.getId());
                            detalleP.setCantidad(cantidad);
                            detalleP.setTotal(cantidad * precioConDescuento);
                            ped.setTotal(ped.getTotal() + precioConDescuento);
                            listacarrito.add(detalleP);
                            System.out.println("Agregando total al pedido");
                            System.out.println(ped.getId() + " " + ped.getTotal());
                            pedidodao.agregarTotal(ped.getId(), ped.getTotal());

                            boolean d1 = pedidodao.crearDetalle(detalleP.getIdPedido(), detalleP.getIdProducto(), detalleP.getCantidad(), detalleP.getTotal());
                            if (d1) {
                                System.out.println("Detalle de pedido creado");
                            }
                        }
                    } else {
                        detalleP = new DetallePedido();
                        detalleP.setIdProducto(p.getId());
                        detalleP.setIdPedido(ped.getId());
                        detalleP.setCantidad(cantidad);
                        detalleP.setTotal(precioConDescuento);
                        ped.setTotal(ped.getTotal() + precioConDescuento);
                        listacarrito.add(detalleP);

                        System.out.println("Agregando total al pedido");
                        System.out.println(ped.getId() + " " + ped.getTotal());
                        pedidodao.agregarTotal(ped.getId(), ped.getTotal());

                        boolean d1 = pedidodao.crearDetalle(detalleP.getIdPedido(), detalleP.getIdProducto(), detalleP.getCantidad(), detalleP.getTotal());
                        if (d1) {
                            System.out.println("Detalle de pedido creado");
                        }
                    }
                    request.setAttribute("contador", listacarrito.size());
                    request.getRequestDispatcher("CtrProductos?accion=Inicio&id=" + idp).forward(request, response);
                    break;

                case "Carrito":
                    System.out.println("entro al carrito");
                    System.out.println("id del usuario: " + idp);
                    int idusuario = idp;
                    ped = pedidodao.obtenerPedido(idp);
                    listaProductos = detalleDAO.ListarProd(ped.getId());
                    request.setAttribute("productos", listaProductos);
                    request.setAttribute("carrito", listacarrito);
                    request.setAttribute("contador", listacarrito.size());
                    request.setAttribute("idUsuario", idusuario);
                    request.setAttribute("total", ped.getTotal());
                    request.getRequestDispatcher("/Vistas/Carrito.jsp").forward(request, response);
                    break;
                case "ActualizarCantidad":
                    System.out.println("ingreso a cambiar la cantidad del producto");
                    idDetalle = Integer.parseInt(request.getParameter("idp"));
                    DetallePedido det = pedidodao.obtenerDetalles(idDetalle);
                    precio = Integer.parseInt(request.getParameter("precio"));
                    cantidad = Integer.parseInt(request.getParameter("Cantidad"));
                    System.out.println("datos: id: " + idDetalle + " cantidad: " + cantidad);
                    total = cantidad * precio;
                    dato = pedidodao.actualizarCantidad(idDetalle, cantidad);
                    if (dato == true) {
                        System.out.println("se actulizo la cantidad");
                    } else {
                        System.out.println("error al actulizar la cantidad");
                    }
                    pro = pdao.listarId(det.getIdProducto());
                    if (cantidad > det.getCantidad()) {
                        System.out.println("la cantidad en mayor");
                        System.out.println(cantidad + "   " + det.getCantidad());
                        System.out.println("entro a agregar el total");
                        System.out.println(ped.getTotal() + "  " + pro.getPrecio());
                        int totalFinal = 0;
                        ped.setTotal(totalFinal + total);
                        pedidodao.agregarTotal(ped.getId(), ped.getTotal());
                    } else if (cantidad < det.getCantidad()) {
                        System.out.println("la cantidad en menor");
                        System.out.println(cantidad + "   " + det.getCantidad());
                        System.out.println("entro a agregar el total");
                        ped.setTotal(ped.getTotal() - pro.getPrecio());
                        pedidodao.agregarTotal(ped.getId(), ped.getTotal());
                    }
                    listacarrito = pedidodao.obtenerDetalle(ped.getId());
                    listaProductos = detalleDAO.ListarProd(ped.getId());
                    request.setAttribute("productos", listaProductos);
                    request.setAttribute("carrito", listacarrito);
                    request.setAttribute("total", ped.getTotal());
                    response.sendRedirect(request.getContextPath() + "/Vistas/Carrito.jsp");
                    break;
                case "EliminarDeCarrito":
                    System.out.println("eliminar producto del carrito");
                    idDetalle = Integer.parseInt(request.getParameter("idp"));
                    det = pedidodao.obtenerDetalles(idDetalle);
                    System.out.println("entro a agregar el total");
                    ped.setTotal(ped.getTotal() - det.getTotal());
                    System.out.println(ped.getId() + "    " + ped.getTotal());
                    pedidodao.agregarTotal(ped.getId(), ped.getTotal());
                    dato = pedidodao.eliminarDetalle(idDetalle);
                    if (dato == true) {
                        System.out.println("se elimino el producto del carrito");
                    } else {
                        System.out.println("error al eliminar el producto del carrito");
                    }
                    break;
                case "EditarProducto":
                    System.out.println("entro a editar");
                    idp = Integer.parseInt(request.getParameter("idp"));
                    System.out.println("id" + idp);
                    pro = pdao.listarT(idp);

                    System.out.println("octuvo categoria: " + pro);
                    request.setAttribute("productoE", pro);
                    request.setAttribute("editarPro", true);
                    productos = pdao.listarT();
                    request.setAttribute("productos", productos);
                    categoria = cdao.listar();
                    request.setAttribute("Categorias", categoria);
                    proveedor = prdao.obtenerproveedor();
                    request.setAttribute("Proveedor", proveedor);
                    request.getRequestDispatcher("/Vistas/Productos.jsp").forward(request, response);
                    break;

                case "actualizarProducto":
                    System.out.println("Entro a editar Producto");
                    int idpp = Integer.parseInt(request.getParameter("txtid"));
                    System.out.println("idpp:" + idpp);
                    nomp = request.getParameter("txtnombre");
                    descp = request.getParameter("txtdescripcion");
                    prep = Integer.parseInt(request.getParameter("txtprecio"));
                    fotop = request.getParameter("foto2");
                    catp = Integer.parseInt(request.getParameter("categorias"));
                    stocp = Integer.parseInt(request.getParameter("txtstock"));
                    prove = Integer.parseInt(request.getParameter("proveedores"));
                    fvEdit = request.getParameter("fechaVencimiento");

                    Part filePart = request.getPart("foto");
                    if (filePart != null && filePart.getSize() > 0) {
                        // Nueva imagen proporcionada
                        String fileName = getFileName(filePart);
                        String uploadPath = getServletContext().getRealPath("/imagenes");
                        System.out.println("Ruta de subida: " + uploadPath);

                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) {
                            System.out.println("Directorio no existe, creando carpeta 'imagenes'");
                            uploadDir.mkdir();
                        }

                        File file = new File(uploadDir, fileName);
                        filePart.write(file.getAbsolutePath());
                        fotop = "imagenes/" + fileName; // Actualizar la ruta de la imagen
                    }

                    System.out.println("almaceno los datos");
                    System.out.println(idp + nomp + descp + prep + " " + fotop + catp + " " + stocp + prove);
                    SimpleDateFormat formatoDate = new SimpleDateFormat("yyyy-MM-dd");
                    Date fechaVencimiento = null;
                    java.sql.Date fechaVencimientoSql = null;
                    try {
                        fechaVencimiento = formatoDate.parse(fvEdit);
                        fechaVencimientoSql = new java.sql.Date(fechaVencimiento.getTime());
                    } catch (Exception e) {
                        System.out.println("Error al convertir los Datos de String a DATE");
                    }
                    pro.setId(idpp);
                    pro.setNombre(nomp);
                    pro.setDescripcion(descp);
                    pro.setPrecio(prep);
                    pro.setFoto(fotop);
                    pro.setIdCategoria(catp);
                    pro.setStock(stocp);
                    pro.setProveedor(prove);
                    pro.setFechaVencimiento(fechaVencimientoSql);
                    pdao.editar(pro);
                    request.getRequestDispatcher("CtrProductos?accion=listar").forward(request, response);
                    break;
                case "listarInventario":
                    id = Integer.parseInt(request.getParameter("id"));
                    user = usudao.listarT(id);
                    cantidadUsuarios = usudao.contarUsuarios();
                    cantidadProductos = pdao.contarProductos();
                    cantidadPedidos = pedidodao.contarPedidos();
                    listaSolicitado = pedidodao.pedidosSolicitados();
                    List<Usuario> usuarios = new ArrayList<>();
                    List<Usuario> usuarios1 = new ArrayList<>();
                    for (Pedido ped : listaSolicitado) {
                        Usuario usuario = pedidodao.obtenerUsuarioPorId(ped.getIdUsuario());
                        System.out.println(usuario.getNombre());
                        usuarios.add(usuario);
                    }
                    listapEspera = pedidodao.pedidosEspera();
                    for (Pedido ped : listapEspera) {
                        Usuario usuario = pedidodao.obtenerUsuarioPorId(ped.getIdUsuario());
                        System.out.println(usuario.getNombre());
                        usuarios1.add(usuario);
                    }

                    request.setAttribute("cantidadU", cantidadUsuarios);
                    request.setAttribute("cantidadPro", cantidadProductos);
                    request.setAttribute("cantidadPe", cantidadPedidos);
                    request.setAttribute("pedidos", listaSolicitado);
                    request.setAttribute("usuarios", usuarios);
                    request.setAttribute("espera", listapEspera);
                    request.setAttribute("usuarios1", usuarios1);
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/Vistas/Inventario.jsp").forward(request, response);
                    break;
                case "buscarpr":
                    nombre = request.getParameter("txtbuscar");
                    System.out.println("nombre: " + nombre);
                    productos = pdao.buscarP(nombre);
                    request.setAttribute("listar", productos);
                    request.getRequestDispatcher("/Vistas/Productos.jsp").forward(request, response);
                    break;
                case "buscarporfecha":
                    String fechaincio = request.getParameter("fechavencimiento");
                    String fechafin = request.getParameter("fechavencimientoFin");

                    // Obtener los productos filtrados por fecha
                    List<Productos> productosPorFecha = pdao.listardate(fechaincio, fechafin);
                    request.setAttribute("listar", productosPorFecha);
                    request.getRequestDispatcher("/Vistas/Productos.jsp").forward(request, response);
                    break;
                case "buscarcat":
                    int idcat = Integer.parseInt(request.getParameter("catid"));
                    productos = pdao.buscarcat(idcat);
                    request.setAttribute("Categorias", categoria);
                    request.setAttribute("listar", productos);
                    request.getRequestDispatcher("Vistas/Productos.jsp").forward(request, response);
                    break;
                case "eliminar":
                    String ide = request.getParameter("ide");
                    System.out.println("Entró a eliminar el producto con el ID: " + ide);
                    try {
                        pdao.eliminar(ide);
                        productos = pdao.listarT();
                        request.setAttribute("productos", productos);
                        System.out.println("Enviando la lista actualizada de productos: " + productos);
                        response.sendRedirect("/FamiSaludLa91/CtrProductos?accion=listar&mensaje=Producto%20eliminado%20exitosamente");
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.sendRedirect("/FamiSaludLa91/CtrProductos?accion=listar&mensaje=Error%20al%20eliminar%20el%20producto");
                    }
                    break;
                case "ActualizarUser":
                    String apellido,
                     correo,
                     telefono,
                    // contrasena,
                     direccion,
                     rol;

                    id = Integer.parseInt(request.getParameter("id"));
                    nombre = request.getParameter("name");
                    apellido = request.getParameter("apellidos");
                    correo = request.getParameter("email");
                    telefono = request.getParameter("phone");
                    direccion = request.getParameter("direccion");
                    //contrasena = request.getParameter("password");

                    //if (contrasena != null && !contrasena.trim().isEmpty()) {
                    //    contrasena = encriptarcontrasena(contrasena);
                    //} else {
                    //}
                    System.out.println("ID: " + id);
                    System.out.println("Nombre: " + nombre);
                    System.out.println("Apellido: " + apellido);
                    System.out.println("Correo: " + correo);
                    System.out.println("Teléfono: " + telefono);
                    System.out.println("Dirección: " + direccion);

                    usudao.editarUser(id, nombre, apellido, correo, telefono, direccion);

                    user = usudao.listarT(id);
                    request.setAttribute("user", user);
                    request.setAttribute("contador", listacarrito.size());
                    response.sendRedirect(request.getContextPath() + "/CtrProductos?accion=Inicio&id=" + id);
                    break;
                case "ActualizarUserInventario":
                    id = Integer.parseInt(request.getParameter("id"));
                    nombre = request.getParameter("name");
                    apellido = request.getParameter("apellidos");
                    correo = request.getParameter("email");
                    telefono = request.getParameter("phone");
                    direccion = request.getParameter("direccion");
                    //contrasena = request.getParameter("password");

                    System.out.println("ID: " + id);
                    System.out.println("Nombre: " + nombre);
                    System.out.println("Apellido: " + apellido);
                    System.out.println("Correo: " + correo);
                    System.out.println("Teléfono: " + telefono);
                    System.out.println("Dirección: " + direccion);
                    usudao.editarUser(id, nombre, apellido, correo, telefono, direccion);
                    user = usudao.listarT(id);
                    request.setAttribute("user", user);
                    response.sendRedirect(request.getContextPath() + "/CtrProductos?accion=listarInventario&id=" + id);
                    break;
                case "ActualizarUserPago":
                    id = Integer.parseInt(request.getParameter("id"));
                    user = usudao.listarT(id);
                    nombre = request.getParameter("name");
                    apellido = request.getParameter("apellidos");
                    correo = request.getParameter("email");
                    telefono = request.getParameter("phone");
                    direccion = request.getParameter("direccion");

                    System.out.println("ID: " + id);
                    System.out.println("Nombre: " + nombre);
                    System.out.println("Apellido: " + apellido);
                    System.out.println("Correo: " + correo);
                    System.out.println("Teléfono: " + telefono);
                    System.out.println("Dirección: " + direccion);
                    usudao.editarUserpago(id, nombre, apellido, correo, telefono, direccion);
                    System.out.println("termino de actualizar");
                    response.sendRedirect(request.getContextPath() + "/CtrProductos?accion=listaPago&id=" + id);
                    break;

                case "listaPago":
                    int userId = Integer.parseInt(request.getParameter("id"));
                    user = usudao.listarT(userId);
                    ped = pedidodao.obtenerPedido(userId);
                    DetallePedidoDAO dtdao = new DetallePedidoDAO();
                    
                    int tol = dtdao.cantidadTol(ped.getId());
                    System.out.println(ped.getTotal());
                    request.setAttribute("user", user);
                    request.setAttribute("ped", ped);
                    request.setAttribute("tolProd", tol);
                    request.getRequestDispatcher("/Vistas/medioPagos.jsp").forward(request, response);
                    break;
                case "solicitarPedido":
                    int idPedido = Integer.parseInt(request.getParameter("id"));
                    id = Integer.parseInt(request.getParameter("idUser"));
                    System.out.println("id:" + id);
                    System.out.println("id del pedido: " + idPedido);
                    pedidodao.cambiarEstadoSolicitado(idPedido);
                    response.sendRedirect(request.getContextPath() + "/CtrProductos?accion=Inicio&id=" + id);
                    break;

                case "buscarprod":
                    nombre = request.getParameter("txtbuscar");
                    System.out.println("nombre: " + nombre);
                    CategoriaDAO categodao = new CategoriaDAO();//categoria
                    List<Categoria> catego = categodao.listarT();//categoria
                    List<Productos> produc = pdao.buscarP(nombre);

                    request.setAttribute("contador", listacarrito.size());

                    request.setAttribute("Productos", produc);
                    request.setAttribute("user", user);//usuario
                    request.setAttribute("Categorias", catego);//categoria
                    request.getRequestDispatcher("/Vistas/Inicio.jsp").forward(request, response);
                    break;

                case "buscarcateg":
                    int idcate = Integer.parseInt(request.getParameter("catid"));
                    productos = pdao.buscarcat(idcate);
                    List<Pedido> pedidosUsers = pedidodao.pedidoUser(idp);//pedidos
                    List<Pedido> pedidosp = pedidodao.pedidoProsesado(idp);
                    CategoriaDAO catedao = new CategoriaDAO();//categoria
                    List<Categoria> cate = catedao.listarT();//categoria

                    request.setAttribute("pedidos", pedidosUsers);//pedidos
                    request.setAttribute("user", user);//usuario
                    request.setAttribute("ped", pedidosp);
                    request.setAttribute("Categorias", cate);//categoria
                    request.setAttribute("contador", listacarrito.size());
                    request.setAttribute("Productos", productos);
                    request.getRequestDispatcher("Vistas/Inicio.jsp").forward(request, response);
                    break;
                case "buscarPedido":
                    String d = request.getParameter("datoPedido");
                    System.out.println("entro a buscar pedidos.");
                    List<Pedido> pedi = pedidodao.buscarPedidos(d);
                    usuarios = new ArrayList<>();
                    for (Pedido ped : pedi) {
                        Usuario usuario = pedidodao.obtenerUsuarioPorId(ped.getIdUsuario());
                        usuarios.add(usuario);
                        System.out.println("Entro a buscar Usuarios");
                    }
                    request.setAttribute("usuarios", usuarios);
                    request.setAttribute("listarped", pedi);
                    request.getRequestDispatcher("/Vistas/pedidos.jsp").forward(request, response);
                    break;
                case "VaciarCarrito":
                     int idUsuario = Integer.parseInt(request.getParameter("id"));
                     Pedido pedid = pedidodao.obtenerPedido(idUsuario);
                     pedidodao.eliminarDetalles(pedid.getId());
                     listacarrito = pedidodao.obtenerDetalle(pedid.getId());
                     request.setAttribute("contador", listacarrito.size());
                      request.getRequestDispatcher("CtrProductos?accion=Carrito").forward(request, response);
                      
                    break;
                
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Accion no reconocida");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error en el procesamiento de la solicitud");
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String token : contentDisposition.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1).replace("\"", "");
            }
        }
        return null;
    }

}
