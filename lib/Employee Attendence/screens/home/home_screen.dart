import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../attendence/attendence_screen.dart';
import '../calender/calender_screen.dart';
import '../profile/profile_screen.dart';

class EmpHomeScreen extends StatefulWidget {
  const EmpHomeScreen({super.key});

  @override
  State<EmpHomeScreen> createState() => _EmpHomeScreenState();
}

class _EmpHomeScreenState extends State<EmpHomeScreen> {
  List<IconData> navIcon = [
    IconlyLight.calendar,
    IconlyLight.activity,
    IconlyLight.profile,
  ];
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          EmpCalenderScreen(),
          EmpAttendanceScreen(),
          EmpProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 24),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Colors.white,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < navIcon.length; i++) ...[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = i; // Assign i to currentIndex
                    });
                  },
                  child: Center(
                    child: Icon(
                      navIcon[i],
                      color: i == currentIndex ? Colors.green : Colors.white,
                      size: i == currentIndex ? 36 : 28,
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
