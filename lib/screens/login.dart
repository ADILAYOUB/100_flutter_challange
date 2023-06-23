import 'package:flutte_challange/services/auth.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Friends Chat',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Let us caht and create Groups to connect',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: 20),
                Image.network(
                  'https://th.bing.com/th/id/OIP.bGGpu107430t9Yf1pPJflwHaHa?pid=ImgDet&rs=1',
                ),
                const SizedBox(height: 24),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : ElevatedButton.icon(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          bool auth = await UserAuth().handleSignInWithGoogle();
                          if (!auth) {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        icon: Container(
                          height: 24,
                          width: 24,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://th.bing.com/th/id/OIP.IcreJX7hnOjNYRnlo4DCWwHaE8?w=258&h=180&c=7&r=0&o=5&pid=1.7'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle),
                        ),
                        label: const Text(
                          'Google SignIn',
                          style: TextStyle(letterSpacing: 2),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black45),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
