import 'package:flutter/material.dart';

class EmpCalenderScreen extends StatefulWidget {
  const EmpCalenderScreen({super.key});

  @override
  State<EmpCalenderScreen> createState() => _EmpCalenderScreenState();
}

class _EmpCalenderScreenState extends State<EmpCalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Calender'),
      ),
    );
  }
}
