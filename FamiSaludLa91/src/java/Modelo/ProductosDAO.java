/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Configuracion.conectar;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Maiyer
 */
public class ProductosDAO {

    conectar Conexcion;
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;

    public List<Productos> obtenerProductos() {
        List<Productos> productos = new ArrayList<>();
        try {
            conectar conection = new conectar();
            Connection conexion = conection.crearconexion();
            if (conexion != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            LocalDate today = LocalDate.now();
            Date fechaActual = Date.valueOf(today);
            String consulta = "SELECT * FROM productos WHERE stock > 0 AND fechaVencimiento >= ?";
            PreparedStatement stm = conexion.prepareStatement(consulta);
            stm.setDate(1, fechaActual);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                int precio = rs.getInt("precio");
                String foto = rs.getString("foto");
                int idCategoria = rs.getInt("idCategoria");
                int stock = rs.getInt("stock");
                int proveedor = rs.getInt("idproveedor");
                Date fechaVencimiento = rs.getDate("fechaVencimiento");
                Productos producto = new Productos(id, nombre, descripcion, precio, foto, idCategoria, stock, proveedor, fechaVencimiento);
                productos.add(producto);
            }
        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Cargar Los Productos " + ex);
        }

        return productos;
    }

    public boolean crear(Productos pro) {
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("insert into productos (nombre, descripcion, precio, foto, idCategoria, stock, idproveedor, fechaVencimiento) Value(?,?,?,?,?,?,?,?)");
            pstm.setString(1, pro.getNombre());
            System.out.println(pro.getNombre());
            pstm.setString(2, pro.getDescripcion());
            System.out.println(pro.getDescripcion());
            pstm.setInt(3, pro.getPrecio());
            System.out.println(pro.getPrecio());
            pstm.setString(4, pro.getFoto());
            System.out.println(pro.getFoto());
            pstm.setInt(5, pro.getIdCategoria());
            System.out.print(pro.getIdCategoria());
            pstm.setInt(6, pro.getStock());
            System.out.println(pro.getStock());
            pstm.setInt(7, pro.getProveedor());
            System.out.println(pro.getProveedor());
            pstm.setDate(8, pro.getFechaVencimiento());
            System.out.println(pro.getFechaVencimiento());
            pstm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al crear los productos" + e);
            return false;
        }
    }

    public Productos listarid(int idp) {
        Productos p = new Productos();
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from productos where Stock >0 and id = ?");
            pstm.setInt(1, idp);
            rs = pstm.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                System.out.println(p.getId());
                p.setNombre(rs.getString(2));
                System.out.println(p.getNombre());
                p.setDescripcion(rs.getString(3));
                System.out.println(p.getDescripcion());
                p.setPrecio(rs.getInt(4));
                System.out.println(p.getPrecio());
                p.setFoto(rs.getString(5));
                System.out.println(p.getFoto());
                p.setIdCategoria(rs.getInt(6));
                System.out.println(p.getIdCategoria());
                p.setStock(rs.getInt(7));
                System.out.println(p.getStock());
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos " + e);
        }
        return p;
    }

    public List listarT() {
        List<Productos> productos = new ArrayList();
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from productos");
            rs = pstm.executeQuery();
            while (rs.next()) {
                Productos pro = new Productos();
                pro.setId(rs.getInt(1));
                pro.setNombre(rs.getString(2));
                pro.setDescripcion(rs.getString(3));
                pro.setPrecio(rs.getInt(4));
                pro.setFoto(rs.getString(5));
                pro.setIdCategoria(rs.getInt(6));
                pro.setStock(rs.getInt(7));

                productos.add(pro);
            }

        } catch (SQLException e) {
            System.out.println("Error al listar los productos " + e);
        }

        return productos;
    }

    public Productos listarT(int idp) {
        Productos pro = new Productos();
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from productos where id= ?");
            pstm.setInt(1, idp);
            rs = pstm.executeQuery();
            while (rs.next()) {
                pro.setId(rs.getInt(1));
                pro.setNombre(rs.getString(2));
                pro.setDescripcion(rs.getString(3));
                pro.setPrecio(rs.getInt(4));
                pro.setFoto(rs.getString(5));
                pro.setIdCategoria(rs.getInt(6));
                pro.setStock(rs.getInt(7));
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos " + e);
        }
        return pro;
    }

    public void editar(Productos pro) {
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("update productos set nombre=?, descripcion=?,  precio=?, foto=?, idCategoria=?, stock=?, idproveedor=?, fechaVencimiento=? where id = ?");
            pstm.setString(1, pro.getNombre());
            pstm.setString(2, pro.getDescripcion());
            pstm.setInt(3, pro.getPrecio());
            pstm.setString(4, pro.getFoto());
            pstm.setInt(5, pro.getIdCategoria());
            pstm.setInt(6, pro.getStock());
            pstm.setInt(7, pro.getProveedor());
            pstm.setDate(8, new java.sql.Date(pro.getFechaVencimiento().getTime()));
            pstm.setInt(9, pro.getId());
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al editar los productosd" + e);
        }
    }

    public int contarProductos() {
        int cantidadProductos = 0;

        try {
            conectar conection = new conectar();
            Connection conexion = conection.crearconexion();

            if (conexion != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
            }

            String consulta = "SELECT COUNT(*) AS total FROM productos";
            PreparedStatement stm = conexion.prepareStatement(consulta);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                cantidadProductos = rs.getInt("total");
            }

        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Contar Los Usuarios: " + ex);
        }

        return cantidadProductos;
    }

    public List buscarP(String nombre) {
        List<Productos> producto = new ArrayList();
        nombre = "%" + nombre + "%";
        System.out.println("Buscando productos con nombre: " + nombre);
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from productos where nombre like ?");
            pstm.setString(1, nombre);
            System.out.println("Consulta SQL: " + pstm.toString());
            rs = pstm.executeQuery();
            while (rs.next()) {
                Productos pro = new Productos();
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nombre"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setPrecio(rs.getInt("precio"));
                pro.setFoto(rs.getString("foto"));
                pro.setIdCategoria(rs.getInt("idCategoria"));
                pro.setStock(rs.getInt("stock"));
                pro.setFechaVencimiento(rs.getDate("fechaVencimiento"));
                producto.add(pro);
                System.out.println("Producto encontrado: " + pro.getNombre());
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos " + e);
        }
        return producto;
    }

    public List buscarcat(int idcat) {
        List<Productos> producto = new ArrayList();
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            LocalDate today = LocalDate.now();
            Date fechaActual = Date.valueOf(today);
            pstm = con.prepareStatement("select * from productos where  idCategoria = ? and stock > 0 and fechaVencimiento >= ? ");
            pstm.setInt(1, idcat);
            pstm.setDate(2, fechaActual);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Productos pro = new Productos();
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nombre"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setPrecio(rs.getInt("precio"));
                pro.setFoto(rs.getString("foto"));
                pro.setIdCategoria(rs.getInt("idCategoria"));
                pro.setStock(rs.getInt("stock"));
                pro.setFechaVencimiento(rs.getDate("fechaVencimiento"));
                producto.add(pro);
                System.out.println("Producto encontrado: " + pro.getNombre());
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos por categoria " + e);
        }
        return producto;
    }

    public boolean eliminar(String ide) {
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("delete from productos where id = ?");
            pstm.setString(1, ide);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar el Producto " + e);
        }
        return true;
    }

    public Productos listarId(int idProducto) {
        Productos producto = null;
        conectar Conexcion = new conectar();
        try (
                Connection con = Conexcion.crearconexion();
                PreparedStatement pstm = con.prepareStatement("SELECT * FROM productos WHERE id = ?")) {

            if (con != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
            }
            pstm.setInt(1, idProducto);

            try (ResultSet rs = pstm.executeQuery()) {
                if (rs.next()) {
                    producto = new Productos();
                    producto.setId(rs.getInt("id"));
                    producto.setNombre(rs.getString("nombre"));
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecio(rs.getInt("precio"));
                    producto.setFoto(rs.getString("foto"));
                    producto.setIdCategoria(rs.getInt("idCategoria"));
                    producto.setStock(rs.getInt("stock"));
                } else {
                    System.out.println("No se encontró el producto con ID: " + idProducto);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al listar el producto por ID: juan" + e.getMessage());
        }

        return producto;
    }

    public List<Productos> obtenerProductosDescuento() {
        List<Productos> productos = new ArrayList<>();
        try {
            conectar conection = new conectar();
            Connection conexion = conection.crearconexion();
            if (conexion != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            LocalDate today = LocalDate.now();
            Date fechaActual = Date.valueOf(today);
            String consulta = "SELECT p.* FROM Productos p JOIN Categoria c ON p.idCategoria = c.id WHERE c.ofertas > 0 and stock > 0 AND p.fechaVencimiento >= ?";
            PreparedStatement stm = conexion.prepareStatement(consulta);
            stm.setDate(1, fechaActual);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                int precio = rs.getInt("precio");
                String foto = rs.getString("foto");
                int idCategoria = rs.getInt("idCategoria");
                int stock = rs.getInt("stock");
                int proveedor = rs.getInt("idproveedor");
                Date fechaVencimiento = rs.getDate("fechaVencimiento");
                Productos producto = new Productos(id, nombre, descripcion, precio, foto, idCategoria, stock, proveedor, fechaVencimiento);
                productos.add(producto);
            }
        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Cargar Los Productos " + ex);
        }

        return productos;
    }

   public List<Productos> listardate(String idf, String idf2) {
    List<Productos> lp = new ArrayList<>();
    try {
        Conexcion = new conectar();
        Connection con = Conexcion.crearconexion();
        if (con != null) {
            System.out.println("Se ha establecido una conexcion con la base de datos");
        }
        
        String sql;
        SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
        java.sql.Date fecha1 = null;
        java.sql.Date fecha2 = null;

        // Convertir las cadenas a fechas SQL
        if (idf != null && !idf.isEmpty()) {
            try {
                java.util.Date fv1 = form.parse(idf);
                fecha1 = new java.sql.Date(fv1.getTime());
            } catch (Exception e) {
                System.out.println("Error al convertir la fecha de inicio: " + e.getMessage());
            }
        }

        if (idf2 != null && !idf2.isEmpty()) {
            try {
                java.util.Date fv2 = form.parse(idf2);
                fecha2 = new java.sql.Date(fv2.getTime());
            } catch (Exception e) {
                System.out.println("Error al convertir la fecha de fin: " + e.getMessage());
            }
        }
            sql = "SELECT * FROM productos WHERE fechaVencimiento BETWEEN ? AND ?";
            pstm = con.prepareStatement(sql);
            pstm.setDate(1, fecha1);
            pstm.setDate(2, fecha2);
            rs = pstm.executeQuery();
            System.out.println("loooooo");
        while (rs.next()) {
            Productos p = new Productos();
            p.setId(rs.getInt("id"));
            System.out.println(p.getId());
            p.setNombre(rs.getString("nombre"));
            System.out.println(p.getNombre());
            p.setDescripcion(rs.getString("descripcion"));
            System.out.println(p.getDescripcion());
            p.setPrecio(rs.getInt("precio"));
            System.out.println(p.getPrecio());
            p.setFoto(rs.getString("foto"));
            System.out.println(p.getFoto());
            p.setIdCategoria(rs.getInt("idCategoria"));
            System.out.println(p.getIdCategoria());
            p.setStock(rs.getInt("stock"));
            p.setFechaVencimiento(rs.getDate("fechaVencimiento"));
            System.out.println(p.fechaVencimiento);
            System.out.println(p.getStock());
            lp.add(p);
        }

    } catch (Exception e) {
        System.out.println("Error al listar los productos: " + e.getMessage());
    }
    return lp;
}

}
