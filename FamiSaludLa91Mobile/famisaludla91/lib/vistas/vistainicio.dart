
import 'package:famisaludla91/vistas/carrito.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Center(child: Text('Famisalud la 91')),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
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
            UserAccountsDrawerHeader(
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
              leading: Icon(Icons.local_pharmacy, color: Colors.blue),
              title: Text('Medicamentos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.face, color: Colors.blue),
              title: Text('Belleza'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.child_care, color: Colors.blue),
              title: Text('Cuidado al bebe'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.food_bank, color: Colors.blue),
              title: Text('Alimentos y bebidas'),
              onTap: () {
                Navigator.pop(context);
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
              padding: EdgeInsets.all(8.0),
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
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                descripcion,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Column(  // Cambiado de Row a Column
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'Agregar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 8), // Espacio entre los botones
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
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