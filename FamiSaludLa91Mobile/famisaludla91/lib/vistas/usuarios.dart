import 'package:famisaludla91/main.dart';
import 'package:famisaludla91/vistas/categoria.dart';
import 'package:famisaludla91/vistas/inventario.dart';

import 'package:famisaludla91/vistas/proveedores.dart';
import 'package:flutter/material.dart';
import 'package:famisaludla91/vistas/productos.dart';

class Usuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Usuarios'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Acción para el botón de búsqueda
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Acción para el botón de agregar
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
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
              leading: Icon(Icons.inventory, color: Colors.blue),
              title: Text('Inventario'),
              onTap: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) => Inventario()));
              },
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits, color: Colors.blue),
              title: Text('Productos'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Productos()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.blue),
              title: Text('Pedidos'),
              onTap: () {
               
              },
            ),
            ListTile(
              leading: Icon(Icons.local_shipping, color: Colors.blue),
              title: Text('Proveedores'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Proveedores()));
              },
            ),
            ListTile(
              leading: Icon(Icons.category, color: Colors.blue),
              title: Text('Categorias'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriasScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.blue),
              title: Text('Usuarios'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Usuarios()));
              },
            ),
            Divider(),
            Spacer(),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.blue),
              title: Text('Salir'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()));
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: 10, // Número de usuarios
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'Usuario $index',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  'Detalles del usuario',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // Acción para editar usuario
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Acción para eliminar usuario
                      },
                    ),
                  ],
                ),
                onTap: () {
                  // Navegar a la pantalla de productos cuando se toca un usuario
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Productos()),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
