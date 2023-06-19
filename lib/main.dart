import 'package:flutte_challange/app_theme.dart';
import 'package:flutter/material.dart';

import './home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTheme.getThemeValue(); // Call the method on the instance
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cripto currency',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lime),
      ),
      home: const HomeScreen(),
    );
  }
}
