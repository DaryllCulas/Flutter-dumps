// main.dart
import 'package:flutter/material.dart';
// import 'package:flutter_practice/sample_widgets/login_auth/login_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_practice/sample_widgets/adminDashboard/admin_dashboard.dart';
// import 'package:flutter_practice/sample_widgets/login_auth/pages/auth_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // const String appTitle = 'One piece call card';
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 182, 212, 228)),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: AdminDashboard(),
      ),
    );
  }
}
