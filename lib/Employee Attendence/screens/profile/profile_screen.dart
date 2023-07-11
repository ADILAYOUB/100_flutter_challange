import 'package:flutter/material.dart';

class EmpProfileScreen extends StatefulWidget {
  const EmpProfileScreen({super.key});

  @override
  State<EmpProfileScreen> createState() => _EmpProfileScreenState();
}

class _EmpProfileScreenState extends State<EmpProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
