/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Configuracion.conectar;
import Modelo.Productos;
import Modelo.ProductosDAO;
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
    ProductosDAO pdao = new ProductosDAO();
    Productos pro = new Productos();
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String nombre, descripcion, fotos;
        int id, precio, stock, categ;
        System.out.println("accion= "+accion);
        try {
            List<Productos> productos = pdao.obtenerProductos();
            List<Productos> lpro = pdao.obtenerProductos();
            System.out.println("productos " + productos.get(0).getNombre());

            switch (accion) {
                case "home":
                    request.setAttribute("Productos", productos);
                    System.out.println("Entro A enviar los Productos");
                    request.getRequestDispatcher("/Vistas/Referencia.jsp").forward(request, response);
                    break;
                case "listar":
                    request.setAttribute("listar", lpro);
                    System.out.println("Entro A Listar los Productos");
                    request.getRequestDispatcher("/Vistas/Productos.jsp").forward(request, response);
                    break; 
                
                case "Agregar":
                    id = Integer.parseInt(request.getParameter("txtid"));
                    nombre = request.getParameter("txtnombre");
                    descripcion = request.getParameter("txtdescripcion");
                    precio = Integer.parseInt(request.getParameter("txtprecio"));
                    fotos = request.getParameter("foto");                   
                    //categ = Integer.parseInt(request.getParameter("categoria"));
                    categ = 1;
                    stock = Integer.parseInt(request.getParameter("txtstock"));
                    pro.setId(id);
                    pro.setNombre(nombre);
                    pro.setDescripcion(descripcion);
                    pro.setPrecio(precio);
                    pro.setFoto(fotos);
                    pro.setIdCategoria(categ);
                    pro.setStock(stock); 
                    if (pdao.crear(pro) == true) {
                        System.out.println("Se creo El producto");
                        request.getRequestDispatcher("CtrProductos?accion=listar").forward(request, response);
                    }
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
