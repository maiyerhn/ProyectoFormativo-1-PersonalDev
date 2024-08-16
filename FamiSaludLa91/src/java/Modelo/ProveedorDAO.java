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
}