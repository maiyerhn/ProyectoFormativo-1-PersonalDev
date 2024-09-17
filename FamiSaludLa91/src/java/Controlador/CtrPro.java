/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Proveedor;
import Modelo.ProveedorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SENA
 */
@WebServlet(name = "CtrPro", urlPatterns = {"/CtrPro"})
public class CtrPro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ProveedorDAO prdao = new ProveedorDAO();
    Proveedor prov = new Proveedor();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        System.out.println("accion= " + accion);
        int id;
        int idpr, idp;
        String nomp, corp, telp, dirp, nomemp;
        String nombre, correo, telefono, direccion, nombreem;

        try {
            List<Proveedor> proveedor = prdao.obtenerproveedor();

            System.out.println("proveedor " + proveedor.size());

            switch (accion) {
                case "listarp":
                    request.setAttribute("proveedor", proveedor);
                    request.getRequestDispatcher("/Vistas/Proveedores.jsp").forward(request, response);
                    break;
                case "Agregar":
                    id = Integer.parseInt(request.getParameter("txtid"));
                    nombre = request.getParameter("txtnombre");
                    correo = request.getParameter("txtcorreo");
                    telefono = request.getParameter("txttelefono");
                    direccion = request.getParameter("txtdireccion");
                    nombreem = request.getParameter("txtnombreem");

                    System.out.println("id: " + id);
                    System.out.println("nombre: " + nombre);
                    System.out.println("correo: " + correo);
                    System.out.println("telefono: " + telefono);
                    System.out.println("direccion: " + direccion);
                    System.out.println("nombreem: " + nombreem);

                    prov.setId(id);
                    prov.setNombre(nombre);
                    prov.setCorreo(correo);
                    prov.setTelefono(telefono);
                    prov.setDireccion(direccion);
                    prov.setNombreem(nombreem);
                    if (prdao.crear(prov) == true) {
                        System.out.println("Se creo el proveedor");
                        request.getRequestDispatcher("CtrPro?accion=listarp").forward(request, response);
                    }
                    break;
                    
                    case "EditarProveedor":
                    System.out.println("entro a editar");
                    idpr = Integer.parseInt(request.getParameter("idpr"));
                    System.out.println("id" + idpr);
                    prov = prdao.listarT(idpr);
                    
                    request.setAttribute("proveedorE", prov);
                    request.setAttribute("editarPro", true);
                    proveedor = prdao.obtenerproveedor();
                    request.setAttribute("proveedor", proveedor);
                    request.getRequestDispatcher("/Vistas/Proveedores.jsp").forward(request, response);
                    break;
                    
                    case "actualizarProveedor":
                    System.out.println("Entro a editar Producto");
                    idp = Integer.parseInt(request.getParameter("txtid"));
                    nomp = request.getParameter("txtnombre");
                    corp = request.getParameter("txtcorreo");
                    telp = request.getParameter("txttelefono");
                    dirp = request.getParameter("txtdireccion");
                    nomemp = request.getParameter("txtnombreem");
                    
                    System.out.println("almaceno los datos");
                    System.out.println(idp + nomp + corp + telp + dirp + nomemp);

                    prov.setId(idp);
                    prov.setNombre(nomp);
                    prov.setCorreo(corp);
                    prov.setTelefono(telp);
                    prov.setDireccion(dirp);
                    prov.setNombreem(nomemp);
                    prdao.editar(prov);
                     request.getRequestDispatcher("CtrPro?accion=listarp").forward(request, response);
                    break;
                    
                    case "buscarp":
                        nombre = request.getParameter("txtbuscar");
                        System.out.println("nombre: "+nombre);
                        proveedor = prdao.listarT(nombre);
                        //proveedor = prdao.obtenerproveedor();
                        request.setAttribute("proveedor", proveedor);
                        request.getRequestDispatcher("/Vistas/Proveedores.jsp").forward(request, response);
                        break;
                        
                    case "eliminar":
                    String idpre = request.getParameter("idpre");
                    System.out.println("Entró a eliminar el Proveedor con el ID: " + idpre);
                    try {
                        prdao.eliminar(idpre);
                        proveedor = prdao.obtenerproveedor();
                        request.setAttribute("proveedor", proveedor);
                        System.out.println("Enviando la lista actualizada de Proveedores: " + proveedor);
                        response.sendRedirect("/FamiSaludLa91/CtrPro?accion=listarp&mensaje=Proveedor%20eliminado%20exitosamente");
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.sendRedirect("/FamiSaludLa91/CtrPro?accion=listarp&mensaje=Error%20al%20eliminar%20el%20Proveedor");
                    }
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error en el procesamiento de la solicitud");
        }

    }

    /**
     * response.setContentType("text/html;charset=UTF-8"); try (PrintWriter out
     * = response.getWriter()) { /* TODO output your page here. You may use
     * following sample code. out.println("<!DOCTYPE html>");
     * out.println("<html>"); out.println("<head>"); out.println("<title>Servlet
     * CtrPro</title>"); out.println("</head>"); out.println("<body>");
     * out.println("<h1>Servlet CtrPro at " + request.getContextPath() +
     * "</h1>"); out.println("</body>"); out.println("</html>"); }
     */
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
