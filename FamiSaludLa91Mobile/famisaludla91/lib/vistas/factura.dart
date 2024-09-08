import 'package:famisaludla91/main.dart';
import 'package:famisaludla91/vistas/categoria.dart';
import 'package:famisaludla91/vistas/inventario.dart';

import 'package:famisaludla91/vistas/productos.dart';
import 'package:famisaludla91/vistas/proveedores.dart';
import 'package:famisaludla91/vistas/usuarios.dart';
import 'package:flutter/material.dart';


class FacturaPage extends StatelessWidget {
  const FacturaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'Famisalud la 91',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              // Acción al presionar el icono de usuario
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flecha de salir y ID en la misma fila
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.blue, size: 30.0),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Text('ID: 1', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Fecha: 13/12/2023', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Nombre: Maiyer Hernandez', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Dirección: Kar 21 #21-52'),
            const Text('Teléfono: 8354274239872'),
            const SizedBox(height: 16),
            Table(
              border: TableBorder.all(color: Colors.grey),
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                  ),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Cantidad', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Precio unitario', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Mieltertos'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('3'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('\$2.500'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('\$7.500'),
                  ),
                ]),
                const TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Noraver Gripa'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('3'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('\$2.500'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('\$7.500'),
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total a Pagar: \$15.000', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Hora: 10:50 AM', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
      // Drawer
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
            leading: const Icon(Icons.inventory, color: Colors.blue),
            title: const Text('Inventario'),
            onTap: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) => Inventario()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.production_quantity_limits, color: Colors.blue),
            title: const Text('Productos'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Productos()));
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart, color: Colors.blue),
            title: const Text('Pedidos'),
            onTap: () {
             
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_shipping, color: Colors.blue),
            title: const Text('Proveedores'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Proveedores()));
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.category, color: Colors.blue),
            title: const Text('Categorias'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriasScreen()));
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.blue),
            title: const Text('Usuarios'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Usuarios()));
              //Navigator.pop(context);
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
      // Bottom Navigation Bar
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
        onTap: (int index) {
          if (index == 0) {
            // Navegar a la pantalla de inicio
            Navigator.pushNamed(context, '/inicio');
          } else if (index == 1) {
            // Navegar a la pantalla de buscar
            Navigator.pushNamed(context, '/buscar');
          }
        },
      ),
    );
  }
}
