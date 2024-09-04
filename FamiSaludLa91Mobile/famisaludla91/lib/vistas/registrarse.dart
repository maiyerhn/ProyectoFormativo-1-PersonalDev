
import 'package:famisaludla91/main.dart';
import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Registrarse')),
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
                  Icons.person_add,
                  size: 50,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 30),
            _buildTextField(label: 'Nombre', hintText: 'Ingrese nombres'),
            _buildTextField(label: 'Apellido', hintText: 'Ingrese apellidos'),
            _buildTextField(label: 'Teléfono', hintText: 'Ingrese Teléfono'),
            _buildTextField(label: 'Dirección', hintText: 'Ingrese Dirección'),
            _buildTextField(label: 'Usuario (E-mail)', hintText: 'Ingrese Usuario'),
            _buildTextField(label: 'Contraseña', hintText: 'Ingrese Contraseña', obscureText: true),
            _buildTextField(label: 'Confirmar Contraseña', hintText: 'Confirmar Contraseña', obscureText: true),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'I agree to the ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Terms of Services',
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Registrase'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Cancelar'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Acción de inicio de sesión
                },
                child: Text(
                  'Have an Account? Sign In',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
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
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}