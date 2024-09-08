
import 'package:famisaludla91/vistas/buscar.dart';
import 'package:famisaludla91/vistas/vistainicio.dart';
import 'package:flutter/material.dart';


class Carrito extends StatelessWidget {
  const Carrito({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Center(child: Text('Famisalud la 91')),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
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
            const CartItem(
              nombre: 'Amoxicilina',
              precio: 34500,
              cantidad: 1,
              foto: 'lib/imagenes/Amoxicilina.jpg',
            ),
            const Divider(),
            const CartItem(
              nombre: 'Vitamina C',
              precio: 9500,
              cantidad: 1,
              foto: 'lib/imagenes/VitaminaC.jpg',
            ),
            const Divider(),
            const Spacer(),
            const SummarySection(subtotal: 44000, envio: 5000),
            const Divider(),
            const TotalSection(total: 49000),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle payment
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Hacer Pago'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle continue shopping
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('seguir compra'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Buscar()),
              );
              break;
              
          }
        },
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
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.foto,
  });

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
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                '\$${precio.toString()}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            // Handle decrement quantity
          },
        ),
        Text(
          '$cantidad',
          style: const TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
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
    super.key,
    required this.subtotal,
    required this.envio,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('SubTotal:'),
            Text('\$${subtotal.toString()}'),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Envio:'),
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
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${total.toString()}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}