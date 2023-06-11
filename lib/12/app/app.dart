import 'package:dio/dio.dart';
import 'package:flutte_challange/12/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_flow.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// create a normal provider (this will provide value or object we are not going to
// use it and listern to it in the UI and expect some UI changes);
final dioProvider = Provider<Dio>((ref) {
  return Dio(
      //instantiate a dio object and pass some baseObjects to it
      BaseOptions(
    baseUrl:
        'https:api/.themoviedb.org/3/', // all the request we are going to do with this instance of dio
    // base url for the movie databse
  ));
});

class _MyAppState extends State<MyApp> {
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
