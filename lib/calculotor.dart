import 'package:flutter/material.dart';

class CalculotorAPP extends StatefulWidget {
  const CalculotorAPP({super.key});

  @override
  State<CalculotorAPP> createState() => _CalculotorAPPState();
}

class _CalculotorAPPState extends State<CalculotorAPP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: Text('Calculator App'),
      ),
    );
  }
}