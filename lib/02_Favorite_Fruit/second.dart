import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteFruit extends StatefulWidget {
  const FavoriteFruit({Key? key}) : super(key: key);

  @override
  State<FavoriteFruit> createState() => _MyFavoriteFruit();
}

class _MyFavoriteFruit extends State<FavoriteFruit> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'My favorite Player is ${Provider.of<Favorite>(context).fruit}'),
          centerTitle: true,
        ),
        body: Center(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FruitButton(fruit: 'Apple'),
                const SizedBox(
                  height: 100,
                ),
                FruitButton(fruit: 'Orange'),
                const SizedBox(
                  height: 100,
                ),
                FruitButton(fruit: 'Banana'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FruitButton extends StatelessWidget {
  late String fruit;
  FruitButton({Key? key, required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<Favorite>(context, listen: false).changeFruit(fruit);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white70,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        minimumSize: const Size(200, 50), // Set the minimum width and height
        padding: const EdgeInsets.symmetric(
            vertical: 10), // Adjust the vertical spacing
      ),
      child: Text(
        fruit,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Favorite extends ChangeNotifier {
  String fruit = 'Unknown';

  void changeFruit(String newFruit) {
    fruit = newFruit;
    notifyListeners();
  }
}
