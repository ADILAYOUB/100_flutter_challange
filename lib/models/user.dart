import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String email;
  final String fullName;
  final DateTime joinedAt;
  final String profilePic;

  UserModel({
    required this.userId,
    required this.email,
    required this.fullName,
    required this.joinedAt,
    required this.profilePic,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      fullName: json['fullName'],
      joinedAt: (json['joinedAt'] as Timestamp).toDate(),
      profilePic: json['profilePic'],
      userId: json['userId'],
    );
  }

  // ! OR
  // factory UserModel.fromJson(DocumentSnapshot snapshot) {
  //   return UserModel(
  //     email: snapshot['email'],
  //     fullName: snapshot['fullName'],
  //     joinedAt: DateTime.parse(snapshot['joinedAt']),
  //     profilePic: snapshot['profilePic'],
  //     userId: snapshot['userId'],
  //   );
  // }
}
