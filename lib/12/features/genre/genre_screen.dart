import 'package:flutte_challange/12/app/app_flow_controller.dart';
import 'package:flutte_challange/12/core/constants.dart';
import 'package:flutte_challange/12/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'list_card.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refrence = ref.watch(movieFlowControllerProvider).genres;
    final notifier = ref.watch(movieFlowControllerProvider.notifier);
    // let us define a theme
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(children: [
          Text(
            'Let\'s Select the Genre',
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          Expanded(
              child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: kListItemSpacing),
            itemCount: refrence.length,
            itemBuilder: (context, index) {
              final genre = refrence[index];
              return ListCard(
                genre: genre,
                onTap: () => notifier.toggleSelected(genre),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: kListItemSpacing);
            },
          )),
          PrimaryButton(onPressed: notifier.nextPage, text: 'Continue'),
          const SizedBox(
            height: kMediumSpacing,
          )
        ]),
      ),
    );
  }
}
