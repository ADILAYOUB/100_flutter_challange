import 'package:flutte_challange/17_shoping_UI/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (cotnext, orientation, deviceType) => MaterialApp(
        title: 'Shop UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.teal,
            textTheme: GoogleFonts.poppinsTextTheme()),
        home: const HomeScreen(),
      ),
    );
  }
}
