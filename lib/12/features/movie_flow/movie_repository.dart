import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutte_challange/12/features/movie_flow/result/movie_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/environment_variables.dart';
import '../../core/faliure.dart';
import '../../main.dart';
import 'genre/genre_entity.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return TMDBMovieRepository(dio: dio);
});

abstract class MovieRepository {
  Future<List<GenreEntity>> getMovieGenres();
  Future<List<MovieEntity>> getRecommendedMovie(
      double rating, String date, String genreIds);
}
// class TMDBMovieRepository implements MovieRepository {
//   final Dio dio;
//   TMDBMovieRepository({required this.dio});
//
//   @override
//   Future<List<GenreEntity>> getMovieGenres() async {
//     try {
//       final response = await dio.get(
//         'genre/movie/list',
//         queryParameters: {
//           'api_key': api,
//           'language': 'én-US',
//         },
//       );
//       final results = List<Map<String, dynamic>>.from(response.data['genres']);
//       final genres = results.map((e) => GenreEntity.fromMap(e)).toList();
//
//       return genres;
//     } on DioError catch (e) {
//       if (e.error is SocketException) {
//         throw Failure(
//           message: 'No internet connection',
//           exception: e,
//         );
//       }
//
//       throw Failure(
//         message: e.response?.statusMessage ?? 'Something went wrong',
//         code: e.response?.statusCode,
//       );
//     }
//   }
//
//   @override
//   Future<List<MovieEntity>> getRecommendedMovies(
//       double rating, String date, String genreIds) async {
//     try {
//       final response = await dio.get(
//         'discover/movie',
//         queryParameters: {
//           'api_key': api,
//           'language': 'én-US',
//           'sort_by': 'popularity.desc',
//           'include_adult': true,
//           'vote_average.gte': rating,
//           'page': 1,
//           'release_data.gte': date,
//           'with_genres': genreIds,
//         },
//       );
//
//       final results = List<Map<String, dynamic>>.from(response.data['results']);
//       print(results);
//
//       final movies = results.map((e) => MovieEntity.fromMap(e)).toList();
//       return movies;
//     } on DioError catch (e) {
//       if (e.error is SocketException) {
//         throw Failure(
//           message: 'No internet connection',
//           exception: e,
//         );
//       }
//       throw Failure(
//         message: e.response?.statusMessage ?? 'Something went wrong',
//         code: e.response?.statusCode,
//       );
//     }
//   }
//
//   @override
//   Future<List<MovieEntity>> getSimilarMovies(MovieEntity movieEntity) async {
//     final response = await dio.get(
//       'movie/${movieEntity.id}/similar',
//       queryParameters: {
//         'api_key': api,
//         'language': 'én-US',
//         'page': 1,
//       },
//     );
//
//     final results = List<Map<String, dynamic>>.from(response.data['results']);
//     print(results);
//
//     final movies = results.map((e) => MovieEntity.fromMap(e)).toList();
//     return movies;
//   }
// }

class TMDBMovieRepository implements MovieRepository {
  TMDBMovieRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<GenreEntity>> getMovieGenres() async {
    try {
      final response = await dio.get(
        'genre/movie/list',
        queryParameters: {
          'api_key': api,
          'language': 'en-US',
        },
      );
      final results = List<Map<String, dynamic>>.from(response.data['genres']);
      final genres = results.map((e) => GenreEntity.fromMap(e)).toList();

      return genres;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: 'No internet connection',
          exception: e,
        );
      }

      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<MovieEntity>> getRecommendedMovie(
      double rating, String date, String genreIds) async {
    try {
      final response = await dio.get(
        'discover/movie',
        queryParameters: {
          'api_key': api,
          'language': 'en-US',
          'sort_by': 'popularity.desc',
          'include_adult': false,
          'vote_average.gte': rating,
          'page': 1,
          'release_date.gte': date,
          'with_genres': genreIds,
        },
      );
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      final movies = results.map((e) => MovieEntity.fromMap(e)).toList();
      return movies;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: 'No internet connection',
          exception: e,
        );
      }

      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
      );
    }
  }
}
