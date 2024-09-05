import 'package:famisaludla91/main.dart';
import 'package:famisaludla91/vistas/carrito.dart';
import 'package:famisaludla91/vistas/vistainicio.dart';
import 'package:flutter/material.dart';

class Buscar extends StatelessWidget {
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

            // agrgar al proyecto
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
      body: Padding( padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar Producos..',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
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
          ],
        ),
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

        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
          }
        },
      ),
    );
  }
}


