import 'package:famisaludla91/main.dart';
import 'package:famisaludla91/vistas/categoria.dart';
import 'package:famisaludla91/vistas/inventario.dart';

import 'package:famisaludla91/vistas/proveedores.dart';
import 'package:famisaludla91/vistas/usuarios.dart';


import 'package:flutter/material.dart';


class Productos extends StatelessWidget {
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
              // Acción del perfil
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción de agregar producto
                  },
                  child: Text('Agregar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción de filtrar por categoría
                  },
                  child: Text('Categoría'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildProductItem(
                    context,
                    imageUrl: 'lib/imagenes/VitaminaC.jpg',
                    title: 'Paracetamol',
                    price: '36',
                    category: 'Analgésico',
                    stock: '100',
                    description: 'Analgésico y antipirético para aliviar el dolor y la fiebre.',
                  ),
                  _buildProductItem(
                    context,
                    imageUrl: 'lib/imagenes/VitaminaC.jpg',
                    title: 'Amoxicilina',
                    price: '50',
                    category: 'Antibiótico',
                    stock: '12',
                    description: 'Antibiótico utilizado para tratar infecciones bacterianas.',
                  ),
                  _buildProductItem(
                    context,
                    imageUrl: 'lib/imagenes/VitaminaC.jpg',
                    title: 'Ibuprofeno',
                    price: '37',
                    category: 'Antiinflamatorio',
                    stock: '200',
                    description: 'Medicamento utilizado para reducir la fiebre y el dolor.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, {required String imageUrl, required String title, required String price, required String category, required String stock, required String description}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Precio: $price',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Categoría: $category',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Stock: $stock',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Acción de editar
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Acción de eliminar
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
