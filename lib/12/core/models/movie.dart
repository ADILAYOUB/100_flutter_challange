// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../app/app_entity.dart';
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

  // import MovieEntity
  // create a constructor
  factory Movie.fromEntity(MovieEntity entity, List<Genre> genres) {
    // return movie object with all necessery veriable maped to corresponding values
    return Movie(
        // map every
        title: entity.title,
        overview: entity.overview,
        vote: entity.vote,
        genres: genres
            .where((genre) => entity.genreIds.contains(genre.id))
            .toList(
                growable:
                    false), // as they come with the ids  therefore use where
        releaseDate: entity.releaseDate,
        backdropPath:
            'https://image.tmdb.org/t/p/original/${entity.backdropPath}',
        posterPath:
            'https://image.tmdb.org/t/p/original/${entity.posterPath}'); // after this we are goind to use repository-service pattern
  }

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
