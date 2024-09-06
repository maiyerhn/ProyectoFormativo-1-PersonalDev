
import 'package:famisaludla91/vistas/registrarse.dart';
import 'package:famisaludla91/vistas/vistainicio.dart';
import 'package:famisaludla91/vistas/vistainicioadm.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Inicio')),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.black54,
                ),
              ),
            ),

            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Text(
                    'Iniciar Sesion',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  SizedBox(height: 8),
                  Text(
                    '¡Hola! Me alegro de volver a verte..',
                    style: TextStyle(color: Colors.grey), 
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildTextField(label: 'Usuario (E-mail)', hintText: 'example@email.com'),
            _buildTextField(label: 'Contraseña', hintText: 'Ingrese Contraseña', obscureText: true),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white
                    ),
                    child: Text('Ingresar'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(  
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white
                    ),
                    child: Text('Registrarse'),
                  ),
                ),
              ],
            ),
            /*ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Ingresar'),
            ),*/
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // ingresar a la vista de administrador
                Navigator.push(context, MaterialPageRoute(builder: (context) => Inicioad()));
              },
              child: Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String hintText, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          suffixIcon: obscureText ? Icon(Icons.visibility) : null,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}