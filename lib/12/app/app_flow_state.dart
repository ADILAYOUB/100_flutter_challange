// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutte_challange/12/core/models/movie.dart';
import 'package:flutte_challange/12/features/genre/genre.dart';

const movieMock = Movie(
    title: 'The Hero',
    overview:
        'This is the overview of the movie The Hero based on the indian Super hero in the mist of war and terror in the country',
    vote: 4.3,
    genres: [Genre(name: 'Action'), Genre(name: 'Fantacy')],
    releaseDate: '2019-10-12',
    backdropPath: '',
    posterPath: '');

const genresMock = [
  Genre(name: 'Action'),
  Genre(name: 'Comedy'),
  Genre(name: 'Horror'),
  Genre(name: 'Anime'),
  Genre(name: 'Drama'),
  Genre(name: 'Family'),
  Genre(name: 'Romance')
];

@immutable
class MovieFlowState {
  final PageController pageController;
  final int ratings;
  final int years;
  final List<Genre> genres;
  final Movie movie;
  const MovieFlowState({
    required this.pageController,
    this.ratings = 5,
    this.years = 10,
    this.genres = genresMock,
    this.movie = movieMock,
  });

  //? create copy of these objects
  MovieFlowState copywith(
      {
//  takes all of the members as parameters, and make sure that all of them are nullable
// reson for this is to able to construct the new object but we want to
      PageController? pageController,
      int? rating,
      int? year,
      List<Genre>? genres,
      Movie? movie}) {
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
