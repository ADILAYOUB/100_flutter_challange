import 'package:flutter/material.dart';

class Common {
  static void showSnackBar(String message, BuildContext context,
      {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
