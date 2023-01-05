import 'package:dio/dio.dart';
import 'package:flutte_challange/12/features/movie_flow/movie_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/custom_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final dioProvider = Provider<Dio>((ref) {
  // This code creates a `Dio` instance with a base URL of `https://api.themoviedb.org/3/`.
  // The `Dio` class is a HTTP client that can be used to make requests to web APIs.
  return Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
    ),
  );
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Recommendation',
      darkTheme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      home: const MovieFlow(),
    );
  }
}