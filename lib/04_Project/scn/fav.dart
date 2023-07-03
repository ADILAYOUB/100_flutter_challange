import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  FavState createState() => FavState();
}

class FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: const Center(
        child: Text("Favorites"),
      ),
    );
  }
}
