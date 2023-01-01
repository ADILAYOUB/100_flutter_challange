import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Register Here",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Image.network(
                  "https://raw.githubusercontent.com/manishdayma/flutter_login_ui/main/assets/register.jpg",
                  height: 250,
                  width: double.infinity,
                ),
                const Text(
                  "Get Registered From Here",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Email',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Confirm Password',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 50,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account ? ",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()));
                      },
                      child: Text(
                        "Sign In ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
