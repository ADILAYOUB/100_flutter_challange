import 'package:flutte_challange/12/app/app_flow_controller.dart';
import 'package:flutte_challange/12/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            onPressed:
                ref.read(movieFlowControllerProvider.notifier).previousPage),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'Select the Rating',
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ref.watch when you are depending on values that are going to update
              Text('${ref.watch(movieFlowControllerProvider).ratings}',
                  style: theme.textTheme.displayMedium),
              const Icon(
                Icons.star_rounded,
                size: 64,
                color: Colors.amber,
              ),
            ],
          ),
          const Spacer(),
          Slider(
            onChanged: (value) {
              // user ref.read when you are going to do simple  task such as calling a mehod in an onchange or onTap
              ref
                  .read(movieFlowControllerProvider.notifier)
                  .updateRating(value.toInt());
            },
            value: ref.watch(movieFlowControllerProvider).ratings.toDouble(),
            min: 1,
            max: 10,
            divisions: 9,
            label: '${ref.watch(movieFlowControllerProvider).ratings}',
          ),
          const Spacer(),
          PrimaryButton(
              onPressed:
                  ref.read(movieFlowControllerProvider.notifier).nextPage,
              text: 'Continue'),
          const SizedBox(height: kMediumSpacing)
        ],
      )),
    );
  }
}
