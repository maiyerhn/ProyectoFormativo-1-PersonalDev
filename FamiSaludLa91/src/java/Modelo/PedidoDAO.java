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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Maiyer
 */
public class PedidoDAO {

    conectar Conexcion;
    Connection con;
    PreparedStatement pstm;

    public List<Pedido> obtenerPedidos() {
        List<Pedido> pedidos = new ArrayList<>();
        try {
            conectar conection = new conectar();
            Connection conexion = conection.crearconexion();
            if (conexion != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            String consulta = "Select * from Pedidos";
            PreparedStatement stm = conexion.prepareStatement(consulta);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int idUsuario = rs.getInt("idUsuario");
                Date fechaCreacion = rs.getDate("fechaCreacion");
                String estado = rs.getString("estado");
                int total = rs.getInt("total");
                Pedido pedido = new Pedido(id, idUsuario, total, fechaCreacion, estado);
                pedidos.add(pedido);
            }
        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Cargar Los Productos " + ex);
        }

        return pedidos;
    }

    public Usuario obtenerUsuarioPorId(int idUsuario) {
        Usuario usua = new Usuario();
        try {
            conectar conection = new conectar();
            Connection conexion = conection.crearconexion();
            String consulta = "SELECT * FROM Usuarios WHERE id = ?";
            PreparedStatement stm = conexion.prepareStatement(consulta);
            stm.setInt(1, idUsuario);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                System.out.println("Entro A la Validacion");
                usua.setCorreo(rs.getString("correo"));
                usua.setId(rs.getInt("id"));
                usua.setContrasena(rs.getString("contrasena"));
                usua.setNombre(rs.getString("nombre"));
                usua.setRol(rs.getString("rol"));
                usua.setDireccion(rs.getString("direccion"));
                usua.setApellido(rs.getString("apellidos"));
                usua.setTelefono(rs.getString("telefono"));
            }
        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Obtener el Usuario " + ex);
        }
        return usua;

    }

}
