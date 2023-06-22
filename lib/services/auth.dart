import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutte_challange/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/login.dart';

class UserAuth {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Google Sign In
  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      try {
        final GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);
        return true;
      } on FirebaseAuthException catch (e) {
        print('FirebaseAuthException: ${e.message}');
        return false;
      } catch (e) {
        print('Error: $e');
        return false;
      }
    } else {
      print('Sign-In Interrupted');
      return false;
    }
  }

  // Sign Out

  Future<void> googlSignOut() async {
    await _googleSignIn.signIn();
    await _auth.signOut();
  }

  // user authenticated or not
  Widget handleAuth() {
    return StreamBuilder(
        stream: _auth.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
