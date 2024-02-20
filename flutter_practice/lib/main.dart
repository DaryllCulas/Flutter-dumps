import 'package:flutter/material.dart';
import 'package:flutter_practice/sample_widgets/animated_alignment_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedAlignmentWidget(), // Change here
      ),
    );
  }
}
