import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutte_challange/screens/home.dart';
import 'package:flutte_challange/services/database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/login.dart';

class UserAuth {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google Sign In
  Future<bool> signInWithGoogle(Function showSnackBar) async {
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
        final UserCredential userData =
            await _auth.signInWithCredential(credential);
        final user = userData.user;
        // insert the userCrendential to the database
        await DatabaseService(userId: user!.uid)
            .insertUserData(user.displayName, user.email, user.photoURL);
        return true;
      } on FirebaseAuthException catch (e) {
        showSnackBar(e.message.toString(), Colors.red);
        return false;
      } catch (e) {
        showSnackBar(e.toString(), Colors.red);
        return false;
      }
    } else {
      showSnackBar('Sign-In Interrupted', Colors.red);
      return false;
    }
  }

  // chow snack bar
  void showSnackBar(
      BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

// In your widget where you want to call signInWithGoogle
  Future<bool> handleSignInWithGoogle() async {
    return signInWithGoogle(showSnackBar);
  }

  // Sign Out
  Future<void> googlSignOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // user authenticated or not
  Widget handleAuth() {
    return StreamBuilder(
        stream: _auth.authStateChanges(), // gives user data type
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(userId: _auth.currentUser!.uid);
          } else {
            return const LoginScreen();
          }
        });
  }
}
