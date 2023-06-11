// creating a abstract before using dio to call the api's
import 'package:dio/dio.dart';
import 'package:flutte_challange/12/app/app.dart';
import 'package:flutte_challange/12/app/app_entity.dart';
import 'package:flutte_challange/12/core/apis/environment_veriables.dart';
import 'package:flutte_challange/12/features/genre/genre_entity.dart';
import 'package:riverpod/riverpod.dart';

//create a provider => provide the repository

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  //get our dio client
  // provider is used for the value and not for UI Update
  final dio = ref.watch(dioProvider); // dio client
  // instance of dio
  return TMDBMovieRepository(dio: dio); // important for the testing
});

abstract class MovieRepository {
  // get list of genres
  Future<List<GenreEntity>> getMovieGenres();
  Future<List<MovieEntity>> getRecommendedMovies(
      double ratings, String date, String genreIds);
}

//implementation
class TMDBMovieRepository implements MovieRepository {
  final Dio dio; // dio client
  TMDBMovieRepository({required this.dio});

  @override
  Future<List<GenreEntity>> getMovieGenres() async {
    // pass the relative url from the api
    final response = await dio.get('genre/movie/list', queryParameters: {
      'api_key': api,
      'language': 'en-US'
    }); // we have base url when we intantiate the url

    // for response object => convert the response object into the objecct we want
    final result = List<Map<String, dynamic>>.from(response.data['genres']);
    //maping from result
    final genres =
        result.map((e) => GenreEntity.fromMap(e)).toList(); //itereable genre
    return genres;
  }

  @override
  Future<List<MovieEntity>> getRecommendedMovies(
      double ratings, String date, String genreIds) async {
    final response = await dio.get('discover/movie', queryParameters: {
      'api_key': api,
      'language': 'en-US',
      'sort_by': 'popularity.desc',
      'include_adult': 'fase',
      'vote_average.gte': ratings,
      'page': 1,
      'release_date.gte': date,
      'with_genres': genreIds,
    });
    final results = List<Map<String, dynamic>>.from(response.data['results']);
    final movies = results.map((e) => MovieEntity.fromMap(e)).toList();
    return movies;
  }

  // implementing Get movie genre
}
