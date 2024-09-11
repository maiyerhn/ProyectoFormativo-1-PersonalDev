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
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
    UsuarioDAO usudao = new UsuarioDAO();
    int idU;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();
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
                case "enviarValor":
                    int envio = Integer.parseInt(request.getParameter("envio"));
                    int idPedido = Integer.parseInt(request.getParameter("pedidoId"));
                    int idUser = Integer.parseInt(request.getParameter("iduser"));

                    // Actualizar el envío en la base de datos
                    pedidodao.actualizarEnvio(envio, idPedido);

                    // Obtener los detalles del pedido actualizado
                    Pedido pedido = pedidodao.listarpedido(idPedido);
                    
           
    Usuario         usuario = usudao.listarT(pedido.getIdUsuario());

                    // Obtener el correo electrónico del usuario
                    String emailUsuario = usuario.getCorreo(); // Implementa este método para obtener el email del usuario desde tu base de datos

                    // Configuración del servidor de correo
                    String host = "smtp.gmail.com"; // Cambia esto por tu servidor SMTP
                    final String username = "jeromartinezcas21@gmail.com"; // Tu correo electrónico
                    final String password = "aatdtcktjhlffaah"; // Tu contraseña

                    Properties props = new Properties();
                    props.put("mail.smtp.host", host);
                    props.put("mail.smtp.port", "587");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.starttls.enable", "true");

                    Session session = Session.getInstance(props, new Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });

                    try {
                        // Crear el mensaje de correo electrónico
                        Message message = new MimeMessage(session);
                        message.setFrom(new InternetAddress("jeromartinezcas21@gmail.com"));
                        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailUsuario));
                        message.setSubject("Famisalud la 91");
                        message.setText("Solicitud de pedido " + idPedido + "\n\n tu pedido realizado el: " + pedido.getFechaActual() + "\n ha sido respondido por el administrador \n el moto del envio ingresado es de: " + pedido.getEnvio());

                        // Enviar el correo electrónico
                        Transport.send(message);

                        System.out.println("Correo electrónico enviado con éxito.");

                    } catch (MessagingException e) {
                        e.printStackTrace();
                        System.out.println("Error al enviar el correo electrónico.");
                    }

                    // Redirigir al usuario
                    response.sendRedirect(request.getContextPath() + "/CtrProductos?accion=listarInventario&id=" + idUser);
                    break;

                case "terminarPedido":
                    idPedido = Integer.parseInt(request.getParameter("idPedido"));
                    idUser = Integer.parseInt(request.getParameter("idUser"));
                    pedidodao.cambiarEstado(idPedido);
                    response.sendRedirect(request.getContextPath() + "/CtrProductos?accion=Inicio&id=" + idUser);
                    break;
                case "eliminarSolicitud": 
                    idPedido = Integer.parseInt(request.getParameter("idPedido"));
                    pedidodao.eliminarPedido(idPedido);
                    idUser = Integer.parseInt(request.getParameter("idUser"));
                    response.sendRedirect(request.getContextPath() + "/CtrProductos?accion=Inicio&id=" + idUser);
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
