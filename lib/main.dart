// ignore_for_file: prefer_const_constructors

//// ==================================================================
// //First project Bottom Navigation Bar design
//
// import 'first.dart';
// void main() {
//   runApp(HomePage());
// }

// ====================================================================
// // Second Project Update App Bar Using Provider for favorite fruit
// import 'second.dart';
// import 'package:provider/provider.dart';
// void main() => runApp(
//     ChangeNotifierProvider(create: (_) =>Favorite(),
//     child:const FavoriteFruit(),
//     ),
// );

// // Third Project for the UI of the login application and the problem
// // is that we are having issue with the background image
// =====================================================================
// import 'Fourth Project/scn/navbar.dart';
// import 'Third Project/UI/signUp.dart';
//
// void main() => runApp(MyApp());
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Salam',
//       home: SignupPage(),
//     );
//   }
// }

// // navigation basic very first
// ========================================================================
// void main()=> runApp(MyApp());
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner:false,
//        home: Navbar(),
//     );
//   }
// }
//

// /// Fifth Project on Neumoprism
// ========================================================================
// import 'Fifth Project/Neumorphism_Button.dart';
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//           backgroundColor:  Color(0xFFE7ECEF),
//           body: Center(
//             child: MyNeumoprism(),
//           )),
//     );
//   }
// }

// =======================================================================
// // To do list SixthPg for
// import 'Todo List Sixth Project/pages/todolist.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         primaryColor: Colors.deepPurple,
//         textTheme: const TextTheme(
//           caption: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//           subtitle1: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       home: const todoList()
//     );
//   }
// }

// ========================================================================
//
// //Login Screen
// import 'Login_Screen_Seventh_Project/login_screen.dart';
//
// void main() => runApp(MyAppLogin());
//
// class MyAppLogin extends StatelessWidget{
//
//   @override
//   Widget build(BuildContext context){
//    return MaterialApp(
//      home: LoginDemo(),
//    );
//   }
// }

// ========================================================================
//
// import 'Calculator_Eighth/screen/calculator.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: 'calculator ',
//       home: CalScreen(),
//     );
//   }
// }

// ========================================================================
// Building tic tack to game using android studio
// concept required
/*
* 1. showing widgets on the screen
* 2. gridview.builder
* 3. Function writing
* 4. Gesture detection
* 5. Loops
* */

//! =============Tic Tac Toe =================================
// import 'Tic_Tac_Toe Nineth/home_Screen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'tic tack toe',
//       home: ticScreen(),
//     );
//   }
// }

//! ======================== Wallpaper====================================

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import '10_WallPaper_Project/utils/constants/const.dart';
// import '10_WallPaper_Project/view/home.dart';

// Future<void> main() async {
//   await Hive.initFlutter();
//   Hive.openBox<String>(downloadBox);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeWallpaper(),
//     );
//   }
// }

//! ===================== Barbar appointment design =============
import 'package:flutter/material.dart';

import '11/app/app.dart';

void main() {
  runApp(MyApp());
}
