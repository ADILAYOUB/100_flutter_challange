import 'package:flutter/material.dart';

import 'constants.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.correctAnswer,
    required this.wrongAnswer,
  }) : super(key: key);
  final int correctAnswer, wrongAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Result',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                answerWidget('Correct', correctAnswer),
                answerWidget('Wrong', wrongAnswer),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget answerWidget(String title, int count) {
    Color textColor = Colors.green; // Default color is green

    // Check the value of the title and update the color accordingly
    if (title == 'Wrong') {
      textColor = Colors.redAccent;
    }

    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$count",
          style: TextStyle(
            color: textColor,
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
