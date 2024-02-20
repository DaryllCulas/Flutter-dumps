import 'package:flutter/material.dart';
// import 'package:flutter_practice/sample_widgets/drawer_sample.dart';
import 'package:flutter_practice/sample_widgets/shopping_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   body: DrawerSample(), // Change here
      // ),
      home: ShoppingList(
        products: [
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate'),
        ],
      ),
    );
  }
}
