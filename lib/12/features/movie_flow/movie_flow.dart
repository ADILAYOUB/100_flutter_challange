import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'genre/genre_screen.dart';
import 'landing/landing_screen.dart';
import 'movie_flow_controller.dart';
import 'rating/rating_screen.dart';
import 'years_back/years_back_screen.dart';

class MovieFlow extends ConsumerWidget {
  const MovieFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      // Get the movie flow controller from the provider.
      controller: ref.watch(movieFlowControllerProvider).pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        LandingScreen(),
        GenreScreen(),
        RatingScreen(),
        YearsBackScreen(),
      ],
    );
  }
}
