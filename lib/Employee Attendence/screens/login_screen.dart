import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../services/auth_services.dart';
import '../widgets/elevated_button.dart';
import '../widgets/text_widget.dart';
import 'registration_screen.dart';

class EmpLoginScreen extends StatefulWidget {
  const EmpLoginScreen({Key? key}) : super(key: key);

  @override
  State<EmpLoginScreen> createState() => _EmpLoginScreenState();
}

class _EmpLoginScreenState extends State<EmpLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: height / 3,
            width: width,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(72),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconlyLight.scan,
                  size: 80,
                ),
                SizedBox(height: 24),
                Text(
                  "Employee",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                buildTextField(
                  labelText: 'Employee Email',
                  prefixIcon: IconlyLight.profile,
                  controller: _emailController,
                ),
                const SizedBox(height: 24),
                buildTextField(
                  labelText: 'Employee Password',
                  prefixIcon: IconlyLight.password,
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                Consumer<AuthService>(
                  builder: (context, authServiceProvider, child) {
                    return buildElevatedButton(
                      onPressed: () {
                        authServiceProvider.loginEmployee(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                          context,
                        );
                      },
                      isLoading: authServiceProvider.isLoading,
                      label: 'Login',
                      backgroundColor: Colors.red,
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const EmpRegistrationScreen()),
                ),
              );
            },
            child: const Text(
              'New Employee? Register Here!',
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
