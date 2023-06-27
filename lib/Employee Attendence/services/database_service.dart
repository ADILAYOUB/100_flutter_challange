import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterchallenge/Employee%20Attendence/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants/constants.dart';

class DatabaseService extends ChangeNotifier {
  // get instance
  final SupabaseClient _supabase = Supabase.instance.client;
  UserModel? userModel;
  // for employee id we generate a random id
  String generateRandomEmployeeId() {
    final random = Random();
    const allCharacters = 'adilayoubADILAYOUB0192837465';
    final randomString = List.generate(
            8, (index) => allCharacters[random.nextInt(allCharacters.length)])
        .join();
    return randomString;
  }

//! Insert New User Data
  Future insertUser(String email, var id) async {
    await _supabase.from(Constants.employeeTable).insert({
      'id': id, // this id is auth id
      'email': email,
      'name': '',
      'employee_id': generateRandomEmployeeId(),
      'department': null
    });
  }

// get Employee details form the id
  Future<UserModel> getUser() async {
    final userData = await _supabase
        .from(Constants.employeeTable)
        .select()
        .eq('id', _supabase.auth.currentUser!.id)
        .single();

    userModel = UserModel.fromJson(userData);
    return userModel!;
  }
}
