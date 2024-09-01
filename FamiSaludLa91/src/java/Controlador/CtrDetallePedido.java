/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.DetallePedido;
import Modelo.DetallePedidoDAO;
import Modelo.Pedido;
import Modelo.Productos;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "CtrDetallePedido", urlPatterns = {"/CtrDetallePedido"})
public class CtrDetallePedido extends HttpServlet {

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
        String accion = request.getParameter("accion");
        System.out.println("accion= " + accion);
        DetallePedidoDAO detalleDao = new DetallePedidoDAO();
        try {
            switch (accion) {
                case "mostrar":
                    int idped = Integer.parseInt(request.getParameter("idPedido"));
                    String fechaCompleta = request.getParameter("fechaCompleta");
                    List<Productos> prod = detalleDao.ListarProd(idped);
                    List<DetallePedido> lPed = detalleDao.ListarPed(idped);
                    Usuario user = detalleDao.obtenerDatosUsuarioId(idped);
                    request.setAttribute("idPedido", idped);
                    request.setAttribute("Lped", lPed);
                    request.setAttribute("fechaCompleta", fechaCompleta);
                    request.setAttribute("usuario", user);
                    request.setAttribute("productos", prod);
                    request.getRequestDispatcher("/Vistas/DetallePedido.jsp").forward(request, response);
                    break;

                default:
                    System.out.println("Accion no reconocida");
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
