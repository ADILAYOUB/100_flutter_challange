import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/genre/genre.dart';
import './app_flow_state.dart';

final movieFlowControllerProvider = StateNotifierProvider.autoDispose<
        MovieFlowController, MovieFlowState>(
    // it is equal to state notifierProvider bec it is a stateNotifierProvider
    // bec we are providing a state with auto dipose bec we are rturn the controller
    // that needed to be dispose
    // Then we use provide two types 1.MovieFlowController (controller) and 2. MovieFlowSate(state)
    // we are reading into the provider

// we later on you need to build upon this and create another controller and provider or something else
// and want to access in this provider then we can use ref object like this
// final something = ref.watch(someOtherProvider);
    (ref) {
  return MovieFlowController(MovieFlowState(pageController: PageController()));
  // This pageController we need to dispose off hence we use autoDispose
});

class MovieFlowController extends StateNotifier<MovieFlowState> {
  //this call extends State notifier of type MovieFlowState
  // This movieFlowController will actually be responsible for updating
  // the state which is our moveflowstate
  MovieFlowController(MovieFlowState state) : super(state);
  // This constructor willtake the state so that we can pass any kind of initial
  // State that we want to use for this controller

  // let us create the provider
  // it will be responsible for providing the class throughout the app using
  // provider scope and it is going to a global veriable bec that how riverpod operate

  //logic here we are already done for ui part
  void toggleSelected(Genre genre) {
    state = state.copywith(
      // it will asing the state to a copy of the new state with updated values
      genres: [
        // we are going to copy the state with the new list of Genres
        // state will be amlost like before
        for (final oldGenre in state.genres)
          // if one of the old genres is in the state list we are going to pass that to the list
          if (oldGenre ==
              genre) // if this is true we are going to toggleSelected on that one
            oldGenre
                .toggleSelected() // so we are essentially creating here a new
          // list with the old genres but one of the genres toggle to selected depending on
          // which one we are passing
          // for else case we are going to return the old genre
          else
            oldGenre
      ],
    );
  }

  void updateRating(int updatedRating) {
    state = state.copywith(
        // pass the rating: to be the updated rating
        rating: updatedRating);
  }

  void updateYears(int updatedYears) {
    state = state.copywith(year: updatedYears);
  }

  // controller for handling the back and forth the novigation
  void nextPage() {
    // limit not to able to navigate without selecting any genre
    // condition: the page actually a nuabble which means that if it is null
    // then it will crash which is on purpose bec we don't want this to ever
    // happen that is way >=1 and want to know this right away with if condition
    if (state.pageController.page! >= 1) {
      //guard class it will make sure that if we don't have any selected to true
      if (!state.genres.any((element) => element.isSelected == true)) {
        // we want to reurn or early of this method
        return;
        // to pass through the genre screen you have to selcted the genre
      }
    }
    // now navigate
    state.pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic);
  }

  // go to previoud page with out the guard class
  void previousPage() {
    state.pageController.previousPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic);
  }

  //pagecontroler actually needs to be dispose
  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}
