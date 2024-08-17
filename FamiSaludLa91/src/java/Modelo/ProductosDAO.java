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
                Productos producto = new Productos(id,nombre,descripcion,precio,foto,idCategoria,stock);
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
            pstm = con.prepareStatement("insert into productos (id, nombre, descripcion, precio, foto, idCategoria, stock) Value(?,?,?,?,?,?,?)");
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
            pstm.executeUpdate();
            return true;
        }catch(Exception e){
             System.out.println("Error al crear los productos" + e);
             return false;
        }
    }
}
