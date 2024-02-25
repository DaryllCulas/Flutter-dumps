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
            _section('This is green', Colors.green),
            _section('This is red', Colors.red),
            _section('This is blue', Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _section(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
      ),
      child: Text(title),
    );
  }
}
