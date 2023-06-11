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
            child: ref.watch(movieFlowControllerProvider).genres.when(
                  data: (genres) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          vertical: kListItemSpacing),
                      itemCount: genres.length,
                      itemBuilder: (context, index) {
                        final genre = genres[index];
                        return ListCard(
                          genre: genre,
                          onTap: () => ref
                              .watch(movieFlowControllerProvider.notifier)
                              .toggleSelected(genre),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: kListItemSpacing);
                      },
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, stackTrace) {
                    return const Text('Some Thing Went Wrong');
                  },
                ),
          ),
          PrimaryButton(
              onPressed:
                  ref.watch(movieFlowControllerProvider.notifier).nextPage,
              text: 'Continue'),
          const SizedBox(
            height: kMediumSpacing,
          )
        ]),
      ),
    );
  }
}