import 'package:flutter/material.dart';

void main() {
  runApp(FamiSaludLa91());
}

class FamiSaludLa91 extends StatelessWidget {
  const FamiSaludLa91({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FamiSaludla91',
      home: Center(child: CircularProgressIndicator()),
    );
  }

  

}