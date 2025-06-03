import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorAPP extends StatefulWidget {
  @override
  State<CalculatorAPP> createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorAPP> {
  String input = '';
  String result = '';

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
        result = '';
      } else if (value == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(input);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          result = eval.toString();
        } catch (e) {
          result = 'Error';
        }
      } else {
        input += value;
      }
    });
  }

  Widget buildButton(String value, {Color color = Colors.blue}) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: () => buttonPressed(value),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(value, style: const TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(input, style: const TextStyle(fontSize: 32)),
          Text(result, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ...['7', '8', '9', '/',
                  '4', '5', '6', '*',
                  '1', '2', '3', '-',
                  '0', '.', '=', '+',
                  'C'].map((e) => buildButton(e, color: _isOperator(e) ? Colors.orange : Colors.blue))
            ],
          ),
        ],
      ),
    );
  }

  bool _isOperator(String value) {
    return ['/', '*', '-', '+', '='].contains(value);
  }
}