import 'package:flutte_challange/12/core/faliure.dart';
import 'package:flutte_challange/12/features/movie_flow/result/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

import 'genre/genre.dart';
import 'movie_repository.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return TMDBMovieService(movieRepository);
});

abstract class MovieService {
  Future<Result<Failure, List<Genre>>> getGenres();
  Future<Result<Failure, List<Movie>>> getRecommendedMovie(
      int rating, int yearsBack, List<Genre> genres,
      [DateTime? yearsBackFromDate]);
}

// class TMDBMovieService implements MovieService {
//   final MovieRepository _movieRepository;
//   TMDBMovieService(this._movieRepository);
//
//   @override
//   Future<Result<Failure, List<Genre>>> getGenres() async {
//     try {
//       final genreEntities = await _movieRepository.getMovieGenres();
//       final genres = genreEntities.map((e) => Genre.fromEntity(e)).toList();
//       return Success(genres);
//     } on Failure catch (failure) {
//       return Error(failure);
//     }
//   }
//
//   @override
//   Future<Result<Failure, Movie>> getRecommendedMovie(int rating, int yearsBack, List<Genre> genres, [DateTime? yearsBackFromDate]) async {
//     final date = yearsBackFromDate ?? DateTime.now();
//     final year = date.year - yearsBack;
//     final genreIds = genres.map((e) => e.id).toList().join(',');
//
//     try {
//       final movieEntities = await _movieRepository.getRecommendedMovies(
//           rating.toDouble(), '$year-01-01', genreIds);
//
//       final rnd = Random();
//       final randomMovieEntity = movieEntities[rnd.nextInt(
//           movieEntities.length)];
//       final similarMovieEntities = await _movieRepository.getSimilarMovies(
//           randomMovieEntity);
//
//       final similarMovies = similarMovieEntities.map((e) =>
//           Movie.fromEntity(e, genres, const [])).toList();
//
//       final movie = Movie.fromEntity(randomMovieEntity, genres, similarMovies);
//
//       // final rnd = Random();
//       // final randomMovie = movies[rnd.nextInt(movies.length)];
//
//       return Success(movie);
//     } on Failure catch (failure) {
//       return Error(failure);
//     }
//   }
// }

class TMDBMovieService implements MovieService {
  TMDBMovieService(this._movieDbRepository);
  final MovieRepository _movieDbRepository;

  @override
  Future<Result<Failure, List<Genre>>> getGenres() async {
    try {
      final genreEntities = await _movieDbRepository.getMovieGenres();
      final genres =
          genreEntities.map((e) => Genre.fromEntity(e)).toList(growable: false);
      return Success(genres);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }

  @override
  Future<Result<Failure, List<Movie>>> getRecommendedMovie(
      int rating, int yearsBack, List<Genre> genres,
      [DateTime? yearsBackFromDate]) async {
    final date = yearsBackFromDate ?? DateTime.now();
    final year = date.year - yearsBack;
    final genreIds = genres.map((e) => e.id).toList(growable: false).join(',');
    try {
      final movieEntities = await _movieDbRepository.getRecommendedMovie(
          rating.toDouble(), '$year-01-01', genreIds);
      final movies = movieEntities
          .map((e) => Movie.fromEntity(e, genres))
          .toList(growable: false);

      if (movies.isEmpty) {
        return Error(Failure(message: 'No movies found'));
      }

      return Success(movies);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
}
