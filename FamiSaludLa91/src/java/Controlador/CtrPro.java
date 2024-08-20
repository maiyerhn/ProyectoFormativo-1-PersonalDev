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
        int id,idprod;
        String nombre,correo,telefono,direccion;

        try {
            List<Proveedor> proveedor = prdao.obtenerproveedor();

            System.out.println("proveedor " + proveedor.size());

            switch (accion) {
                case "listarp":
                    request.setAttribute("proveedor", proveedor);
                    request.getRequestDispatcher("/Vistas/Proveedores.jsp").forward(request, response);
                    break;

                case "Agregar":
                    System.out.println("id: " + request.getParameter("txtid"));
                    id = Integer.parseInt(request.getParameter("txtid"));
                    nombre = request.getParameter("txtnombre");
                    correo = request.getParameter("txtcorreo");
                    telefono = request.getParameter("txttelefono");
                    direccion = request.getParameter("txtdireccion");
                    idprod = Integer.parseInt(request.getParameter("txtidprod"));
                    
                    System.out.println("id: " + id);
                    System.out.println("nombre: " + nombre);
                    System.out.println("correo: " + correo);
                    System.out.println("telefono: " + telefono);
                    System.out.println("direccion: " + direccion);
                    System.out.println("idprod: " + idprod);

                    prov.setId(id);
                    prov.setNombre(nombre);
                    prov.setCorreo(correo);
                    prov.setTelefono(telefono);
                    prov.setDireccion(direccion);
                    prov.setIdprod(idprod);
                    if (prdao.crear(prov) == true) {
                        System.out.println("Se creo el proveedor");
                        request.getRequestDispatcher("CtrPro?accion=listarp").forward(request, response);
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
