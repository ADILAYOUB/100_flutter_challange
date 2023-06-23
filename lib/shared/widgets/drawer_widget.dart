import 'package:flutte_challange/screens/profile.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../get_user_data.dart';

class DrawerWidget extends StatelessWidget {
  final String userId; // Pass the userId to the widget

  const DrawerWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<Map<String, dynamic>?>(
        future: GetUserData().getUserData(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Text('Error loading user data');
          }

          final userData = snapshot.data;
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: userData != null
                    ? Text(
                        userData['fullName'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    : const Text('User'),
                accountEmail: userData != null
                    ? Text(
                        userData['email'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    : const Text('email@mail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      userData != null ? Colors.transparent : Colors.grey,
                  // Set a default background color if userData is null
                  backgroundImage: userData != null
                      ? NetworkImage(userData['profilePic'])
                      : null, // Set the background image only if userData is not null
                  child: userData == null
                      ? const Icon(Icons.person)
                      // Show an icon if userData is null
                      : null,
                  // Set child to null if userData is not null
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person_2_rounded,
                    size: 32, color: Colors.pinkAccent),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(userId: userId)),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app_sharp,
                    size: 32, color: Colors.pinkAccent),
                title: const Text('Sign'),
                onTap: () async {
                  await UserAuth().googlSignOut();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
