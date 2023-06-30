# flutte_challange


Project 01: Flutter Bottom Navigation Bar

This project is an example of implementing a bottom navigation bar in a Flutter application. It showcases how to create a bottom navigation bar with three different pages: Home Screen, Setting Screen, and Category Screen.

The HomePage class represents the main screen of the application and extends the StatefulWidget class. It initializes the _pages list with instances of the three different screens. The current screen is determined by the _currentIndex variable, which is updated when a navigation item is tapped.

The Scaffold widget provides the basic structure for the app, including an AppBar with a customized design and a body that displays the currently selected screen from the _pages list. The bottom navigation bar is implemented using the BottomAppBar and BottomNavigationBar widgets.

The floatingActionButton is a mini-sized button placed in the center of the bottom navigation bar. In this example, it changes its background color based on the currently selected screen.

The three different screens, namely HomeScreen, SettingScreen, and CategoryScreen, are implemented as stateless widgets. Each screen occupies the entire screen area and displays a centered text representing its name.

![Project 01](https://github.com/ADILAYOUB/100_flutter_challange/blob/master/Project01.PNG)
