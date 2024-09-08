import 'package:famisaludla91/main.dart';
import 'package:famisaludla91/vistas/inventario.dart';

import 'package:famisaludla91/vistas/productos.dart';
import 'package:famisaludla91/vistas/proveedores.dart';
import 'package:famisaludla91/vistas/usuarios.dart';
import 'package:flutter/material.dart';

class CategoriasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Center(child: Text('Famisalud la 91')),
     
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, size: 30),
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
                // Acción para agregar categoría
              },
              child: Text('Agregar'),
            ),
            SizedBox(height: 10),
            Text(
              'Categorías',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
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

  Widget _buildCategoriaItem({
    required int id,
    required String nombre,
    required int ofertas,
    required String descripcion,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.category, size: 30),
                SizedBox(width: 10),
                Text(
                  'ID: $id',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Nombre: $nombre',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 20),
                Text(
                  'Ofertas: $ofertas',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Acción de editar categoría
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Acción de eliminar categoría
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Descripción:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              descripcion,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

// Simula las otras pantallas
class ProductosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Productos')),
      body: Center(child: Text('Pantalla de Productos')),
    );
  }
}

class PedidosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pedidos')),
      body: Center(child: Text('Pantalla de Pedidos')),
    );
  }
}

class ProveedoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Proveedores')),
      body: Center(child: Text('Pantalla de Proveedores')),
    );
  }
}

class UsuariosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuarios')),
      body: Center(child: Text('Pantalla de Usuarios')),
    );
  }
}

class InicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(child: Text('Pantalla de Inicio')),
    );
  }
}
