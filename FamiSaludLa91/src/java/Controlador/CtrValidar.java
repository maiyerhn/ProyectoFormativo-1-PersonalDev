/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SENA
 */
@WebServlet(name = "CtrValidar", urlPatterns = {"/CtrValidar"})
public class CtrValidar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        UsuarioDAO usudao = new UsuarioDAO();
        Usuario user = new Usuario();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrValidar</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrValidar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("ingresar")) {
            System.out.println("2");
            HttpSession sesion = request.getSession();
            String usu = request.getParameter("email");
            String pass = request.getParameter("password");
            user = usudao.Validar(usu, pass);
            if (user.getCorreo() != null) {
                System.out.println("3");
                sesion.setAttribute("log", '1');
                sesion.setAttribute("correo", user.getCorreo());
                sesion.setAttribute("nombre", user.getNombre());
                sesion.setAttribute("contrasena", user.getContrasena());
                sesion.setAttribute("id", user.getId());
                sesion.setAttribute("direccion", user.getDireccion());
                sesion.setAttribute("telefono", user.getTelefono());
                sesion.setAttribute("rol", user.getRol());
                sesion.setAttribute("apellido", user.getApellido());
                if (user.getRol().equals("ADMINISTRADOR")) {
                    System.out.println("redirect");
                    response.sendRedirect("/FamiSaludLa91/CtrProductos?accion=home");
                }else{
                    response.sendRedirect("/FamiSaludLa91/Vistas/registrarse.jsp");
                }
            }
        }
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
