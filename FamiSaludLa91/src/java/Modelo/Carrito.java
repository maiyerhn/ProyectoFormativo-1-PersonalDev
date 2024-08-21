
package Modelo;

public class Carrito {
    private int idproducto;
    private String foto;
    private String nombre;
    private int cantidad;
    private int subTotal;
    private int preciocompra;

    public Carrito(int idproducto, String foto, String nombre, int cantidad, int subTotal, int preciocompra) {
        this.idproducto = idproducto;
        this.foto = foto;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.subTotal = subTotal;
        this.preciocompra = preciocompra;
    }

    public Carrito() {
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(int subTotal) {
        this.subTotal = subTotal;
    }

    public int getPreciocompra() {
        return preciocompra;
    }

    public void setPreciocompra(int preciocompra) {
        this.preciocompra = preciocompra;
    }

   

   
    
}


