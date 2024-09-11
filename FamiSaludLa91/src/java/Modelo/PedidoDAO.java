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
import java.sql.SQLException;
import java.sql.Timestamp;
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
                int envio = rs.getInt("envio");
                Pedido pedido = new Pedido(id, idUsuario, total, fechaCreacion, estado, envio);
                pedidos.add(pedido);
            }
        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Cargar Los Productos " + ex);
        }

        return pedidos;
    }
    public List<Pedido> obtenerPedidosC() {
        List<Pedido> pedidos = new ArrayList<>();
        try {
            conectar conection = new conectar();
            Connection conexion = conection.crearconexion();
            if (conexion != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            String consulta = "SELECT * FROM Pedidos WHERE Estado IN ('Esperando', 'Enviado', 'Entregado')";
            PreparedStatement stm = conexion.prepareStatement(consulta);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int idUsuario = rs.getInt("idUsuario");
                Date fechaCreacion = rs.getDate("fechaCreacion");
                String estado = rs.getString("estado");
                int total = rs.getInt("total");
                int envio = rs.getInt("envio");
                Pedido pedido = new Pedido(id, idUsuario, total, fechaCreacion, estado, envio);
                pedidos.add(pedido);
            }
        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Cargar Los Productos " + ex);
        }

        return pedidos;
    }

    public boolean actualizarEstado(int id, String estado) {
        String sql = "UPDATE pedidos SET estado = ? WHERE id = ?";
        conectar conexion = new conectar();
        try (Connection conn = conexion.crearconexion();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, estado);
            stmt.setInt(2, id);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
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
    public int contarPedidos() {
        int cantidadPedidos = 0;

        try {
            conectar conection = new conectar();
            Connection conexion = conection.crearconexion();

            if (conexion != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
            }

            String consulta = "SELECT COUNT(*) AS total FROM pedidos";
            PreparedStatement stm = conexion.prepareStatement(consulta);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                cantidadPedidos = rs.getInt("total");
            }

        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Contar Los Pedidos: " + ex);
        }

        return cantidadPedidos;
    }

    public List<Pedido> pedidosSolicitados() {
        List<Pedido> pedidos = new ArrayList<>();
        try {
            conectar conection = new conectar();
            Connection conexion = conection.crearconexion();
            if (conexion != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            String consulta = "SELECT * FROM pedidos WHERE estado = 'Solicitado' AND envio = 0";
            PreparedStatement stm = conexion.prepareStatement(consulta);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int idUsuario = rs.getInt("idUsuario");
                Date fechaCreacion = rs.getDate("fechaCreacion");
                String estado = rs.getString("estado");
                int total = rs.getInt("total");
                int envio = rs.getInt("envio");
                Pedido pedido = new Pedido(id, idUsuario, total, fechaCreacion, estado, envio);
                pedidos.add(pedido);
            }
        } catch (Exception ex) {
            System.out.println("Hubo un Error Al Cargar Los Productos " + ex);
        }

        return pedidos;
    }

    public boolean buscarPedido(int idp) {
        Connection conexion = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean existe = false;
        try {

            conectar conection = new conectar();
            conexion = conection.crearconexion();

            if (conexion != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
                String sql = "SELECT IF(EXISTS ("
                        + "SELECT 1 "
                        + "FROM pedidos "
                        + "WHERE idUsuario = ? "
                        + "AND estado = 'CARRITO'"
                        + "), 'true', 'false') AS resultado";

                pstmt = conexion.prepareStatement(sql);
                pstmt.setInt(1, idp);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    String resultado = rs.getString("resultado");
                    existe = "true".equalsIgnoreCase(resultado);
                }
            }
        } catch (SQLException ex) {
            System.out.println("Hubo un error al buscar el pedido: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar los recursos: " + ex.getMessage());
            }
        }

        return existe;
    }

    public Pedido obtenerPedido(int idUsuario) {
        Connection conexion = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Pedido pedido = null;

        try {
            conectar conection = new conectar();
            conexion = conection.crearconexion();

            if (conexion != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
                String sql = "SELECT id, idUsuario, fechaCreacion, estado, total "
                        + "FROM pedidos "
                        + "WHERE idUsuario = ? AND estado = 'CARRITO' LIMIT 1";

                pstmt = conexion.prepareStatement(sql);
                pstmt.setInt(1, idUsuario);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    pedido = new Pedido();
                    pedido.setId(rs.getInt("id"));
                    pedido.setIdUsuario(rs.getInt("idUsuario"));
                    pedido.setFechaActual(rs.getDate("fechaCreacion"));
                    pedido.setEstado(rs.getString("estado"));
                    pedido.setTotal(rs.getInt("total"));
                }
            }
        } catch (SQLException ex) {
            System.out.println("Hubo un error al obtener el pedido: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar los recursos: " + ex.getMessage());
            }
        }

        return pedido;
    }

    public boolean buscarDetalle(int idPedido) {
        Connection conexion = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean existe = false;

        try {
            conectar conection = new conectar();
            conexion = conection.crearconexion();

            if (conexion != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
                String sql = "SELECT EXISTS ("
                        + "SELECT 1 "
                        + "FROM detallepedido "
                        + "WHERE idPedido = ?"
                        + ") AS resultado";

                pstmt = conexion.prepareStatement(sql);
                pstmt.setInt(1, idPedido); 
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    existe = rs.getInt("resultado") == 1;
                }
            }
        } catch (SQLException ex) {
            System.out.println("Hubo un error al buscar el detalle del pedido: " + ex.getMessage());
        } finally {
            
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar los recursos: " + ex.getMessage());
            }
        }

        return existe;
    }

    public List<DetallePedido> obtenerDetalle(int idPedido) {
        Connection conexion = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<DetallePedido> detalles = new ArrayList<>();

        try {
            conectar conection = new conectar();
            conexion = conection.crearconexion();

            if (conexion != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
                String sql = "SELECT * "
                        + "FROM detallepedido "
                        + "WHERE idPedido = ?";

                pstmt = conexion.prepareStatement(sql);
                pstmt.setInt(1, idPedido);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    DetallePedido detallePedido = new DetallePedido();
                    detallePedido.setId(rs.getInt("id"));
                    detallePedido.setIdProducto(rs.getInt("idProducto"));
                    detallePedido.setIdPedido(rs.getInt("idPedido"));
                    detallePedido.setCantidad(rs.getInt("cantidad"));
                    detallePedido.setTotal(rs.getInt("total"));

                    detalles.add(detallePedido);
                }
            }
        } catch (SQLException ex) {
            System.out.println("Hubo un error al obtener los detalles del pedido: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar los recursos: " + ex.getMessage());
            }
        }

        return detalles;
    }
    
    public boolean crearPedido(int idUsuario, String estado, double total) {
        Connection conexion = null;
        PreparedStatement pstmt = null;
        boolean exito = false;

        try {
            
            conectar conection = new conectar();
            conexion = conection.crearconexion();

            if (conexion != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
                String sql = "INSERT INTO pedidos (idUsuario, fechaCreacion, estado, total) "
                        + "VALUES (?, ?, ?, ?)";

                pstmt = conexion.prepareStatement(sql);
                pstmt.setInt(1, idUsuario); 
                pstmt.setDate(2, new Date(System.currentTimeMillis())); 
                pstmt.setString(3, estado); 
                pstmt.setDouble(4, total); 
                
                int filasAfectadas = pstmt.executeUpdate();
                
                exito = filasAfectadas > 0;
            }
        } catch (SQLException ex) {
            System.out.println("Hubo un error al crear el pedido: " + ex.getMessage());
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar los recursos: " + ex.getMessage());
            }
        }

        return exito;
    }
    
    public boolean crearDetalle(int idPedido, int idProducto, int cantidad, double total) {
    Connection conexion = null;
    PreparedStatement pstmt = null;
    boolean exito = false;

    try {
        conectar conection = new conectar();
        conexion = conection.crearconexion();

        if (conexion != null) {
            System.out.println("Se ha establecido una conexión con la base de datos");
            String sql = "INSERT INTO detallepedido (idPedido, idProducto, cantidad, total) VALUES (?, ?, ?, ?)";

            pstmt = conexion.prepareStatement(sql);
            pstmt.setInt(1, idPedido); 
            pstmt.setInt(2, idProducto); 
            pstmt.setInt(3, cantidad); 
            pstmt.setDouble(4, total); 
            
            int filasAfectadas = pstmt.executeUpdate();
            
            exito = filasAfectadas > 0;
        }
    } catch (SQLException ex) {
        System.out.println("Hubo un error al crear el detalle del pedido: " + ex.getMessage());
    } finally {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        } catch (SQLException ex) {
            System.out.println("Error al cerrar los recursos: " + ex.getMessage());
        }
    }

        return exito;
    }
    
    public boolean actualizarDetalle(int idDetalle, int cantidad, double total) {
    Connection conexion = null;
    PreparedStatement pstmt = null;
    boolean exito = false;

    try {
        conectar conection = new conectar();
        conexion = conection.crearconexion();

        if (conexion != null) {
            System.out.println("Se ha establecido una conexión con la base de datos");
            String sql = "UPDATE detallePedido SET cantidad = ?, total = ? WHERE id = ?";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setInt(1, cantidad); 
            pstmt.setDouble(2, total); 
            pstmt.setInt(3, idDetalle);
            int filasAfectadas = pstmt.executeUpdate();
            exito = filasAfectadas > 0;
        }
    } catch (SQLException ex) {
        System.out.println("Hubo un error al actualizar el detalle del pedido: " + ex.getMessage());
    } finally {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        } catch (SQLException ex) {
            System.out.println("Error al cerrar los recursos: " + ex.getMessage());
        }
    }

    return exito;
}

    public boolean actualizarCantidad(int idDetalle, int cantidad, int total) {
        Connection conexion = null;
        PreparedStatement pstmt = null;
        boolean exito = false;

        try {
            conectar conection = new conectar();
            conexion = conection.crearconexion();

            if (conexion != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
                String sql = "UPDATE detallePedido SET cantidad = ?, total = ? WHERE id = ?";
                pstmt = conexion.prepareStatement(sql);
                pstmt.setInt(1, cantidad);
                pstmt.setInt(2, total);
                pstmt.setInt(3, idDetalle);
                int filasAfectadas = pstmt.executeUpdate();
                exito = filasAfectadas > 0;
            }
        } catch (SQLException ex) {
            System.out.println("Hubo un error al actualizar el detalle del pedido: " + ex.getMessage());
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar los recursos: " + ex.getMessage());
            }
        }

        return exito;
    }
    
    public boolean eliminarDetalle(int idDetalle) {
        Connection conexion = null;
        PreparedStatement pstmt = null;
        boolean resultado = false;

        try {
            conectar conection = new conectar();
            conexion = conection.crearconexion();
            
            System.out.println("Se ha establecido una conexión con la base de datos");
              
            String sql = "DELETE FROM detallepedido WHERE id = ?";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setInt(1, idDetalle);

           
            int filasAfectadas = pstmt.executeUpdate();
            resultado = (filasAfectadas > 0);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return resultado;
    }
    public void agregarTotal(int id, int total) {
    Connection conexion = null;
    PreparedStatement pstmt = null;

    try {
        conectar conection = new conectar();
        conexion = conection.crearconexion();
        System.out.println("Se ha establecido una conexión con la base de datos para editar total");

        String sql = "UPDATE pedidos SET total = ? WHERE id = ?";
        pstmt = conexion.prepareStatement(sql);
        pstmt.setInt(1, total);
        pstmt.setInt(2, id);

        int filasAfectadas = pstmt.executeUpdate(); 
        if (filasAfectadas > 0) {
            System.out.println("El total se actualizó correctamente.");
        } else {
            System.out.println("No se encontró el pedido con el ID especificado.");
        }
    } catch (Exception ex) {
        System.out.println("Error al editar el total: " + ex.getMessage());
    } finally {
       
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
    
   public DetallePedido obtenerDetalles(int idDetalle) {
    Connection conexion = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DetallePedido detallePedido = null; 

    try {
        conectar conection = new conectar();
        conexion = conection.crearconexion();

        if (conexion != null) {
            System.out.println("Se ha establecido una conexión con la base de datos");
            String sql = "SELECT * FROM detallepedido WHERE id = ?";

            pstmt = conexion.prepareStatement(sql);
            pstmt.setInt(1, idDetalle);
            rs = pstmt.executeQuery();

            if (rs.next()) { 
                detallePedido = new DetallePedido();
                detallePedido.setId(rs.getInt("id"));
                detallePedido.setIdProducto(rs.getInt("idProducto"));
                detallePedido.setIdPedido(rs.getInt("idPedido"));
                detallePedido.setCantidad(rs.getInt("cantidad"));
                detallePedido.setTotal(rs.getInt("total"));
            }
        }
    } catch (SQLException ex) {
        System.out.println("Hubo un error al obtener los detalles del pedido: " + ex.getMessage());
    } finally {
        
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        } catch (SQLException ex) {
            System.out.println("Error al cerrar los recursos: " + ex.getMessage());
        }
    }

    return detallePedido; 
}
   
  public List<Pedido> pedidoUser(int idUsuario) {
    List<Pedido> pedidos = new ArrayList<>();
    String sql = "SELECT * FROM pedidos WHERE idUsuario = ? AND (estado = 'Esperando' OR estado = 'Enviado' OR estado = 'Entregado')";

    try (Connection conexion = new conectar().crearconexion();
         PreparedStatement pstmt = conexion.prepareStatement(sql)) {
        
        pstmt.setInt(1, idUsuario);
        try (ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Pedido p = new Pedido();
                p.setId(rs.getInt("id"));
                p.setIdUsuario(rs.getInt("idUsuario"));
                p.setFechaActual(rs.getDate("fechaCreacion"));
                p.setEstado(rs.getString("estado"));
                p.setTotal(rs.getInt("total"));
                
                pedidos.add(p);
            }
        }
        
    } catch (SQLException ex) {
        System.err.println("Hubo un error al obtener los detalles del pedido: " + ex.getMessage());
    }

    return pedidos;
}
  public void cambiarEstadoSolicitado(int idPedido){
      Connection conexion = null;
    PreparedStatement pstmt = null;

    try {
        conectar conection = new conectar();
        conexion = conection.crearconexion();
        System.out.println("Se ha establecido una conexión con la base de datos para editar total");

        String sql = "UPDATE pedidos SET estado = 'Solicitado' WHERE id = ?";
        pstmt = conexion.prepareStatement(sql);
        pstmt.setInt(1, idPedido);

        int filasAfectadas = pstmt.executeUpdate(); 
        if (filasAfectadas > 0) {
            System.out.println("El total se actualizó correctamente.");
        } else {
            System.out.println("No se encontró el pedido con el ID especificado.");
        }
    } catch (Exception ex) {
        System.out.println("Error al editar el total: " + ex.getMessage());
    } 
        
  }
  public void cambiarEstado(int idPedido){
      Connection conexion = null;
    PreparedStatement pstmt = null;

    try {
        conectar conection = new conectar();
        conexion = conection.crearconexion();
        System.out.println("Se ha establecido una conexión con la base de datos para editar total");

        String sql = "UPDATE pedidos SET estado = 'Esperando' WHERE id = ?";
        pstmt = conexion.prepareStatement(sql);
        pstmt.setInt(1, idPedido);

        int filasAfectadas = pstmt.executeUpdate(); 
        if (filasAfectadas > 0) {
            System.out.println("El total se actualizó correctamente.");
        } else {
            System.out.println("No se encontró el pedido con el ID especificado.");
        }
    } catch (Exception ex) {
        System.out.println("Error al editar el total: " + ex.getMessage());
    } 
        
  }
  
  public void actualizarEnvio(int envio, int id){
    Connection conexion = null;
    PreparedStatement pstmt = null;

    try {
        conectar conection = new conectar();
        conexion = conection.crearconexion();
        System.out.println("Se ha establecido una conexión con la base de datos para editar total");

        String sql = "UPDATE pedidos SET envio = ? WHERE id = ?";
        pstmt = conexion.prepareStatement(sql);
        pstmt.setInt(1, envio);
        pstmt.setInt(2, id);

        int filasAfectadas = pstmt.executeUpdate(); 
        if (filasAfectadas > 0) {
            System.out.println("El envio se actualizó correctamente.");
        } else {
            System.out.println("No se encontró el pedido con el ID especificado.");
        }
    } catch (Exception ex) {
        System.out.println("Error al editar el envio: " + ex.getMessage());
    } 
  }
  
  public List pedidoProsesado(int id){
    Connection conexion = null;
    PreparedStatement pstmt = null;
    List<Pedido> pedidos = new ArrayList<>();
    try {
        conectar conection = new conectar();
        conexion = conection.crearconexion();
         String sql = "SELECT * FROM pedidos WHERE idUsuario = ? AND estado = 'Solicitado' AND envio > 0";
         pstmt = conexion.prepareStatement(sql);
        pstmt.setInt(1, id);
        try (ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Pedido p = new Pedido();
                p.setId(rs.getInt("id"));
                p.setIdUsuario(rs.getInt("idUsuario"));
                p.setFechaActual(rs.getDate("fechaCreacion"));
                p.setEstado(rs.getString("estado"));
                p.setTotal(rs.getInt("total"));
                p.setEnvio(rs.getInt("envio"));
                
                pedidos.add(p);
            }
        }
        
    } catch (SQLException ex) {
        System.err.println("Hubo un error al obtener los detalles del pedido: " + ex.getMessage());
    }

    return pedidos;
  }
  
  public void eliminarPedido(int id){
       try {
            Conexcion = new conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("delete from pedidos where id = ?");
            pstm.setInt(1, id);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar el Producto " + e);
        }
  }
  
  public Pedido listarpedido(int id){
      Pedido pe = new Pedido();
      try{
          Conexcion = new conectar();
          Connection con = Conexcion.crearconexion();
          if (con != null){
              System.out.println("se ha establecido una conexion con la base de datos");
          }
          pstm = con.prepareStatement("select * from pedidos where id = ?");
          pstm.setInt(1, id);
          ResultSet rs = pstm.executeQuery();
          while (rs.next()) {
                
                pe.setId(rs.getInt("id"));
                pe.setIdUsuario(rs.getInt("idUsuario"));
                pe.setFechaActual(rs.getDate("fechaCreacion"));
                pe.setEstado(rs.getString("estado"));
                pe.setTotal(rs.getInt("total"));
                pe.setEnvio(rs.getInt("envio"));
                
            }
      }catch(Exception e){
          System.out.println("Error al listar los pedido" + e);
      }
      return pe;
  }

  
}
