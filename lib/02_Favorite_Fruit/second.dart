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
              children: [
                FruitButton(fruit: 'Apple'),
                FruitButton(fruit: 'Orange'),
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
        child: Text(fruit));
  }
}

class Favorite extends ChangeNotifier {
  String fruit = 'Unknown';

  void changeFruit(String newFruit) {
    fruit = newFruit;
    notifyListeners();
  }
}
