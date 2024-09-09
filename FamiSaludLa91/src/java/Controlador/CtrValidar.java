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
        try {
            String accion = request.getParameter("accion");
            if ("exit".equalsIgnoreCase(accion)) {
                HttpSession sesion = request.getSession(false);
                if (sesion != null) {
                    sesion.invalidate();
                    System.out.println("Sesión invalidada correctamente.");
                }
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
                response.sendRedirect(request.getContextPath() + "/Vistas/Login.jsp");
                return;
            }

            if ("ingresar".equalsIgnoreCase(accion)) {
                HttpSession sesion = request.getSession(false);
                if (sesion != null) {
                    sesion.invalidate();
                    System.out.println("Sesión previa invalidada.");
                }
                sesion = request.getSession(true);
                String usu = request.getParameter("email");
                String pass = request.getParameter("password");
                Usuario user = usudao.Validar(usu, pass);
                if (user != null && user.getCorreo() != null) {
                    sesion.setAttribute("log", '1');
                    sesion.setAttribute("correo", user.getCorreo());
                    sesion.setAttribute("nombre", user.getNombre());
                    sesion.setAttribute("contrasena", user.getContrasena());
                    sesion.setAttribute("id", user.getId());
                    sesion.setAttribute("direccion", user.getDireccion());
                    sesion.setAttribute("telefono", user.getTelefono());
                    sesion.setAttribute("rol", user.getRol());
                    sesion.setAttribute("apellido", user.getApellido());
                    sesion.setAttribute("usuario", user);
                    if ("ADMINISTRADOR".equalsIgnoreCase(user.getRol())) {
                        response.sendRedirect(request.getContextPath() + "/CtrProductos?accion=listarInventario&id=" + user.getId());
                    } else {
                        response.sendRedirect(request.getContextPath() + "/CtrProductos?accion=Inicio&id=" + user.getId());
                    }
                } else {
                    request.setAttribute("error", "Usuario o Contraseña Incorrectos");
                    request.getRequestDispatcher("/Vistas/Login.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            request.setAttribute("error", "Ocurrió un error durante el proceso.");
            request.getRequestDispatcher("/Vistas/Login.jsp").forward(request, response);
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
