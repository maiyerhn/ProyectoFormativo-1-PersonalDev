package Modelo;

import Configuracion.conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
            pstm = con.prepareStatement("insert into proveedores (id, nombre, correo, telefono, direccion, id_productos) Value(?,?,?,?,?,?)");
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
            pstm.setInt(6, prov.getIdprod());
            System.out.println(prov.getIdprod());
            pstm.executeUpdate();
            return true;
        }catch(Exception e){
             System.out.println("Error al crear el proveedor" + e);
             return false;
        }
    }
}