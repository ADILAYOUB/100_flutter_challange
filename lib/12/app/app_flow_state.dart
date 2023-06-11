// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutte_challange/12/core/models/movie.dart';
import 'package:flutte_challange/12/features/genre/genre.dart';
import 'package:riverpod/riverpod.dart';
// through async values we can handle error cases when we have data as well as loading cases

@immutable
class MovieFlowState {
  final PageController pageController;
  final int ratings;
  final int years;
// this movie and Genre we are getting from the http request to the api
// so first let us make them required also we can wrap them with async value type
// to make them required we want to ass some moke values
  final AsyncValue<List<Genre>> genres;
  final AsyncValue<Movie> movie;

  const MovieFlowState({
    required this.pageController,
    required this.genres,
    required this.movie,
    // and for the veriable we can wrap them with async type i.e AsyncValue (from riverpood)
    this.ratings = 5,
    this.years = 10,
  });

  //? create copy of these objects
  MovieFlowState copywith(
      {
//  takes all of the members as parameters, and make sure that all of them are nullable
// reson for this is to able to construct the new object but we want to
      PageController? pageController,
      int? rating,
      int? year,
      AsyncValue<List<Genre>>? genres,
      AsyncValue<Movie>? movie}) {
    // returns movie flow state instance (new)
    return MovieFlowState(
        pageController: pageController ?? this.pageController,
        ratings: rating ?? ratings,
        years: year ?? years,
        genres: genres ?? this.genres,
        movie: movie ?? this.movie);
  }

  //compare with other objects with other similar objects
  // for that we are going to override the == operator  as well as the hascode

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MovieFlowState &&
        other.pageController == pageController &&
        other.ratings == ratings &&
        other.years == years &&
        other.genres == genres &&
        other.movie == movie;
  }

  @override
  int get hashCode =>
      pageController.hashCode ^
      ratings.hashCode ^
      years.hashCode ^
      genres.hashCode ^
      movie.hashCode;
}
