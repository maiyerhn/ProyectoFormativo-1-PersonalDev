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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Maiyer
 */
@WebServlet(name = "CtrProductos", urlPatterns = {"/CtrProductos"})
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
    UsuarioDAO usudao = new UsuarioDAO();
    PedidoDAO pedidodao = new PedidoDAO();
    ProductosDAO pdao = new ProductosDAO();
    CategoriaDAO cdao = new CategoriaDAO();
    ProveedorDAO prdao = new ProveedorDAO();
    DetallePedidoDAO detalleDAO = new DetallePedidoDAO();
    Pedido ped = new Pedido();
    Productos pro = new Productos();
    DetallePedido detalleP;
    int subtotal;
    int cantidad, idp, prep, catp, stocp, prove;
    int cantidadUsuarios, cantidadPedidos, cantidadProductos;
    int totalpagar;
    String ultimoP, nomp, descp, fotop;

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
                    System.out.println("id: " + request.getParameter("txtid"));
                    id = Integer.parseInt(request.getParameter("txtid"));
                    System.out.println("id: " + id);
                    nombre = request.getParameter("txtnombre");
                    System.out.println("nombre: " + nombre);
                    descripcion = request.getParameter("txtdescripcion");
                    System.out.println("descripcion: " + descripcion);
                    precio = Integer.parseInt(request.getParameter("txtprecio"));
                    System.out.println("precio: " + precio);
                    fotos = request.getParameter("foto");
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

                    pro.setId(id);
                    pro.setNombre(nombre);
                    pro.setDescripcion(descripcion);
                    pro.setPrecio(precio);
                    pro.setFoto(fotos);
                    pro.setIdCategoria(categ);
                    pro.setStock(stock);
                    pro.setProveedor(prove);
                    if (pdao.crear(pro) == true) {
                        System.out.println("Se creo El producto");
                        request.getRequestDispatcher("CtrProductos?accion=listar").forward(request, response);
                    }
                    break;
                case "Inicio":
                    idp = Integer.parseInt(request.getParameter("id"));
                    System.out.println("ingreso el usuario con id: " + idp);
                    String estado = "CARRITO";
                    int total = 0;
                    
                    boolean dato = pedidodao.buscarPedido(idp);
                    if(dato == true){
                        System.out.println("tiene pedido? " + dato);
                        ped = pedidodao.obtenerPedido(idp);
                        System.out.println("encontro el pedido con id:" + ped.getId());
                        boolean dato1 = pedidodao.buscarDetalle(ped.getId());
                        if(dato1 == true){
                            System.out.println("contiene detalle de pedido? " + dato1);
                            listacarrito = new ArrayList();
                            listacarrito = pedidodao.obtenerDetalle(ped.getId());
                        }else if(dato1 == false){
                            System.out.println("contiene detalle de pedido? " + dato1);
                            listacarrito = new ArrayList();
                        }
                    }else if(dato == false){
                        System.out.println("tiene pedido? " + dato);
                        boolean dato2 = pedidodao.crearPedido(idp, estado, total);
                        System.out.println("se creo el pedido? " + dato2);
                        System.out.println("creo el pedido: " + ped);
                        listacarrito = new ArrayList();
                    } 
                    request.setAttribute("Productos", productos);
                    System.out.println("Entro A enviar los Productos");
                    request.setAttribute("contador", listacarrito.size());
                    request.setAttribute("idUsuario", idp);
                    request.getRequestDispatcher("/Vistas/Inicio.jsp").forward(request, response);
                    break;
                case "AgregarCarrito":
                    System.out.println("entro a agregar un producto al carrito");
                    int idproducto = Integer.parseInt(request.getParameter("idproducto"));
                    System.out.println("id del producto: " + idproducto);
                    System.out.println("id del usuario: " + idp);

                    cantidad = 1;
                    int posicion = 0;
                    p = pdao.listarId(idproducto);
                    System.out.println("producto: " + p.getNombre() + " " + p.getId());

                    if (listacarrito.size() > 0) {
                        for (int i = 0; i < listacarrito.size(); i++) {
                            if (idproducto == listacarrito.get(i).getIdProducto()) {
                                posicion = i;
                            }
                        }
                        if (idproducto == listacarrito.get(posicion).getIdProducto()) {
                            cantidad = cantidad + listacarrito.get(posicion).getCantidad();
                            total = cantidad * p.getPrecio();
                            listacarrito.get(posicion).setCantidad(cantidad);
                            listacarrito.get(posicion).setTotal(total);
                            int idDetalle = listacarrito.get(posicion).getId();
                            System.out.println("id del detalle pedido a actulizar");
                            boolean d2 = pedidodao.actualizarDetalle(idDetalle, cantidad, total);
                        } else {
                            detalleP = new DetallePedido();
                            detalleP.setIdProducto(p.getId());
                            detalleP.setIdPedido(ped.getId());
                            detalleP.setCantidad(cantidad);
                            detalleP.setTotal(cantidad * p.getPrecio());
                            listacarrito.add(detalleP);
                            boolean d1 = pedidodao.crearDetalle(detalleP.getIdPedido(), detalleP.getIdProducto(), detalleP.getCantidad(), detalleP.getTotal());
                            if (d1 == true) {
                                System.out.println("creo detalle de pedido");
                            }
                        }
                    } else {
                        detalleP = new DetallePedido();
                        detalleP.setIdProducto(p.getId());
                        detalleP.setIdPedido(ped.getId());
                        detalleP.setCantidad(cantidad);
                        detalleP.setTotal(cantidad * p.getPrecio());
                        listacarrito.add(detalleP);
                        boolean d1 = pedidodao.crearDetalle(detalleP.getIdPedido(), detalleP.getIdProducto(), detalleP.getCantidad(), detalleP.getTotal());
                        if (d1 == true) {
                            System.out.println("creo detalle de pedido");
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
                    request.getRequestDispatcher("Vistas/Carrito.jsp").forward(request, response);

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
                    idp = Integer.parseInt(request.getParameter("txtid"));
                    nomp = request.getParameter("txtnombre");
                    descp = request.getParameter("txtdescripcion");
                    prep = Integer.parseInt(request.getParameter("txtprecio"));
                    fotop = request.getParameter("foto");
                    catp = Integer.parseInt(request.getParameter("categorias"));
                    stocp = Integer.parseInt(request.getParameter("txtstock"));
                    prove = Integer.parseInt(request.getParameter("proveedores"));
                    System.out.println("almaceno los datos");
                    System.out.println(idp + nomp + descp + prep+" " + fotop + catp +" "+ stocp + prove);

                    pro.setId(idp);
                    pro.setNombre(nomp);
                    pro.setDescripcion(descp);
                    pro.setPrecio(prep);
                    pro.setFoto(fotop);
                    pro.setIdCategoria(catp);
                    pro.setStock(stocp);
                    pro.setProveedor(prove);
                    pdao.editar(pro);
                     request.getRequestDispatcher("CtrProductos?accion=listar").forward(request, response);
                    break;
                case "listarInventario":
                    cantidadUsuarios = usudao.contarUsuarios();
                    cantidadProductos = pdao.contarProductos();
                    cantidadPedidos = pedidodao.contarPedidos();
                    listapEspera = pedidodao.pedidosEnEpera();
                    List<Usuario> usuarios = new ArrayList<>();
                    for (Pedido ped : listapEspera) {
                        Usuario usuario = pedidodao.obtenerUsuarioPorId(ped.getIdUsuario());
                        System.out.println(usuario.getNombre());
                        usuarios.add(usuario);
                    }
                    request.setAttribute("cantidadU", cantidadUsuarios);
                    request.setAttribute("cantidadPro", cantidadProductos);
                    request.setAttribute("cantidadPe", cantidadPedidos);
                    request.setAttribute("pedidos", listapEspera);
                    request.setAttribute("usuarios", usuarios);
                    
                    request.getRequestDispatcher("/Vistas/Inventario.jsp").forward(request, response);
                    break;
                case "buscarpr":
                    nombre = request.getParameter("txtbuscar");
                    System.out.println("nombre: " + nombre);
                    productos = pdao.listarT(nombre); 
                    request.setAttribute("listar", productos);
                    request.getRequestDispatcher("/Vistas/Productos.jsp").forward(request, response);
                    break;
                case "buscarcat":
                int idcat =Integer.parseInt(request.getParameter("catid"));
                productos = pdao.buscarcat(idcat);
                request.setAttribute("Categorias", categoria);
                request.setAttribute("listar", productos);
                request.getRequestDispatcher("Vistas/Productos.jsp").forward(request, response);
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

}
