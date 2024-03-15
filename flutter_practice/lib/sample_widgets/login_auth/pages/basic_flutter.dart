import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasicFlutterSample extends StatelessWidget {
  BasicFlutterSample({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample onleh'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50.0,
              child: _section(
                'Logged in as: ${user.email!}',
                Colors.green,
              ),
            ),
            SizedBox(
              height: 50.0,
              child: _section(
                'Logged in as: ${user.email!}',
                Colors.red,
              ),
            ),
            SizedBox(
              height: 50.0,
              child: _section(
                'Logged in as: ${user.email!}',
                Colors.blue,
              ),
            ),
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
