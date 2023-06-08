import 'package:flutte_challange/12/app/app_flow_controller.dart';
import 'package:flutte_challange/12/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/primary_button.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            // to access state notifier inside state notifier espicially onPressed method
            // we are going to use ref.read() and add the notifier with the Controller Provider
            // that way we can access both notifier and the state
            onPressed: ref.read(movieFlowControllerProvider.notifier).nextPage,
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
