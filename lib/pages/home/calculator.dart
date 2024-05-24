import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  String result = '';

  void performOperation(String operation) {
    double firstNumber = double.tryParse(firstNumberController.text) ?? 0;
    double secondNumber = double.tryParse(secondNumberController.text) ?? 0;
    double output = 0;

    setState(() {
      switch (operation) {
        case 'Add':
          output = firstNumber + secondNumber;
          break;
        case 'Subtract':
          output = firstNumber - secondNumber;
          break;
        case 'Divide':
          output = firstNumber / secondNumber;
          break;
        case 'Multiply':
          output = firstNumber * secondNumber;
          break;
      }
      result = 'Result: $output';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: firstNumberController,
              decoration:
                  const InputDecoration(labelText: 'Enter first number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: secondNumberController,
              decoration:
                  const InputDecoration(labelText: 'Enter second number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              width: 800,
              child: Card(
                color: Colors.amber.shade700.withOpacity(0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => performOperation('Add'),
                      child: const Text('Add'),
                    ),
                    ElevatedButton(
                      onPressed: () => performOperation('Subtract'),
                      child: const Text('Subtract'),
                    ),
                    ElevatedButton(
                      onPressed: () => performOperation('Divide'),
                      child: const Text('Divide'),
                    ),
                    ElevatedButton(
                      onPressed: () => performOperation('Multiply'),
                      child: const Text('Multiply'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(result,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNumberController.dispose();
    secondNumberController.dispose();
    super.dispose();
  }
}
