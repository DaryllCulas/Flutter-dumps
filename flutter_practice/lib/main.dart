// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_practice/sample_widgets/building_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'One piece call card';
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 182, 212, 228)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.green,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(
                image: 'images/eggheadArc.jpg',
              ),
              TitleSection(
                name: 'Mexico',
                location: 'Pampanga',
              ),
              ButtonSection(),
              TextSection(
                description:
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                    'Bernese Alps. Situated 1,578 meters above sea level, it '
                    'is one of the larger Alpine Lakes. A gondola ride from '
                    'Kandersteg, followed by a half-hour walk through pastures '
                    'and pine forest, leads you to the lake, which warms to 20 '
                    'degrees Celsius in the summer. Activities enjoyed here '
                    'include rowing, and riding the summer toboggan run.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
