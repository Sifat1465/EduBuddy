import 'package:flutter/material.dart';
import 'login_registrationPage.dart';

void main() {
  runApp(MyApp());
}

/* ===================== APP ROOT ===================== */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduBuddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(), // Start with the Login Page
    );
  }
}
