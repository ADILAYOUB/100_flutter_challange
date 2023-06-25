import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../shared/constants.dart';
import '../shared/get_user_data.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({Key? key, required this.userId}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final GetUserData _getUserData = GetUserData();
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final userData = await _getUserData.getUserData(widget.userId);
    setState(() {
      _userData = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Detail',
          style: TextStyle(
              fontSize: 20, letterSpacing: 2, color: Colors.pinkAccent),
        ),
        iconTheme: const IconThemeData(color: Colors.pink),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: _userData != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(_userData!['profilePic']),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: Text('Email: ${_userData!['email']}'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: Text('Full Name: ${_userData!['fullName']}'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.calendar_today),
                        title: Text(
                            'Joined At: ${DateFormat.yMMMMd().add_jm().format(_userData!['joinedAt'].toDate())}'),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
