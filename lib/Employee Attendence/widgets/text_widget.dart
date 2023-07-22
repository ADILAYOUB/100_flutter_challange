import 'package:flutter/material.dart';

Widget buildTextField({
  required String labelText,
  required IconData prefixIcon,
  required TextEditingController controller,
  bool obscureText = false,
}) {
  return TextField(
    decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefixIcon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    controller: controller,
    obscureText: obscureText,
  );
}
