import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'login with firebase ',
        home: Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              //TextField widget
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Your  Email',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              //TextField widget
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: 'Password', hintText: 'Enter Your Password'),
              ),
              const SizedBox(
                height: 40,
              ),
              //Submit Button
              ElevatedButton(
                onPressed: () {
                  // loginWithEmailAndPasswrod(
                  //     _emailController.text, _passwordController.text);
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ));
  }

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // Future<void> loginWithEmailAndPasswrod(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     // User login successfully
  //     User? user = userCredential.user;
  //     // can perform additional actions with the user object or navigation
  //     print(user);
  //   } catch (e) {
  //     // handle error
  //     print('Their occurs an error $e');
  //   }
  // }
}
