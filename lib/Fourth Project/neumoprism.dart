import 'package:flutter/material.dart';

class MyNeumoprism extends StatefulWidget {
  const MyNeumoprism({Key? key}) : super(key: key);

  @override
  State<MyNeumoprism> createState() => _MyNumorprismState();
}

class _MyNumorprismState extends State<MyNeumoprism> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFE7ECEF);
    double blur = isPressed ? 5.0 : 30.0;
    Offset distance = isPressed ? const Offset(10, 10) : const Offset(29, 29);

    return GestureDetector(
      onTap: () => setState(() => isPressed = !isPressed),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: blur,
                offset: distance,
                color: Colors.white,
              ),
              BoxShadow(
                  blurRadius: blur,
                  offset: distance,
                  color: const Color(0xFFA7A9af))
            ]
            //color: Colors.blue,
            ),
        child: const SizedBox(height: 200, width: 200),
      ),
    );
  }
}
