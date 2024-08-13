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
        try {
            conexion = new conectar();
            con = conexion.crearconexion();
            if (con != null) {
                System.out.println("se conecto");
                pstm = con.prepareStatement("select * from usuarios where correo = ? and contrasena = ? ");
                pstm.setString(1, correo);
                pstm.setString(2, pass);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    System.out.println("el rs tiene algo");
                    if (!rs.getString("correo").equals("")) {
                        usua = new Usuario();
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
                }

            }
        } catch (Exception e) {
            System.out.println("Eror Al Conectarse A la Base de Datos");
        }

        return usua;
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
