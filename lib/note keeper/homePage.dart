import 'package:flutter/material.dart';
import 'package:flutterchallenge/note%20keeper/models/user_models.dart';

import 'services/user_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> userList = [];
  final _userService = UserService();

  getAllUser() {
    _userService.readAllUserData().then((value) {
      setState(() {
        userList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(),
    );
  }
}
