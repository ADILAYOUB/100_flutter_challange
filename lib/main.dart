import 'package:flutter/material.dart';


// //First project Bottom Navigation Bar design
//
// import 'first.dart';
// void main() {
//   runApp(HomePage());
// }

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

// Todlist SixthPg for
import 'Todlist SixthPg/todolist.dart';
void main() => runApp(Todlist());
class Todlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: todoList(),
    );
  }
}
