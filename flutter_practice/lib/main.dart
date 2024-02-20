import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
        ),
        body: const Center(
          child: Text(
            "Welcome to the world!!!",
            style: TextStyle(color: Colors.black, fontSize: 40.0),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: const Icon(Icons.add),
          onPressed: () {
            debugPrint('Pressed ${(index++)}');
          },
        ),
        drawer: Drawer(
          child: ListView(
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text(
                  'Sample drawer',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
