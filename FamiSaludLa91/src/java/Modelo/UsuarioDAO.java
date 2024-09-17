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

    public Usuario Validar(String correo) {
        Usuario usua = null;
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conectar conexion = new conectar();
            con = conexion.crearconexion();
            if (con != null) {
                String query = "SELECT * FROM usuarios WHERE correo = ?";
                pstm = con.prepareStatement(query);
                pstm.setString(1, correo);
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
    
    public int contarUsuarios() {
        int cantidadUsuarios = 0;

        try {
            conectar conection = new conectar();
            Connection conexion = conection.crearconexion();

            if (conexion != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
            }

            String consulta = "SELECT COUNT(*) AS total FROM usuarios";
            PreparedStatement stm = conexion.prepareStatement(consulta);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                cantidadUsuarios = rs.getInt("total");
            }

        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Contar Los Usuarios: " + ex);
        }

        return cantidadUsuarios;
    }
    
    public Usuario listarT(int idu){
        Usuario usu = new Usuario();
        try {
            conexion = new conectar();
            Connection con = conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
                
            }
            pstm = con.prepareStatement("select * from usuarios where id= ?");
            pstm.setInt(1, idu);
            rs = pstm.executeQuery();
            while (rs.next()) {
                usu.setId(rs.getInt(1));
                usu.setNombre(rs.getString(2));
                usu.setApellido(rs.getString(3));
                usu.setCorreo(rs.getString(4));
                usu.setTelefono(rs.getString(5));
                usu.setContrasena(rs.getString(6));
                usu.setDireccion(rs.getString(7));
                usu.setRol(rs.getString(8));
            }

        } catch (Exception e) {
            System.out.println("Error al listar los usuarios " + e);
        }
        return usu;
    }
    
    
    public List listarT(String nombre){
        List<Usuario> users = new ArrayList();
        nombre = "%"+nombre+"%";
        System.out.println("Buscando usuarios con nombre: " + nombre);
        try {
            conexion = new conectar();
            Connection con = conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            
            }
            pstm = con.prepareStatement("select * from usuarios where nombre like ?");
            pstm.setString(1, nombre);
            System.out.println("Consulta SQL: " + pstm.toString());
            rs = pstm.executeQuery();
            while (rs.next()) {
                Usuario usu = new Usuario();
                usu.setId(rs.getInt(1));
                usu.setNombre(rs.getString(2));
                usu.setApellido(rs.getString(3));
                usu.setCorreo(rs.getString(4));
                usu.setTelefono(rs.getString(5));
                usu.setContrasena(rs.getString(6));
                usu.setDireccion(rs.getString(7));
                usu.setRol(rs.getString(8));
                users.add(usu);
                System.out.println("usuario encontrado: " + usu.getNombre());
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos " + e);
        }
        return users;
    }
    public void editar(Usuario us){
        try{
            conexion = new conectar();
            Connection con = conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("update usuarios set rol=? where id = ?");                   
            pstm.setString(1, us.getRol());
            System.out.println(us.getRol());
            pstm.setInt(2, us.getId());
            System.out.println(us.getId());
            pstm.executeUpdate();
            System.out.println("registros actulizado");
        }catch(Exception e){
             System.out.println("Error al editar los usuarios" + e);
        }
    }
    
    public boolean eliminar(String idus) {
        try {
            conexion = new conectar();
            Connection con = conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("delete from usuarios where id = ?");
            pstm.setString(1, idus);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar el Producto " + e);
        }
        return true;
    }

    public void editarUser(int id, String nombre, String apellido, String correo, String telefono, String direccion) {
        Connection con = null;
        PreparedStatement pstm = null;

        try {
            conectar conexion = new conectar();
            con = conexion.crearconexion();

            if (con != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
            }

            // SQL query to update user details
            String sql = "UPDATE usuarios SET nombre = ?, apellidos = ?, correo = ?, telefono = ?, direccion = ? WHERE id = ?";
            pstm = con.prepareStatement(sql);

            // Set parameters
            pstm.setString(1, nombre);
            pstm.setString(2, apellido);
            pstm.setString(3, correo);
            pstm.setString(4, telefono);
            pstm.setString(5, direccion);
            pstm.setInt(6, id);

            // Execute update
            pstm.executeUpdate();
            System.out.println("Registro actualizado exitosamente");
        } catch (Exception e) {
            System.out.println("Error al actualizar el usuario: " + e);
        } finally {
            // Close resources
            try {
                if (pstm != null) {
                    pstm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                System.out.println("Error al cerrar los recursos: " + e);
            }
        }
    }
    
    public void editarUserpago(int id, String nombre, String apellido, String correo, String telefono, String direccion) {
        Connection con = null;
        PreparedStatement pstm = null;

        try {
            conectar conexion = new conectar();
            con = conexion.crearconexion();

            if (con != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
            }

            // SQL query to update user details
            String sql = "UPDATE usuarios SET nombre = ?, apellidos = ?, correo = ?, telefono = ?, direccion = ? WHERE id = ?";
            pstm = con.prepareStatement(sql);

            // Set parameters
            pstm.setString(1, nombre);
            pstm.setString(2, apellido);
            pstm.setString(3, correo);
            pstm.setString(4, telefono);
            pstm.setString(5, direccion);
            pstm.setInt(6, id);

            // Execute update
            pstm.executeUpdate();
            System.out.println("Registro actualizado exitosamente");
        } catch (Exception e) {
            System.out.println("Error al actualizar el usuario: " + e);
        } finally {
            // Close resources
            try {
                if (pstm != null) {
                    pstm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                System.out.println("Error al cerrar los recursos: " + e);
            }
        }
    }
     public boolean correoExiste(String correo) {
        Connection conexion = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conectar conection = new conectar();
            conexion = conection.crearconexion();

            String sql = "SELECT COUNT(*) FROM usuarios WHERE correo = ?";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setString(1, correo);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception ex) {
            System.out.println("Error al verificar el correo electrónico: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conexion != null) conexion.close();
            } catch (Exception ex) {
                System.out.println("Error al cerrar los recursos: " + ex.getMessage());
            }
        }
        return false;
    }
}
