import 'package:flutte_challange/12/core/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/genre/genre.dart';
import './app_flow_state.dart';
import 'movie_services.dart';

// first inject the service because we are going to laterOn do the get movie and get genre requests

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
  return MovieFlowController(
      MovieFlowState(
          pageController: PageController(),
          movie: AsyncValue.data(Movie.initial()),
          genres: const AsyncValue.data([])),
      ref.watch(movieServiceProvider));
  // This pageController we need to dispose off hence we use autoDispose
});

class MovieFlowController extends StateNotifier<MovieFlowState> {
  //this call extends State notifier of type MovieFlowState
  // This movieFlowController will actually be responsible for updating
  // the state which is our moveflowstate
  final MovieService _movieService;

  MovieFlowController(
    MovieFlowState state,
    this._movieService,
  ) : super(state) {
    // providers are by default lasyLoaded
    loadGenres();
  }

  // this is called first when we are listen to the provider for the first time
  Future<void> loadGenres() async {
    // setting a state to a loading state
    state = state.copywith(genres: const AsyncValue.loading());
    // now make call to the service
    final result = await _movieService.getGenres();
    // set state again
    state = state.copywith(genres: AsyncValue.data(result));
  }

  // get recommended movie
  Future<void> getRecommendedMovie() async {
    state = state.copywith(movie: const AsyncValue.loading());
    // first get all the selected genres
    final selectedGenres = state.genres.asData?.value
            .where((element) => element.isSelected == true)
            .toList(growable: false) ??
        [];
    final result = await _movieService.getRecommendedMovie(
        state.ratings, state.years, selectedGenres);
    // set new state to the reult movie

    state = state.copywith(movie: AsyncValue.data(result));
  }

  // This constructor willtake the state so that we can pass any kind of initial
  // State that we want to use for this controller

  // let us create the provider
  // it will be responsible for providing the class throughout the app using
  // provider scope and it is going to a global veriable bec that how riverpod operate

  //logic here we are already done for ui part
  void toggleSelected(Genre genre) {
    state = state.copywith(
      // it will asing the state to a copy of the new state with updated values

      // wrap up with the AsycValue.data
      genres: AsyncValue.data(
        [
          // we are going to copy the state with the new list of Genres
          // state will be amlost like before
          for (final oldGenre in state.genres.asData!.value)
            // now we can acces directly the genre we have to access through the data.value
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
      ),
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
      if (!state.genres.asData!.value
          .any((element) => element.isSelected == true)) {
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
