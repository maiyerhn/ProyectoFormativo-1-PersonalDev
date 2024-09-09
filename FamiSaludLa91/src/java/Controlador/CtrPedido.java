/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Pedido;
import Modelo.PedidoDAO;
import Modelo.Productos;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Maiyer
 */
@WebServlet(name = "CtrPedido", urlPatterns = {"/CtrPedido"})
public class CtrPedido extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Pedido pedido = new Pedido();
    PedidoDAO pedidodao = new PedidoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        System.out.println("accion= " + accion);
        try {
            List<Pedido> lped = pedidodao.obtenerPedidos();
            switch (accion) {
                case "listarped":
                    List<Pedido> lpe2 = pedidodao.obtenerPedidosC();
                    List<Usuario> usuarios = new ArrayList<>();
                    for (Pedido ped : lpe2) {
                        Usuario usuario = pedidodao.obtenerUsuarioPorId(ped.getIdUsuario());
                        usuarios.add(usuario);
                        System.out.println("Entro a buscar Usuarios");
                    }
                    request.setAttribute("listarped", lpe2);
                    request.setAttribute("usuarios", usuarios);
                    request.getRequestDispatcher("/Vistas/pedidos.jsp").forward(request, response);
                    break;
                case "actualizarEstado":
                    int id = Integer.parseInt(request.getParameter("id"));
                    String estado = request.getParameter("estado");
                    boolean success = pedidodao.actualizarEstado(id, estado);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print("{\"success\": " + success + "}");
                    out.flush();
                    System.out.println("Entro A actualizarEstado");
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
