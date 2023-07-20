import 'package:flutter/material.dart';

Widget buildElevatedButton({
  required VoidCallback onPressed,
  required bool isLoading,
  required String label,
  required Color backgroundColor,
}) {
  return SizedBox(
    height: 60,
    width: double.infinity,
    child: isLoading
        ? const Center(child: CircularProgressIndicator())
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
  );
}
