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


                    pedidodao.actualizarEnvio(envio, idPedido);

                    Pedido pedido = pedidodao.listarpedido(idPedido);
                    
           
                    Usuario usuario = usudao.listarT(pedido.getIdUsuario());

               
                    String emailUsuario = usuario.getCorreo(); 

                    String host = "smtp.gmail.com";
                    final String username = "famisaludla91@gmail.com"; 
                    final String password = "tghznqkwkhuvjasm"; 

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
                      
                        Message message = new MimeMessage(session);
                        message.setFrom(new InternetAddress("famisaludla91@gmail.com"));
                        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailUsuario));
                        message.setSubject("Famisalud la 91");

                        String htmlContent = "<!DOCTYPE html>"
                                + "<html lang='es'>"
                                + "<head>"
                                + "<meta charset='UTF-8'>"
                                + "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
                                + "<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css' rel='stylesheet'>"
                                + "<title>Notificación de Pedido</title>"
                                + "<style>"
                                + "    body {"
                                + "        font-family: Arial, sans-serif;"
                                + "        background-color: #f8f9fa;"
                                + "        margin: 0;"
                                + "        padding: 20px;"
                                + "    }"
                                + "    .container {"
                                + "        background-color: #ffffff;"
                                + "        border: 2px solid #007bff;"
                                + "        border-radius: 10px;"
                                + "        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);"
                                + "        padding: 30px;"
                                + "    }"
                                + "    .header {"
                                + "        text-align: center;"
                                + "        padding: 15px 20px;"
                                + "        background-color: #007bff;"
                                + "        border-radius: 8px;"
                                + "        border-bottom: 2px solid #0056b3;"
                                + "        margin-bottom: 20px;"
                                + "    }"
                                + "    .header .logo-container {"
                                + "        display: inline-flex;"
                                + "        align-items: center;"
                                + "        justify-content: center;"
                                + "        margin-bottom: 10px;"
                                + "    }"
                                + "    .header .logo-container img {"
                                + "        width: 70px;"
                                + "        margin-right: 10px;"
                                + "    }"
                                + "    .header .logo-text {"
                                + "        color: #ffffff;"
                                + "        font-size: 32px;"
                                + "        font-weight: bold;"
                                + "        line-height: 1;"
                                + "        margin-bottom: 10px;"
                                + "    }"
                                + "    .header h1 {"
                                + "        font-size: 28px;"
                                + "        margin: 0;"
                                + "        color: #ffffff;"
                                + "    }"
                                + "    .footer {"
                                + "        text-align: center;"
                                + "        padding: 10px;"
                                + "        font-size: 0.9em;"
                                + "        color: #6c757d;"
                                + "        border-top: 1px solid #e9ecef;"
                                + "        margin-top: 20px;"
                                + "    }"
                                + "    .content {"
                                + "        margin-top: 20px;"
                                + "        font-size: 16px;"
                                + "        line-height: 1.5;"
                                + "    }"
                                + "    .content strong {"
                                + "        font-weight: bold;"
                                + "        color: #333;"
                                + "    }"
                                + "    a {"
                                + "        color: #007bff;"
                                + "        text-decoration: none;"
                                + "    }"
                                + "    a:hover {"
                                + "        text-decoration: underline;"
                                + "    }"
                                + "</style>"
                                + "</head>"
                                + "<body>"
                                + "    <div class='container'>"
                                + "        <div class='header'>"
                                + "            <div class='logo-container'>"
                                + "                <img src='https://i.pinimg.com/736x/fc/88/df/fc88df658a41975fac07e30eae2a7e7e.jpg' alt='Famisalud la 91 Logo'>"
                                + "                <span class='logo-text'>FamiSalud La 91</span>"
                                + "            </div>"
                                + "        </div>"
                                + "        <div class='content'>"
                                + "            <h3>Notificacion de pedido</h3>"
                                + "            <p>Estimado usuario,</p>"
                                + "            <p>Tu pedido realizado el: <strong>" + pedido.getFechaActual() + "</strong></p>"
                                + "            <p>Con el ID: <strong>" + pedido.getId() + "</strong></p>"
                                + "            <p>Ha sido respondido por el administrador.</p>"
                                + "            <p>El monto del envío ingresado es de: <strong>" + pedido.getEnvio() + "</strong></p>"
                                + "            <p>Gracias por confiar en nosotros.</p>"
                                + "            <p>En el apartado de notificaciones de la pagina podra visualizar su pedido y aceptar el mismo o en su debido caso cancelarlo </p>"
                                + "        </div>"
                                + "        <div class='footer'>"
                                + "            <p>Famisalud la 91</p>"
                                + "        </div>"
                                + "    </div>"
                                + "</body>"
                                + "</html>";

                        message.setContent(htmlContent, "text/html");

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
