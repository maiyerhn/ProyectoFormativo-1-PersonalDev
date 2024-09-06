import 'package:famisaludla91/main.dart';
import 'package:famisaludla91/vistas/categoria.dart';

import 'package:famisaludla91/vistas/productos.dart';
import 'package:famisaludla91/vistas/usuarios.dart';
import 'package:flutter/material.dart';

class Proveedores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Center(child: Text('Famisalud la 91')),
       
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white, size: 30), // Ícono de avatar blanco
            onPressed: () {
              // Acción para perfil
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Acción de búsqueda
                  },
                  child: Text('Buscar'),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Acción para agregar proveedor
              },
              child: Text('Agregar'),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildProveedorItem(
                    id: 1,
                    nombre: 'Juan Sarmiento',
                    correo: 'juan@gmail.com',
                    telefono: '4683964648',
                    direccion: 'cr 6j #97-98',
                  ),
                  _buildProveedorItem(
                    id: 2,
                    nombre: 'Thomas Guette',
                    correo: 'tomy@gmail.com',
                    telefono: '947562264',
                    direccion: 'cr 6j #97-79',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProveedorItem({required int id, required String nombre, required String correo, required String telefono, required String direccion}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person, size: 30),
                SizedBox(width: 10),
                Text(
                  'Información de proveedores',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Acción de editar proveedor
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Acción de eliminar proveedor
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            _buildProveedorDetail('ID', id.toString()),
            _buildProveedorDetail('Nombre', nombre),
            _buildProveedorDetail('Correo', correo),
            _buildProveedorDetail('Teléfono', telefono),
            _buildProveedorDetail('Dirección', direccion),
          ],
        ),
      ),
    );
  }

  Widget _buildProveedorDetail(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
