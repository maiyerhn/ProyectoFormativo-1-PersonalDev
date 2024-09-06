import 'package:flutter/material.dart';

class PagarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/factura');
          },
          child: Text('Ver Factura'),
        ),
      ),
    );
  }
}
