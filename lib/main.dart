//? Quiz app

import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF68F3FF), //  theme color
        // Define other theme properties here
        // For example: fontFamily, textTheme, accentColor, etc.
      ),
      home: const Home(),
    );
  }
}
