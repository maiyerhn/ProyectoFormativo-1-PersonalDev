
import 'package:famisaludla91/vistas/vistainicio.dart';
import 'package:flutter/material.dart';


class Carrito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Center(child: Text('Famisalud la 91')),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CartItem(
              nombre: 'Amoxicilina',
              precio: 34500,
              cantidad: 1,
              foto: 'lib/imagenes/Amoxicilina.jpg',
            ),
            Divider(),
            CartItem(
              nombre: 'Vitamina C',
              precio: 9500,
              cantidad: 1,
              foto: 'lib/imagenes/VitaminaC.jpg',
            ),
            Divider(),
            Spacer(),
            SummarySection(subtotal: 44000, envio: 5000),
            Divider(),
            TotalSection(total: 49000),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle payment
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Hacer Pago'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle continue shopping
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('seguir compra'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String nombre;
  final int precio;
  final int cantidad;
  final String foto;

  const CartItem({
    Key? key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.foto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          foto,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '\$${precio.toString()}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            // Handle decrement quantity
          },
        ),
        Text(
          '$cantidad',
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: () {
            // Handle increment quantity
          },
        ),
      ],
    );
  }
}

class SummarySection extends StatelessWidget {
  final int subtotal;
  final int envio;

  const SummarySection({
    Key? key,
    required this.subtotal,
    required this.envio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal:'),
            Text('\$${subtotal.toString()}'),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Envio:'),
            Text('\$${envio.toString()}'),
          ],
        ),
      ],
    );
  }
}

class TotalSection extends StatelessWidget {
  final int total;

  const TotalSection({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${total.toString()}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}