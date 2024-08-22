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
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author SENA
 */
public class UsuarioDAO {

    Connection con;
    PreparedStatement pstm;
    conectar conexion;
    ResultSet rs;
    Usuario us = new Usuario();
    Usuario usua;

    public Usuario Validar(String correo, String pass) {
        Usuario usua = null;
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conectar conexion = new conectar();
            con = conexion.crearconexion();
            if (con != null) {
                String query = "SELECT * FROM usuarios WHERE correo = ? AND contrasena = ?";
                pstm = con.prepareStatement(query);
                pstm.setString(1, correo);
                String hashedPass = hashPassword(pass);
                pstm.setString(2, hashedPass);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    usua = new Usuario();
                    usua.setCorreo(rs.getString("correo"));
                    usua.setId(rs.getInt("id"));
                    usua.setContrasena(rs.getString("contrasena"));
                    usua.setNombre(rs.getString("nombre"));
                    usua.setRol(rs.getString("rol"));
                    usua.setDireccion(rs.getString("direccion"));
                    usua.setApellido(rs.getString("apellidos"));
                    usua.setTelefono(rs.getString("telefono"));
                }
            }
        } catch (Exception e) {
            System.out.println("Error al conectarse a la base de datos: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstm != null) {
                    pstm.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return usua;
    }
    private String hashPassword(String password) {
        return password;
    }
    public List<Usuario> obtenerUsuarios(){
         List<Usuario> users = new ArrayList<>();
        try {
            conectar conection = new conectar();
            Connection conexion = conection.crearconexion();
            if (conexion != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            String consulta = "Select * from usuarios";
            PreparedStatement stm = conexion.prepareStatement(consulta);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String apellidos = rs.getString("apellidos");
                String correo = rs.getString("correo");
                String telefono = rs.getString("telefono");
                String contrasena = rs.getString("contrasena");
                String direccion = rs.getString("direccion");
                String rol = rs.getString("rol");
                Usuario user = new Usuario(id,telefono,nombre,apellidos,correo,contrasena,rol,direccion);
                users.add(user);
            }
        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Cargar Los Usuarios "+ ex);
        }
        
            return users;
}
    public boolean crear(Usuario us) {
        try {
            conexion = new conectar();
            Connection con = conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("INSERT INTO usuarios(nombre,apellidos,correo,telefono,contrasena,direccion,rol) VALUES(?,?,?,?,?,?,?);");
            pstm.setString(1, us.getNombre());
            System.out.println(us.getNombre());
            pstm.setString(2, us.getApellido());
            System.out.println(us.getApellido());
            pstm.setString(3, us.getCorreo());
            System.out.println(us.getCorreo());
            pstm.setString(4, us.getTelefono());
            System.out.println(us.getTelefono());
            pstm.setString(5, us.getContrasena());
            System.out.println(us.getContrasena());
            pstm.setString(6, us.getDireccion());
            System.out.println(us.getDireccion());
            pstm.setString(7, us.getRol());
            System.out.println(us.getRol());
            if (us.getNombre() != null && us.getApellido() != null && us.getContrasena() != null && us.getCorreo() != null && us.getDireccion() != null && us.getTelefono() != null && us.getRol() != null) {
                System.out.println("IF compraracion Todos Si");
                if (pstm.executeUpdate() == 1) {
            return true;
            }else{
                return false;
            }
            }else{
                return false;
            }
        } catch (Exception e) {
            System.out.println("Error Al Crear El Usuario" + e);
            return false;
        }
    }
}
