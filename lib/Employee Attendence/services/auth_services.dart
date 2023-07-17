import 'package:flutter/material.dart';
import '../utils/snakebar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'database_service.dart';

class AuthService extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;
  User? get currentUser => _supabase.auth.currentUser;
  final DatabaseService _dbService = DatabaseService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future registerEmployee(
      String email, String password, BuildContext context) async {
    try {
      setIsLoading = true;
      if (email == '' || password == '') {
        throw ('All fields are required');
      }
      final AuthResponse response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (response != null) {
        await _dbService.insertUser(email, response.user!.id);
        // ignore: use_build_context_synchronously
        Common.showSnackBar(
            'Registration Successfully you can now login', context,
            color: Colors.green);
        // ignore: use_build_context_synchronously
        await loginEmployee(email, password, context);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
    } catch (e) {
      setIsLoading = false;
      // ignore: use_build_context_synchronously
      Common.showSnackBar(e.toString(), context, color: Colors.red);
    }
  }

  Future loginEmployee(
      String email, String password, BuildContext context) async {
    try {
      setIsLoading = true;
      if (email == '' || password == '') {
        throw ('All fields are required');
      }
      final AuthResponse response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      setIsLoading = false;
    } catch (e) {
      setIsLoading = false;
      // ignore: use_build_context_synchronously
      Common.showSnackBar(e.toString(), context, color: Colors.red);
    }
  }

  Future signOut() async {
    await _supabase.auth.signOut();
    notifyListeners();
  }
}
