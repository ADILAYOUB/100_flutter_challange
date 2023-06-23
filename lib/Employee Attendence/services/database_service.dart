import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterchallenge/Employee%20Attendence/models/user_model.dart';
import 'package:flutterchallenge/Employee%20Attendence/utils/snakebar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants/constants.dart';
import '../models/department_model.dart';

class DatabaseService extends ChangeNotifier {
  // get instance
  final SupabaseClient _supabase = Supabase.instance.client;
  UserModel? userModel;
  //list of departments
  List<DepartmentModel> alldepartments = [];
  int? employeeDepartment;
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
    employeeDepartment == null
        ? employeeDepartment = userModel!.department
        : null;
    return userModel!;
  }

  // user can update the department and name in the profile

  Future<void> getAllDepartments() async {
    final List result =
        await _supabase.from(Constants.departmentTable).select();
    alldepartments = result.map((e) => DepartmentModel.fromJson(e)).toList();
    notifyListeners();
  }

  Future updateProfile(String name, BuildContext context) async {
    await _supabase.from(Constants.employeeTable).update({
      'name': name,
      'department': employeeDepartment,
    }).eq('id', _supabase.auth.currentUser!.id);
    Common.showSnackBar('Profile Updated', context, color: Colors.green);
    notifyListeners();
  }
}
