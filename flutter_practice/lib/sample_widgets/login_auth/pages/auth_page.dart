import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/sample_widgets/login_auth/pages/basic_flutter.dart';
import 'package:flutter_practice/sample_widgets/login_auth/login_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            debugPrint('Successfully logged in');
            return BasicFlutterSample();
          } else {
            debugPrint('Invalid email and password');
            return LoginForm();
          }
        },
      ),
    );
  }
}
