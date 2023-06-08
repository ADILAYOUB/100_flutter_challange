import 'package:flutte_challange/12/app/app_flow_controller.dart';
import 'package:flutte_challange/12/core/constants.dart';
import 'package:flutte_challange/12/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/shows.dart';

class YearScreen extends ConsumerWidget {
  const YearScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'Select How many years should we check for?',
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${ref.watch(movieFlowControllerProvider).years}',
                  style: theme.textTheme.headlineLarge),
              Text('Year Back',
                  style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.textTheme.headlineMedium?.color
                          ?.withOpacity(0.62))),
            ],
          ),
          const Spacer(),
          Slider(
            value: ref.watch(movieFlowControllerProvider).years.toDouble(),
            onChanged: (value) {
              ref
                  .read(movieFlowControllerProvider.notifier)
                  .updateYears(value.toInt());
            },
            min: 0,
            max: 70,
            divisions: 70,
            label: '${ref.watch(movieFlowControllerProvider).years}',
          ),
          const Spacer(),
          PrimaryButton(
              onPressed: () => Navigator.of(context).push(ResultScreen.route()),
              text: 'Find'),
          const SizedBox(height: kMediumSpacing)
        ],
      )),
    );
  }
}
