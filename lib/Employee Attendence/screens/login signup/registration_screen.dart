import 'package:flutter/material.dart';
import 'package:flutterchallenge/Employee%20Attendence/services/auth_services.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../widgets/elevated_button.dart';
import '../widgets/text_widget.dart';

class EmpRegistrationScreen extends StatefulWidget {
  const EmpRegistrationScreen({super.key});

  @override
  State<EmpRegistrationScreen> createState() => _EmpRegistrationScreenState();
}

class _EmpRegistrationScreenState extends State<EmpRegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
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
                  "Employee Registration",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
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
                        authServiceProvider.registerEmployee(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                            context);
                      },
                      isLoading: authServiceProvider.isLoading,
                      label: 'Registration',
                      backgroundColor: Colors.red,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
