import 'package:flutter/foundation.dart';

class MovieEntity {
  final String title;
  final String overview;
  final num vote;
  final List<int> genreIds;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const MovieEntity(
      {required this.title,
      required this.overview,
      required this.vote,
      required this.genreIds,
      required this.releaseDate,
      this.backdropPath,
      this.posterPath});

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    return MovieEntity(
        title: map['title'],
        overview: map['overview'],
        vote: map['vote_average'],
        genreIds: List.from(map['genre_ids']),
        releaseDate: map['release_date'],
        backdropPath: map['backdrop_path'],
        posterPath: map['poster_path']);
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MovieEntity &&
        other.title == title &&
        other.overview == overview &&
        other.vote == vote &&
        listEquals(other.genreIds, genreIds) &&
        other.releaseDate == releaseDate &&
        other.backdropPath == backdropPath &&
        other.posterPath == posterPath;
  }

  @override
  int get hashCode =>
      title.hashCode ^
      overview.hashCode ^
      vote.hashCode ^
      genreIds.hashCode ^
      releaseDate.hashCode ^
      backdropPath.hashCode ^
      posterPath.hashCode;

  @override
  String toString() {
    return 'MovieEntity(title: $title, overview: $overview, vote: $vote, genreIds: $genreIds, releaseDate: $releaseDate, backdropPath: $backdropPath, posterPath: $posterPath)';
  }
}
