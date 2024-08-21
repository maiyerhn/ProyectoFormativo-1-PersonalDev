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
 * @author HPLAPTOP01
 */
public class CategoriaDAO {
    
    Connection con;
    PreparedStatement pstm;
    conectar Conexcion;
    ResultSet rs;
    
    public List listar(){
        List<Categoria> categoria = new ArrayList();
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from categoria");
            rs = pstm.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setDescripcion(rs.getString(3));
                c.setOfertas(rs.getInt(4));
                categoria.add(c);
            }

        } catch (SQLException e) {
            System.out.println("Error al listar las categoriasos " + e);
        }
       
        return categoria;
    }
    
    public boolean eliminar(String id){
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("delete from categoria where id = ?");
            pstm.setString(1, id);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminarr la categoria " + e);
        }
        return true;
    }
    
    public boolean crear(Categoria cat){
        try{
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("insert into categoria (id, nombre, descripcion, ofertas) Value(?,?,?,?)");
            pstm.setInt(1, cat.getId());
            System.out.println(cat.getId());
            pstm.setString(2, cat.getNombre());
            System.out.println(cat.getNombre());
            pstm.setString(3, cat.getDescripcion());
            System.out.println(cat.getDescripcion());
            pstm.setInt(4, cat.getOfertas());
            System.out.println(cat.getOfertas());
            pstm.executeUpdate();
            return true;
        }catch(Exception e){
             System.out.println("Error al crear los productos" + e);
             return false;
        }
    }
    
    public Categoria listarT(int idc){
        Categoria cat = new Categoria();
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from categoria where id= ?");
            pstm.setInt(1, idc);
            rs = pstm.executeQuery();
            while (rs.next()) {
                cat.setId(rs.getInt(1));
                cat.setNombre(rs.getString(2));
                cat.setDescripcion(rs.getString(3));
                cat.setOfertas(rs.getInt(4));
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos " + e);
        }
        return cat;
    }
    
        public List listarT(){
        List<Categoria> categoria = new ArrayList();
        try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from categoria");
            rs = pstm.executeQuery();
            while (rs.next()) {
                Categoria cat = new Categoria();
                cat.setId(rs.getInt(1));
                cat.setNombre(rs.getString(2));
                cat.setDescripcion(rs.getString(3));
                cat.setOfertas(rs.getInt(4));
               
                categoria.add(cat);
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos " + e);
        }
        return categoria;
    } 
        
        public void editar(Categoria cat){
        try{
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("update categoria set Nombre=?, Descripcion=?, ofertas=? where id = ?");
            pstm.setString(1, cat.getNombre());
            pstm.setString(2, cat.getDescripcion());
            pstm.setInt(3, cat.getOfertas());
            pstm.setInt(4, cat.getId());
            pstm.executeUpdate();
        }catch(Exception e){
             System.out.println("Error al editar los productos" + e);
        }
    }
}
