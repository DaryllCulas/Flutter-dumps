import 'package:flutter/material.dart';

class DrawerSample extends StatelessWidget {
  const DrawerSample({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu), // This icon will trigger the drawer.
          onPressed: () =>
              Scaffold.of(context).openEndDrawer(), // Open the end drawer.
        ),
        title: const Text('Drawer Sample'),
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
      endDrawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: Text(
                'Sample drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Item  1'),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text('Item  2'),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text('Item  3'),
            ),
            ListTile(
              title: Text('Item  4'),
            ),
            ListTile(
              title: Text('Item  5'),
            ),
            ListTile(
              title: Text('Item  6'),
            ),
          ],
        ),
      ),
    );
  }
}
