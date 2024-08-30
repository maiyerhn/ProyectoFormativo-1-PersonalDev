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
@WebServlet(name = "CtrUsuario", urlPatterns = {"/CtrUsuario"})
public class CtrUsuario extends HttpServlet {
        
    UsuarioDAO dao = new UsuarioDAO();
    Usuario us = new Usuario();
    String role;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrUsuario at " + request.getContextPath() + "</h1>");
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
        List<Usuario> user = dao.obtenerUsuarios();
        String id, nombre, apellido, correo, telefono, contrasena, direccion, rol;
        int idu;
        String accion = request.getParameter("accion");
        switch (accion) {
            case "registrarse":
                nombre = request.getParameter("nombre");
                apellido = request.getParameter("apellido");
                correo = request.getParameter("user");
                telefono = request.getParameter("telefono");
                contrasena = request.getParameter("password");
                direccion = request.getParameter("direccion");
                us.setNombre(nombre);
                us.setApellido(apellido);
                us.setCorreo(correo);
                us.setTelefono(telefono);
                us.setRol("CLIENTE");
                us.setDireccion(direccion); 
                us.setContrasena(contrasena);
                if (dao.crear(us) == true) {
                    request.getRequestDispatcher("/Vistas/Login.jsp").forward(request, response);

                } else {
                    System.out.println("Error al insertar el usuarios");

                }

                break;
            case "listarU":
                request.setAttribute("listarUs", user);
                System.out.println("Entro A Listar los Productos");
                request.getRequestDispatcher("/Vistas/Usuarios.jsp").forward(request, response);
                break;
            case "buscarus":
                nombre = request.getParameter("txtbuscar");
                System.out.println("nombre: " + nombre);
                user = dao.listarT(nombre); 
                request.setAttribute("listarUs",user);
                request.getRequestDispatcher("/Vistas/Usuarios.jsp").forward(request, response);
                break;
            case "Agregar":
                nombre = request.getParameter("nombre");
                apellido = request.getParameter("apellido");
                correo = request.getParameter("user");
                telefono = request.getParameter("telefono");
                contrasena = request.getParameter("password");
                direccion = request.getParameter("direccion");
                rol = request.getParameter("rol");
                us.setNombre(nombre);
                us.setApellido(apellido);
                us.setCorreo(correo);
                us.setTelefono(telefono);
                us.setRol(rol);
                us.setDireccion(direccion); 
                us.setContrasena(contrasena);
                if (dao.crear(us) == true) {
                    request.getRequestDispatcher("CtrUsuario?accion=listarU").forward(request, response);

                } else {
                    System.out.println("Error al insertar el usuarios");

                }
                break;
            case "EditarUsuario":
                System.out.println("Entro a editar Usuario");
                System.out.println("entro a editar");
                idu = Integer.parseInt(request.getParameter("idu"));
                System.out.println("id " + idu);
                us = dao.listarT(idu);    
                
                request.setAttribute("usuarioE", us);
                request.setAttribute("editarus", true);
                user = dao.obtenerUsuarios(); 
                request.setAttribute("listarUs", user);
                request.getRequestDispatcher("/Vistas/Usuarios.jsp").forward(request, response);
                break;
                
            case "actualizarUsuario":
                System.out.println("entro a actualizar");
                role = request.getParameter("rol");
                us.setRol(role);
                dao.editar(us);
                request.setAttribute("usuarioE", us);
                user = dao.obtenerUsuarios(); 
                request.setAttribute("listarUs", user);
                request.getRequestDispatcher("CtrUsuario?accion=listarU").forward(request, response);
                break;
           }
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