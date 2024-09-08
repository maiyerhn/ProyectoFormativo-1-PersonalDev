import 'package:flutter/material.dart';

class PagarPage extends StatelessWidget {
  const PagarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/factura');
          },
          child: const Text('Ver Factura'),
        ),
      ),
    );
  }
}
