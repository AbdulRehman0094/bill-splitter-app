import 'dart:math';
import 'package:flutter/material.dart';

class ModulusScreen extends StatefulWidget {
  const ModulusScreen({super.key});

  @override
  State<ModulusScreen> createState() => _ModulusScreenState();
}

class _ModulusScreenState extends State<ModulusScreen> {
  TextEditingController controlField = TextEditingController();
  int _number1 = Random().nextInt(100) + 1;
  int _number2 = Random().nextInt(10) + 1;
  bool showIncorrectMessage = false;

  void generateNewNumbers() {
    setState(() {
      _number1 = Random().nextInt(100) + 1;
      _number2 = Random().nextInt(10) + 1;
      showIncorrectMessage = false; // Reset the incorrect message
    });
  }

  void checkAnswer() {
    if (int.parse(controlField.text) == (_number1 % _number2)) {
      generateNewNumbers();
    } else {
      setState(() {
        showIncorrectMessage = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade700.withOpacity(0.8),
        title: const Text("Modulus Guesser"),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 800,
          child: Center(
            child: Card(
              color: Colors.amber.shade700.withOpacity(0.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Enter Modulus of these Numbers: $_number1 , $_number2',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Increase the font size as needed
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: controlField,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Colors.white, // Set the background color to white
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        labelText:
                            'Guess Answer', // Use labelText instead of label
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.yellowAccent, // Background color of the button
                    ),
                    onPressed: checkAnswer,
                    child: const Text(
                      "CHECK ANSWER",
                      style: TextStyle(color: Color.fromARGB(255, 0, 3, 5)),
                    ),
                  ),
                  if (showIncorrectMessage)
                    const Text(
                      "Ops! Incorrect Guess",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
