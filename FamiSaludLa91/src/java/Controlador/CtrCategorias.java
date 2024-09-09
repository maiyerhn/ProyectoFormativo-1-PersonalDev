/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Categoria;
import Modelo.CategoriaDAO;
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
 * @author jjuan
 */
@WebServlet(name = "CtrCategorias", urlPatterns = {"/CtrCategorias"})
public class CtrCategorias extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    CategoriaDAO cdao = new CategoriaDAO();
    int idc, ofertas;
    String nombre, descripcion;
    Categoria cat = new Categoria();
    List<Categoria> categ;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        System.out.println("accion= " + accion);
        String id;
        try {
            List<Categoria> categoria = new ArrayList();

            categoria = cdao.listar();
            System.out.println("categorias " + categoria.size());
            switch (accion) {
                case "listarCategorias":
                    request.setAttribute("categoria", categoria);
                    System.out.println("Entro A enviar las categorias" + categoria);
                    request.getRequestDispatcher("/Vistas/Categorias.jsp").forward(request, response);
                    break;
                case "eliminar":
                    id = request.getParameter("id");
                    System.out.println("Entró a eliminar la categoría con ID: " + id);
                    try{
                    cdao.eliminar(id);
                    categoria = cdao.listar();
                    request.setAttribute("categoria", categoria);
                    System.out.println("Enviando la lista actualizada de categorías: " + categoria);
                    response.sendRedirect("/FamiSaludLa91/CtrCategorias?accion=listarCategorias&mensaje=Categoria eliminada exitosamente");
                    }catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("/FamiSaludLa91/CtrCategorias?accion=listarCategorias&mensaje=Error%20al%20eliminar%20La%20categoria");
                    }
                    break;
                case "Agregar":
                    System.out.println("Entro a agregar Categoria");
                    idc = Integer.parseInt(request.getParameter("txtid"));
                    nombre = request.getParameter("txtnombre");
                    descripcion = request.getParameter("txtdescripcion");
                    ofertas = Integer.parseInt(request.getParameter("txtofertas"));
                    System.out.println("almaceno los datos");
                    System.out.println(idc + nombre + descripcion + ofertas);

                    cat.setId(idc);
                    cat.setNombre(nombre);
                    cat.setDescripcion(descripcion);
                    cat.setOfertas(ofertas);
                    if (cdao.crear(cat) == true) {
                        System.out.println("Se creo La Categoria");
                        request.getRequestDispatcher("CtrCategorias?accion=listarCategorias").forward(request, response);
                    }
                    break;
                case "EditarCategoria":
                    System.out.println("entro a editar");
                    idc = Integer.parseInt(request.getParameter("idc"));
                    System.out.println("id" + idc);
                    cat = cdao.listarT(idc);
                    System.out.println("octuvo categoria: " + cat);
                    request.setAttribute("CategoriaE", cat);
                    request.setAttribute("editarCat", true);
                    categoria = cdao.listarT();
                    request.setAttribute("categoria", categoria);
                    request.getRequestDispatcher("/Vistas/Categorias.jsp").forward(request, response);
                    break;
                case "actualizarCategoria":
                    System.out.println("Entro a editar Categoria");
                    idc = Integer.parseInt(request.getParameter("txtid"));
                    nombre = request.getParameter("txtnombre");
                    descripcion = request.getParameter("txtdescripcion");
                    ofertas = Integer.parseInt(request.getParameter("txtofertas"));
                    System.out.println("almaceno los datos");
                    System.out.println(idc + nombre + descripcion + ofertas);

                    cat.setId(idc);
                    cat.setNombre(nombre);
                    cat.setDescripcion(descripcion);
                    cat.setOfertas(ofertas);
                    
                    cdao.editar(cat);
                     request.getRequestDispatcher("CtrCategorias?accion=listarCategorias").forward(request, response);
                    break;
                    
                case "buscarCatInicio":
                    CategoriaDAO catdao = new CategoriaDAO();
                    List<Categoria> cat = catdao.listarT();
                    request.setAttribute("Categorias", cat);
                    request.getRequestDispatcher("/Vistas/Inicio.jsp").forward(request, response);
                    
                    break;
                case "buscarCatCarrito":
                    CategoriaDAO catdao2 = new CategoriaDAO();
                    List<Categoria> cat2 = catdao2.listarT();
                    request.setAttribute("Categorias", cat2);
                    request.getRequestDispatcher("/CtrProductos?accion=Carrito").forward(request, response);
                    
                    break;
                case "buscarCategoria":
                    String cate = request.getParameter("busquedaCat");
                    categ = cdao.buscarCat(cate);
                    System.out.println(categ);
                    request.setAttribute("categoria", categ);
                    request.getRequestDispatcher("/Vistas/Categorias.jsp").forward(request, response);
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
