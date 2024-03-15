import 'package:flutter/material.dart';
import 'package:flutter_practice/sample_widgets/login_auth/login_form.dart';
import 'package:flutter_practice/sample_widgets/login_auth/pages/register_page.dart';

class LoginOrRegisterUser extends StatefulWidget {
  const LoginOrRegisterUser({super.key});

  @override
  State<LoginOrRegisterUser> createState() => _LoginOrRegisterUserState();
}

class _LoginOrRegisterUserState extends State<LoginOrRegisterUser> {
  // initialize show login page
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginForm(
        onTap: togglePages,
      );
    } else {
      return RegisterForm(
        onTap: togglePages,
      );
    }
  }
}
