import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_practice/sample_widgets/login_auth/components/buttons.dart';
import 'package:flutter_practice/sample_widgets/login_auth/components/square_tile.dart';
import 'package:flutter_practice/sample_widgets/login_auth/textfields.dart';

class LoginForm extends StatefulWidget {
  final Function()? onTap;
  const LoginForm({super.key, required this.onTap});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

// sign user in method
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      //Wrong email
      if (e.code == 'user-not-found') {
        // Show wrongEmailMessage error to user
        wrongEmailMessage();

        //Wrong password
      } else if (e.code == 'wrong-password') {
        // Show wrongPasswordMessage error to user
        wrongPasswordMessage();
      }
    }

    Navigator.pop(context);
  }

  // Wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50.0),

              // logo
              const Icon(
                Icons.lock,
                size: 100.0,
                color: Colors.black,
              ),
              const SizedBox(height: 50.0),

              // welcome back, you've been missed!
              const Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 50.0),

              // username textfield
              MyTextFields(
                controller: emailController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 20.0),
              // password textfield
              MyTextFields(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 30.0),

              // forgot password?
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              // sign in button
              MyButtons(
                text: 'Sign In',
                onTap: signUserIn,
              ),
              const SizedBox(height: 30.0),

              // or continue with

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),

              // google + facebook sign in button
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: '../images/google.png'),
                  SizedBox(width: 10.0),
                  SquareTile(imagePath: '../images/facebook.png'),
                ],
              ),
              const SizedBox(height: 20.0),
              // not a member? register now

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
