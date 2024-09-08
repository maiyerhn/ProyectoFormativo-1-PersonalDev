import 'package:famisaludla91/main.dart';
import 'package:famisaludla91/vistas/inventario.dart';

import 'package:famisaludla91/vistas/productos.dart';
import 'package:famisaludla91/vistas/proveedores.dart';
import 'package:famisaludla91/vistas/usuarios.dart';
import 'package:flutter/material.dart';

class CategoriasScreen extends StatelessWidget {
  const CategoriasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Center(child: Text('Famisalud la 91')),
     
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 30),
            onPressed: () {
              // Acción para perfil
            },
          ),
        ],
      ),
      drawer: _buildMainDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                // Acción para agregar categoría
              },
              child: const Text('Agregar'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Categorías',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildCategoriaItem(
                    id: 1,
                    nombre: 'medicamentos',
                    ofertas: 0,
                    descripcion: '',
                  ),
                  _buildCategoriaItem(
                    id: 2,
                    nombre: 'Estetica',
                    ofertas: 0,
                    descripcion: '',
                  ),
                  // Más categorías si es necesario
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainDrawer(BuildContext context) {
    return Drawer(
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
    );
  }

  Widget _buildCategoriaItem({
    required int id,
    required String nombre,
    required int ofertas,
    required String descripcion,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.category, size: 30),
                const SizedBox(width: 10),
                Text(
                  'ID: $id',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'Nombre: $nombre',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                Text(
                  'Ofertas: $ofertas',
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Acción de editar categoría
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Acción de eliminar categoría
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Descripción:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              descripcion,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

// Simula las otras pantallas
class ProductosScreen extends StatelessWidget {
  const ProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: const Center(child: Text('Pantalla de Productos')),
    );
  }
}

class PedidosScreen extends StatelessWidget {
  const PedidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pedidos')),
      body: const Center(child: Text('Pantalla de Pedidos')),
    );
  }
}

class ProveedoresScreen extends StatelessWidget {
  const ProveedoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Proveedores')),
      body: const Center(child: Text('Pantalla de Proveedores')),
    );
  }
}

class UsuariosScreen extends StatelessWidget {
  const UsuariosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuarios')),
      body: const Center(child: Text('Pantalla de Usuarios')),
    );
  }
}

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: const Center(child: Text('Pantalla de Inicio')),
    );
  }
}
