import 'package:famisaludla91/main.dart';
import 'package:famisaludla91/vistas/categoria.dart';

import 'package:famisaludla91/vistas/productos.dart';
import 'package:famisaludla91/vistas/proveedores.dart';
import 'package:famisaludla91/vistas/usuarios.dart';
import 'package:flutter/material.dart';

class Inicioad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Center(child: Text('Famisalud la 91')),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // muestra el model de abajo
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return _buildModalDrawer(context);
                },
              );
            },
          ),
        ],
      ),
      drawer: _buildMainDrawer(context),
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

        selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Inicioad()),
              );
              break;
            /*case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Buscar()),
              );
              break;
              */
          }
        },
      ),
    );
  }

  // modal menu
  Widget _buildMainDrawer(BuildContext context) {
    return Drawer(
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
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.production_quantity_limits, color: Colors.blue),
            title: Text('Productos'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Productos()));
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: Colors.blue),
            title: Text('Pedidos'),
            onTap: () {
          
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_shipping, color: Colors.blue),
            title: Text('Proveedores'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Proveedores()));
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.category, color: Colors.blue),
            title: Text('Categorias'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriasScreen()));
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('Usuarios'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Usuarios()));
              //Navigator.pop(context);
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
    );
  }

  // Modal 
  Widget _buildModalDrawer(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.account_circle, color: Colors.blue),
            title: Text('Usuario'),
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
    );
  }
}
