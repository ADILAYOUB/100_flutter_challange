import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutte_challange/models/user.dart';

import '../models/group.dart';

class DatabaseService {
  DatabaseService({this.userId});
  final String? userId;

  // ref of collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('groups');

  // insert user data
  Future insertUserData(
      String? fullName, String? email, String? profilePic) async {
    // if already exists
    DocumentSnapshot user = await userCollection.doc(userId).get();

    if (!user.exists) {
      //insert
      await userCollection.doc(userId).set({
        'userId': userId,
        'fullName': fullName,
        'email': email,
        'profilePic': profilePic,
        'joinedAt': DateTime.now()
      });
    }
  }

  Future<UserModel> getUserData({String? userDocId}) async {
    DocumentSnapshot result =
        await userCollection.doc(userDocId ?? userId).get();
    if (!result.exists) {
      await Future.delayed(const Duration(seconds: 1));
      result = await userCollection.doc(userId).get();
    }
    Map<String, dynamic> data = result.data() as Map<String, dynamic>;
    UserModel userModel = UserModel.fromJson(data);
    return userModel;
  }

  // Creating new Group

  Future createGroup(String groupName) async {
    DocumentReference doc = await groupCollection.add({
      'groupId': '',
      'groupName': groupName,
      'groupIcon': '',
      'admin': userId,
      'members': [userId],
      'recentMessage': '',
      'recentMessageSender': '',
      'public': true,
      'searchKeywords': getSearchLetter(groupName)
    });
    // update
    await groupCollection.doc(doc.id).update({
      'groupId': doc.id,
    });
  }

  // fetch all the groups joined by the user
  Stream<List<GroupModel>> fetchJoinedGroup() async* {
    yield* groupCollection
        .where('members', arrayContains: userId)
        .snapshots()
        .map((groups) =>
            groups.docs.map((group) => GroupModel.fromJson(group)).toList());
  }

  // join group

  Future<void> joinGroup(String groupId) async {
    await groupCollection.doc(groupId).update(
      {
        'members': FieldValue.arrayUnion(
          [userId],
        ),
      },
    );
  }

  // Exite Group
  Future<void> exitGroup(String groupId) async {
    await groupCollection.doc(groupId).update(
      {
        'members': FieldValue.arrayRemove(
          [userId],
        ),
      },
    );
  }

// get search keyword
  List<String> getSearchLetter(String groupName) {
    List<String> searchResult = [groupName.toLowerCase()];
    List<String> words = groupName.split(' ');
    String temp = '';
    for (var word in words) {
      for (int i = 0; i < word.length; i++) {
        temp = temp + word.toLowerCase()[i];
        searchResult.add(temp);
        if (i == word.length - 1) {
          temp = '';
        }
      }
    }
    return searchResult;
  }

  // fetch search groups
  Stream<List<GroupModel>> fetchSearchedGroups(String searchName) async* {
    yield* groupCollection
        .where('searchKeywords', arrayContains: searchName.toLowerCase())
        .snapshots()
        .map((groups) =>
            groups.docs.map((e) => GroupModel.fromJson(e)).toList());
  }

  //Fetch all groups
  Stream<List<GroupModel>> fetchAllGroups() async* {
    yield* groupCollection.snapshots().map(
        (groups) => groups.docs.map((e) => GroupModel.fromJson(e)).toList());
  }

  //Send message
  Future<void> sendMessage(
      String message, String groupId, String userId) async {
    UserModel userData = await getUserData(userDocId: userId);
    // create sub-collection inside the group collection
    await groupCollection.doc(groupId).collection('messages').add({
      "message": message,
      "senderId": userId,
      "senderName": userData.fullName,
      "time": DateTime.now()
    });

    await groupCollection.doc(groupId).update(
        {'recentMessage': message, 'recentMessageSender': userData.fullName});
  }

  // Fetch all messages of a group
  Stream<QuerySnapshot<Map<String, dynamic>>> getChats(String groupId) {
    return groupCollection
        .doc(groupId)
        .collection('messages')
        .orderBy('time', descending: false)
        .snapshots();
  }
}
