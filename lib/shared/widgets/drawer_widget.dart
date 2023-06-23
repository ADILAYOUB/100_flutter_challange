import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutte_challange/screens/profile.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final String userId; // Pass the userId to the widget

  const DrawerWidget({super.key, required this.userId});

  Future<Map<String, dynamic>?> getUserData() async {
    // Retrieve user data from Firebase Firestore
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      return userDoc.data();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<Map<String, dynamic>?>(
        future: getUserData(),
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
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    userData != null
                        ? Text(
                            userData['fullName'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        : const Text('User'),
                    const SizedBox(height: 8),
                    userData != null
                        ? Text(
                            userData['email'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        : const Text('email'),
                  ],
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
                        builder: (context) => const ProfileScreen()),
                  );
                },
              ),
              // Add more list tiles for other drawer options
            ],
          );
        },
      ),
    );
  }
}
