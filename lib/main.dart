import 'package:flutter/material.dart';
import 'calculotor.dart';

void main(List<String> args) {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculotorAPP(),
      debugShowCheckedModeBanner: false,
    );
  }
}
