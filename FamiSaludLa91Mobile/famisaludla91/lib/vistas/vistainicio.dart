
import 'package:famisaludla91/main.dart';
import 'package:famisaludla91/vistas/buscar.dart';
import 'package:famisaludla91/vistas/carrito.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              // Acción del carrito
              Navigator.push(context, MaterialPageRoute(builder: (context) => Carrito()));
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
                child: Center(child: 
                  Icon(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Inicio()));
              },
            ),
          ],
        ),
      ),
      /*drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Medicamentos'),
              onTap: () {
                
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Belleza'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Cuidado al bebe'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Alimentos y bebidas'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),*/
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.white,
            child: Image.asset('lib/imagenes/medicamentos.jpg'),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8.0),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: [
                _buildProductCard(
                  context,
                  foto: 'lib/imagenes/VitaminaC.jpg',
                  nombre: 'Vitamina C',
                  descripcion: 'Analgésico y antiinflamatorio',
                ),
                _buildProductCard(
                  context,
                  foto: 'lib/imagenes/Amoxicilina.jpg',
                  nombre: 'Amoxicilina',
                  descripcion: 'Antibiótico para infecciones',
                ),
              ],
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

  Widget _buildProductCard(BuildContext context, {
    required String foto,
    required String nombre,
    required String descripcion}) {
    return Card(
    elevation: 4.0,
    child: Column(
      children: [
        Image.network(foto, height: 100, fit: BoxFit.cover),
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
              Column(  // Cambiado de Row a Column
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
                  const SizedBox(height: 8), // Espacio entre los botones
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