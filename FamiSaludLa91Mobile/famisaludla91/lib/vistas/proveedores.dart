import 'package:famisaludla91/main.dart';
import 'package:famisaludla91/vistas/categoria.dart';
import 'package:famisaludla91/vistas/inventario.dart';

import 'package:famisaludla91/vistas/productos.dart';
import 'package:famisaludla91/vistas/usuarios.dart';
import 'package:flutter/material.dart';

class Proveedores extends StatelessWidget {
  const Proveedores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Center(child: Text('Famisalud la 91')),
       
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white, size: 30), // Ícono de avatar blanco
            onPressed: () {
              // Acción para perfil
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
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
                Navigator.pop(context, MaterialPageRoute(builder: (context) => const Inventario()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.production_quantity_limits, color: Colors.blue),
              title: const Text('Productos'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Productos()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.blue),
              title: const Text('Pedidos'),
              onTap: () {
               
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_shipping, color: Colors.blue),
              title: const Text('Proveedores'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Proveedores()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.category, color: Colors.blue),
              title: const Text('Categorias'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoriasScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.people, color: Colors.blue),
              title: const Text('Usuarios'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Usuarios()));
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
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Acción de búsqueda
                  },
                  child: const Text('Buscar'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Acción para agregar proveedor
              },
              child: const Text('Agregar'),
            ),
            const SizedBox(height: 10),
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
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, size: 30),
                const SizedBox(width: 10),
                const Text(
                  'Información de proveedores',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Acción de editar proveedor
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Acción de eliminar proveedor
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
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
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
