// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_practice/sample_widgets/login_auth/components/buttons.dart';
import 'package:flutter_practice/sample_widgets/login_auth/components/square_tile.dart';
import 'package:flutter_practice/sample_widgets/login_auth/textfields.dart';

class RegisterForm extends StatefulWidget {
  final Function()? onTap;
  const RegisterForm({super.key, required this.onTap});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

// sign user in method
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try creating the user
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show error message, passwords don't match
        wrongPasswordMessage("Password don't match");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //Wrong email
      if (e.code == 'user-not-found') {
        // Show wrongEmailMessage error to user
        wrongEmailMessage("Wrong or Invalid Email");

        //Wrong password
      } else if (e.code == 'wrong-password') {
        // Show wrongPasswordMessage error to user
        wrongPasswordMessage("Wrong or Invalid Password");
      }
    }

    Navigator.pop(context);
  }

  // Wrong email message popup
  void wrongEmailMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red.shade200,
          title: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  void wrongPasswordMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red.shade200,
          title: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
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
              const SizedBox(height: 25.0),

              // logo
              const Icon(
                Icons.lock,
                size: 50.0,
                color: Colors.black,
              ),
              const SizedBox(height: 50.0),

              // welcome back, you've been missed!
              const Text(
                'let\'s create an account for you!',
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
              MyTextFields(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
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
                text: 'Sign Up',
                onTap: signUserUp,
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
                    'Already have an account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login Now',
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
