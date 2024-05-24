import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modulus_game.dart';
import 'home_page.dart';
import 'calculator.dart';
import '../notes_list.dart'; // Make sure this path is correct

class HomePageSelector extends StatelessWidget {
  const HomePageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Utils',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber.shade700.withOpacity(0.8),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 800,
          child: Card(
            color: Colors.amber.shade700.withOpacity(0.6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent,
                  ),
                  onPressed: () {
                    Get.to(const ModulusScreen());
                  },
                  child: const Text(
                    'Modulus Game',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent,
                  ),
                  onPressed: () {
                    Get.to(HomePage());
                  },
                  child: const Text(
                    'Bill Splitter',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent,
                  ),
                  onPressed: () {
                    Get.to(CalculatorPage());
                  },
                  child: const Text(
                    'Calculator',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent,
                  ),
                  onPressed: () {
                    Get.to(NoteListScreen());
                  },
                  child: const Text(
                    'Notes Keeper',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
