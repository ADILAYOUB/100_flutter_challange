import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants/constants.dart';

class DatabaseService extends ChangeNotifier {
  // get instance
  final SupabaseClient _supabase = Supabase.instance.client;

  // for employee id we generate a random id
  String generateRandomEmployeeId() {
    final random = Random();
    const allCharacters = 'adilayoubADILAYOUB0192837465';
    final randomString = List.generate(
            8, (index) => allCharacters[random.nextInt(allCharacters.length)])
        .join();
    return randomString;
  }

  Future insertUser(String email, var id) async {
    await _supabase.from(Constants.employeeTable).insert({
      'id': id,
      'email': email,
      'name': '',
      'employee_id': generateRandomEmployeeId(),
      'department': null
    });
  }
}
