// this acts as a layer between controller and repository

import 'dart:math';

import 'package:flutte_challange/12/app/movie_repository.dart';
import 'package:flutte_challange/12/core/models/movie.dart';
import 'package:flutte_challange/12/features/genre/genre.dart';
import 'package:riverpod/riverpod.dart';

// 3rd create a provider for this class

final movieServiceProvider = Provider<MovieService>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return TMBDMovieService(movieRepository);
});

abstract class MovieService {
  // first get list of genres and not the genres entity like in repository
  Future<List<Genre>> getGenres();
  Future<Movie> getRecommendedMovie(
      int rating, int yearBack, List<Genre> genres,
      [DateTime? yearsBackFromDate]);
  // return the movie and not the list of movie Entity
}

class TMBDMovieService implements MovieService {
  final MovieRepository _movieRepository;
  const TMBDMovieService(this._movieRepository);
  @override
  Future<List<Genre>> getGenres() async {
    // call movieRepository and get the Movie genre
    final genreEntity = await _movieRepository.getMovieGenres();
    // map it with normal genre
    final genre = genreEntity.map((e) => Genre.fromEntity(e)).toList();
    return genre; // this is what we are fetching
  }

  @override
  Future<Movie> getRecommendedMovie(
      int rating, int yearBack, List<Genre> genres,
      [DateTime? yearsBackFromDate]) async {
    // format the date
    final date = yearsBackFromDate ?? DateTime.now();
    final year = date.year - yearBack;
    // GenreIds => repository requires us to have a , separated string so by
    //maping our genres and just select the id and convert that to the list of ids
    final genreIds = genres.map((e) => e.id).toList().join(',');
    // now make the request to the respository
    final movieEntities = await _movieRepository.getRecommendedMovies(
        rating.toDouble(), '$year-01-01', genreIds);
    // we have to map all the entities from the request to movie Model
    final movies =
        movieEntities.map((e) => Movie.fromEntity(e, genres)).toList();

    // we are geting list of movies but we require one random movie;
    final random = Random();
    final randomMovies = movies[random.nextInt(movies.length)];
    return randomMovies;
  }
}
