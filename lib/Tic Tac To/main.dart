import 'package:flutter/material.dart';
import 'package:flutterchallenge/Tic%20Tac%20To/homescreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TicScreen(),
    );
  }
}
