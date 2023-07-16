import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // get env
  await dotenv.load();
  // initialize supabase
  String supaBaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  String supaBaseKey = dotenv.env['SUPABASE_KEY'] ?? '';
  await Supabase.initialize(url: supaBaseUrl, anonKey: supaBaseKey);
  runApp(const EmpApp());
}

class EmpApp extends StatelessWidget {
  const EmpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const EmpLoginScreen(),
    );
  }
}
