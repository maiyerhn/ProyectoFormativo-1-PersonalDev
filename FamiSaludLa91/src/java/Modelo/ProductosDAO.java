/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import Configuracion.conectar;
    import java.sql.Connection;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
import java.sql.SQLException;
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
    
    public List<Productos> obtenerProductos(){
        List<Productos> productos = new ArrayList<>();
        try {
            conectar conection = new conectar();
            Connection conexion = conection.crearconexion();
            if (conexion != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            String consulta = "Select * from productos";
            PreparedStatement stm = conexion.prepareStatement(consulta);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                int precio = rs.getInt("precio");
                String foto = rs.getString("foto");
                int idCategoria = rs.getInt("idCategoria");
                int stock = rs.getInt("stock");
                int proveedor = rs.getInt("idproveedor");
                Productos producto = new Productos(id,nombre,descripcion,precio,foto,idCategoria,stock,proveedor);
                productos.add(producto);
            }
        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Cargar Los Productos "+ ex);
        }
        
        return productos;
    }
    
     public boolean crear(Productos pro){
        try{
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("insert into productos (id, nombre, descripcion, precio, foto, idCategoria, stock, idproveedor) Value(?,?,?,?,?,?,?,?)");
            pstm.setInt(1, pro.getId());
            System.out.println(pro.getId());
            pstm.setString(2, pro.getNombre());
            System.out.println(pro.getNombre());
            pstm.setString(3, pro.getDescripcion());
            System.out.println(pro.getDescripcion());
            pstm.setInt(4, pro.getPrecio());
            System.out.println(pro.getPrecio());
            pstm.setString(5, pro.getFoto());
            System.out.println(pro.getFoto());
            pstm.setInt(6, pro.getIdCategoria());
            System.out.print(pro.getIdCategoria());
            pstm.setInt(7, pro.getStock());
            System.out.println(pro.getStock());
            pstm.setInt(8, pro.getProveedor());
            System.out.println(pro.getProveedor());
            pstm.executeUpdate();
            return true;
        }catch(Exception e){
             System.out.println("Error al crear los productos" + e);
             return false;
        }
    }
     
     public Productos listarid(int idp){
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
     public List listarT(){
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
     
     public Productos listarT(int idp){
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
     
     public void editar(Productos pro){
        try{
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("update productos set nombre=?, descripcion=?,  precio=?, foto=?, idCategoria=?, stock=?, idproveedor=? where id = ?");          
            pstm.setString(1, pro.getNombre());
            pstm.setString(2, pro.getDescripcion());
            pstm.setInt(3, pro.getPrecio());
            pstm.setString(4, pro.getFoto());
            pstm.setInt(5, pro.getIdCategoria());
            pstm.setInt(6, pro.getStock());
            pstm.setInt(7, pro.getProveedor());
            pstm.setInt(8, pro.getId());
            pstm.executeUpdate();
        }catch(Exception e){
             System.out.println("Error al editar los productos" + e);
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
}
