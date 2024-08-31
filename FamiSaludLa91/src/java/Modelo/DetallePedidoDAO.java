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
public class DetallePedidoDAO {



    public Usuario obtenerDatosUsuarioId(int idPedido) {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Usuario user = new Usuario();
        System.out.println(idPedido);
        try {
            conectar Conexcion  = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("Select u.id, u.nombre,u.apellidos,u.correo,u.telefono,u.contrasena ,u.direccion, u.rol  from pedidos p , usuarios u where u.id = p.idUsuario and p.id = ?");
            pstm.setInt(1, idPedido);
            rs = pstm.executeQuery();
            while (rs.next()) {
                System.out.println("Entro al While");
                System.out.println("id " + rs.getString("direccion"));
                user.setId(rs.getInt("id"));
                user.setNombre(rs.getString("nombre"));
                user.setApellido(rs.getString("apellidos"));
                user.setCorreo(rs.getString("correo"));
                user.setTelefono(rs.getString("telefono"));
                user.setContrasena(rs.getString("contrasena"));
                user.setDireccion(rs.getString("direccion"));
                user.setRol(rs.getString("rol"));
                System.out.println("Se le asiganron los datos a el usuario");
            }
        } catch (Exception e) {
            System.out.println("Error al cargar los datos del usuario en detallepedido 1" + e.getMessage());
        }
        return user;
    }
    
    public List<Productos> ListarProd(int idp){
        List<Productos> prod = new ArrayList<>();
        try {
            Productos p;
            PreparedStatement pstm = null;
            ResultSet rs = null;
            conectar Conexcion  = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("SELECT p.id AS productoId,p.nombre,p.descripcion,p.precio,p.foto,p.idCategoria,p.stock,p.idproveedor,dp.cantidad,dp.total FROM DetallePedido dp JOIN Productos p ON dp.idProducto = p.id WHERE dp.idPedido = ?");
            pstm.setInt(1, idp);
            rs = pstm.executeQuery();
            while (rs.next()) {
                p = new Productos();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setPrecio(rs.getInt(4));
                p.setFoto(rs.getString(5));
                p.setIdCategoria(rs.getInt(6));
                p.setStock(rs.getInt(7));
                prod.add(p);
            }
            System.out.println("Entro A Listar El Producto");

        } catch (Exception e) {
            System.out.println("Error al listar los productos " + e);
        }
        return prod;
    }
    public List<DetallePedido> ListarPed(int idp){
        List<DetallePedido> Lped = new ArrayList<>();
        try {
            DetallePedido ped;
            PreparedStatement pstm = null;
            ResultSet rs = null;
            conectar Conexcion  = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("SELECT dp.id, dp.idPedido, dp.idProducto, dp.cantidad, dp.total FROM DetallePedido dp WHERE dp.idPedido = ?");
            pstm.setInt(1, idp);
            rs = pstm.executeQuery();
            while (rs.next()) {
                ped = new DetallePedido();
                ped.setId(rs.getInt("id"));
                ped.setIdPedido(rs.getInt("idPedido"));
                ped.setIdProducto(rs.getInt("idProducto"));
                ped.setCantidad(rs.getInt("cantidad"));
                ped.setTotal(rs.getInt("total"));
                Lped.add(ped);
            }
            System.out.println("Entro A Listar El los PEdidos");

        } catch (Exception e) {
            System.out.println("Error al listar los Pedidos " + e);
        }
        return Lped;
    }
   
}
