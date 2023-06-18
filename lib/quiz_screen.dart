import 'package:flutte_challange/questions_model.dart';
import 'package:flutte_challange/result_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool isAnswered = false;
  int currentIndex = 0, correctAnswers = 0, wrongAnswers = 0;
  String correctAnswer = '', selectedAnswer = '';
  PageController pageController = PageController();

  // Helper function to reset the selected answer
  void resetSelection() {
    setState(() {
      selectedAnswer = ' null';
      isAnswered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the default back button
        title: const Text(
          'Quiz',
          style: TextStyle(color: Colors.black, letterSpacing: 2),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).primaryColor,
        leading: currentIndex == 0
            ? null // Do not show the back button if it's the first question
            : IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex--;
                    pageController.jumpToPage(currentIndex);
                    resetSelection();
                  });
                },
                icon: const Icon(Icons.arrow_back),
              ),
      ),
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          QuestionsModel model = questions[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  model.question,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Column(
                children: List.generate(
                  model.options.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(
                        right: 18.0, left: 18.0, top: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isAnswered = true;
                          selectedAnswer = model.options[index];
                          correctAnswer = model.answer;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: backgroundColor,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: selectedAnswer == model.options[index]
                              ? foregroundColor
                              : backgroundColor,
                        ),
                        child: Text(
                          model.options[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ElevatedButton(
          onPressed: () {
            if (isAnswered) {
              if (correctAnswer == selectedAnswer) {
                correctAnswers++;
              } else {
                wrongAnswers++;
              }
              currentIndex++;
              if (currentIndex != questions.length) {
                pageController.jumpToPage(currentIndex);
                resetSelection(); // Reset the selected answer
              } else {
                print(correctAnswers);
                print(wrongAnswers);
                //navigate to the result screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ResultScreen(
                        correctAnswer: correctAnswers,
                        wrongAnswer: wrongAnswers)),
                  ),
                );
              }
            } else {}
          },
          // style: ElevatedButton.styleFrom(primaryColor:)
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 60)), // Adjust the size as needed
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor),
          ),
          child: const Text(
            'Next',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
