import 'package:flutter/material.dart';

class EmpAttendenceScreen extends StatefulWidget {
  const EmpAttendenceScreen({super.key});

  @override
  State<EmpAttendenceScreen> createState() => _EmpAttendenceScreenState();
}

class _EmpAttendenceScreenState extends State<EmpAttendenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Attendence'),
      ),
    );
  }
}
