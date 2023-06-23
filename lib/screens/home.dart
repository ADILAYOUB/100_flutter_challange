import 'package:flutte_challange/screens/search.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';
import '../shared/constants.dart';
import '../shared/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userId});
  final String userId;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.person_2_rounded,
              size: 32,
              color: Colors.pinkAccent,
            ),
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          'Chat  Room',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 2),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.search_rounded,
              size: 32,
              color: Colors.pinkAccent,
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(
        userId: widget.userId,
      ), // Pass the actual user ID
      body: Center(
          child: ElevatedButton(
        onPressed: () async {
          await UserAuth().googlSignOut();
        },
        child: const Text('Sign Out'),
      )),
    );
  }
}
