// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../features/genre/genre.dart';

@immutable
class Movie {
  final String title;
  final String overview;
  final num vote;
  final List<Genre> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const Movie({
    required this.title,
    required this.overview,
    required this.vote,
    required this.genres,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  //named constructor
  Movie.initial()
      : title = '',
        overview = '',
        vote = 0,
        genres = [],
        releaseDate = '',
        backdropPath = '',
        posterPath = '';

  String get genreSeperated => genres.map((e) => e.name).toList().join(',');

  @override
  String toString() {
    return 'Movie(title:$title, overview: $overview, vote: $vote, genres: $genres, releaseDate: $releaseDate, backdropPath: $backdropPath, posterPath: $posterPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Movie &&
        other.title == title &&
        other.overview == overview &&
        other.vote == vote &&
        other.genres == genres &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode =>
      title.hashCode ^
      overview.hashCode ^
      vote.hashCode ^
      genres.hashCode ^
      releaseDate.hashCode;
}
