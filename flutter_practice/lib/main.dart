import 'package:flutter/material.dart';
import 'package:flutter_practice/sample_widgets/animated_icon_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: AnimatedIconHere(), // Change here
      ),
    );
  }
}
