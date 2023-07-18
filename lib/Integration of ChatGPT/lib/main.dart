import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bloc/question_bloc.dart';
import 'screens/question_screen.dart';
import 'screens/response_screen.dart';
import 'service/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final OpenAiService openAiService = OpenAiService('Your-Chatgpt-Key');

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AiProvider(openAiService)),
        ChangeNotifierProvider<LoadingProvider>(
          create: (_) => LoadingProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'ChatGPT Flutter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => InputScreen(),
          '/answer_screen': (_) => const AnswerScreen(),
        },
      ),
    );
  }
}
