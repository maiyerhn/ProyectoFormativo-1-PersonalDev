import 'dart:convert';
import 'package:famisaludla91/main.dart';
import 'package:famisaludla91/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:famisaludla91/vistas/buscar.dart';
import 'package:famisaludla91/vistas/carrito.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Producto>> _productosFuture;

  @override
  void initState() {
    super.initState();
    _productosFuture = _fetchProductos();
  }

  Future<List<Producto>> _fetchProductos() async {
    try {
      final response = await http
          .get(Uri.parse('https://8c0b-45-238-146-4.ngrok-free.app/productos'));

      final contentType = response.headers['content-type'];
      if (contentType != null && contentType.contains('application/json')) {
        if (response.statusCode == 200) {
          List<dynamic> data = jsonDecode(response.body);

          if (data is List) {
            return data.map((item) {
              if (item is Map<String, dynamic>) {
                return Producto.fromJson(item);
              } else {
                throw Exception('Formato de datos inesperado');
              }
            }).toList();
          } else {
            throw Exception('Formato de datos inesperado');
          }
        } else {
          throw Exception('Error al cargar productos: ${response.statusCode}');
        }
      } else {
        throw Exception('Respuesta no es JSON: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error al cargar productos: $e');
    }
  }

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Carrito()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Thomas Marriaga'),
              accountEmail: Text('thomasmarriaga123@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 50.0,
                    color: Colors.blue,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.local_pharmacy, color: Colors.blue),
              title: const Text('Medicamentos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.face, color: Colors.blue),
              title: const Text('Belleza'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.child_care, color: Colors.blue),
              title: const Text('Cuidado al bebe'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.food_bank, color: Colors.blue),
              title: const Text('Alimentos y bebidas'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.blue),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.blue),
              title: const Text('Salir'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Inicio()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.white,
            child: Image.asset('lib/imagenes/medicamentos.jpg'),
          ),
          Expanded(
  child: FutureBuilder<List<Producto>>(
    future: _productosFuture,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return const Center(child: Text('Error al cargar productos'));
      } else {
        final productos = snapshot.data!;
        return LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = 2;
            if (constraints.maxWidth < 600) {
              crossAxisCount = 2;
            } else if (constraints.maxWidth < 900) {
              crossAxisCount = 3;
            } else {
              crossAxisCount = 4;
            }
            double childAspectRatio = (constraints.maxWidth / crossAxisCount) / 250;
            return GridView.builder(
              itemCount: productos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: childAspectRatio,
              ),
              itemBuilder: (context, index) {
                final producto = productos[index];
                return _buildProductCard(
                  context,
                  foto: producto.image,
                  nombre: producto.name,
                  descripcion: producto.description,
                );
              },
            );
          },
        );
      }
    },
  ),
),

        ],
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
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Buscar()),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context,
      {required String foto,
      required String nombre,
      required String descripcion}) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Image.network(foto,
              height: 100,
              fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text( 
                  nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  descripcion,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Agregar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Comprar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
