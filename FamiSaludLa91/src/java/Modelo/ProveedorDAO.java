package Modelo;

import Configuracion.conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class ProveedorDAO {
    Connection con;
    PreparedStatement pstm;
    conectar Conexcion;
    ResultSet rs;
    
    public List<Proveedor> obtenerproveedor(){
        List<Proveedor> proveedor = new ArrayList();
        try {
            conectar conection = new conectar();
            con  = conection.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            
            pstm = con.prepareStatement("Select * from proveedores");
            rs = pstm.executeQuery();
            while (rs.next()) {
                Proveedor p = new Proveedor();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setCorreo(rs.getString(3));
                p.setTelefono(rs.getString(4));
                p.setDireccion(rs.getString(5));
                proveedor.add(p);
                
            }

        } catch (Exception e) {
            System.out.println("Error al listar los proveedor " + e);
        }
        return proveedor;
    }
    
    public boolean crear(Proveedor prov){
        try{
            conectar conection = new conectar();
            con  = conection.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("insert into proveedores (id, nombre, correo, telefono, direccion) Value(?,?,?,?,?)");
            pstm.setInt(1, prov.getId());
            System.out.println(prov.getId());
            pstm.setString(2, prov.getNombre());
            System.out.println(prov.getNombre());
            pstm.setString(3, prov.getCorreo());
            System.out.println(prov.getCorreo());
            pstm.setString(4, prov.getTelefono());
            System.out.println(prov.getTelefono());
            pstm.setString(5, prov.getDireccion());
            System.out.println(prov.getDireccion());
            pstm.executeUpdate();
            return true;
        }catch(Exception e){
             System.out.println("Error al crear el proveedor" + e);
             return false;
        }
    }
    
    
    
    public Proveedor listarT(int idpr){
        Proveedor proved = new Proveedor();
        try {
            conectar conection = new conectar();
            con  = conection.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from proveedores where id= ?");
            pstm.setInt(1, idpr);
            rs = pstm.executeQuery();
            while (rs.next()) {
                proved.setId(rs.getInt(1));
                proved.setNombre(rs.getString(2));
                proved.setCorreo(rs.getString(3));
                proved.setTelefono(rs.getString(4));
                proved.setDireccion(rs.getString(5));
            }

        } catch (Exception e) {
            System.out.println("Error al listar los proveedores " + e);
        }
        return proved;
    }
    
    public void editar(Proveedor prov){
        try{
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("update proveedores set nombre=?, correo=?,  telefono=?, direccion=? where id = ?");          
            pstm.setString(1, prov.getNombre());
            pstm.setString(2, prov.getCorreo());
            pstm.setString(3, prov.getTelefono());
            pstm.setString(4, prov.getDireccion());
            pstm.setInt(5, prov.getId());
            pstm.executeUpdate();
        }catch(Exception e){
             System.out.println("Error al editar el proveedor" + e);
        }
    }
}