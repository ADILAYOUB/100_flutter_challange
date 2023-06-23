import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserData {
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    // Retrieve user data from Firebase Firestore
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      return userDoc.data();
    } else {
      return null;
    }
  }
}
