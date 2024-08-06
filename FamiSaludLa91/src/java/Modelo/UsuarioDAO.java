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
    public Usuario Validar(String correo, String pass){
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
    
    
}
