import 'package:flutte_challange/12/app/app_flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/genre/genre_screen.dart';
import '../features/landingPage/landing_page.dart';
import '../features/ratings/rating_screen.dart';
import '../features/years/years_screen.dart';

class MovieFlow extends ConsumerWidget {
  //very similar to the state less widget this will make it possible to get the notifer that we get from the reiverpood
  const MovieFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref let us to get it from provider
    return PageView(
// for controller we are going to use the ref object that we get form the consumer widget
      controller: ref.watch(movieFlowControllerProvider).pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        // now we can provide methods to the other parts of the application
        // without actually passing them so we remove the call backs that we pass to every screen
        LandingScreen(),
        GenreScreen(),
        RatingScreen(),
        YearScreen()
      ],
    );
  }
}
