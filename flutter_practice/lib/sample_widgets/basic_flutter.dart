import 'package:flutter/material.dart';

class BasicFlutterSample extends StatelessWidget {
  const BasicFlutterSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample onleh'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: const Text('Green'),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: const Text('Red'),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text('Blue'),
            ),
          ],
        ),
      ),
    );
  }
}
