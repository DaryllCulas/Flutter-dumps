import 'package:flutter/material.dart';
import 'package:flutter_practice/scaffold_concepts.dart';

// function to trigger build process
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container Example"),
        ),
        body: Container(
          height: 200,
          width: double.infinity,
          // color: Colors.green,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(50),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
          ),
          transform: Matrix4.rotationZ(0.1),
          child: const Text(
            "Hello I am inside a container",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
