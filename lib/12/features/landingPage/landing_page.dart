import 'package:flutte_challange/12/core/constants.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/primary_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen(
      {super.key, required this.nextPage, required this.previousPage});

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'Let\'s Find Movie',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Image.asset('assets/images/movie.png'),
          const Spacer(),
          PrimaryButton(
            onPressed: nextPage,
            text: 'Get Started',
          ),
          const SizedBox(
            height: kMediumSpacing,
          )
        ],
      ),
    );
  }
}
