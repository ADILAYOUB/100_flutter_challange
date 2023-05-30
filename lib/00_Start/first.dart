import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  final List<Widget> _pages = <Widget>[];

  @override
  void initState() {
    _pages.add(const CategoryScreen());
    _pages.add(const HomeScreen());
    _pages.add(const SettingScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test app ',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bottom Navigation Bar'),
          elevation: 60,
          backgroundColor: Colors.tealAccent[300],
          centerTitle: true,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60.0),
              bottomRight: Radius.circular(60.0),
            ),
          ),
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomAppBar(
          //this causes the effect of Notch
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          elevation: 60,
          child: SizedBox(
            height: kBottomNavigationBarHeight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                backgroundColor: Colors.blue,
                selectedItemColor: Colors.white,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: 'Category'),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: _currentIndex == 1 ? Colors.blue : Colors.blueGrey,
            child: const Icon(Icons.home),
            onPressed: () => setState(() {
              _currentIndex = 1;
            }),
          ),
        ),
      ),
    );
  }
}

//These will become different pages but for this example i am making these as Stateless Widget for the sake of this example

// Page first will be home Screen on the Click effect
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(child: Text('Home Screen')),
    );
  }
}

// Page Second will be Setting Screen on the Click effect
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(child: Text('Setting Screen')),
    );
  }
}

// Page Third will be Category Screen on the Click effect

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(child: Text('Category Screen')),
    );
  }
}
