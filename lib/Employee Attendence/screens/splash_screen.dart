import 'package:flutter/material.dart';
import '../services/auth_services.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';
import 'login signup/login_screen.dart';

class EmpSplashScreen extends StatelessWidget {
  const EmpSplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return authService.currentUser == null
        ? const EmpLoginScreen()
        : const EmpHomeScreen();
  }
}
