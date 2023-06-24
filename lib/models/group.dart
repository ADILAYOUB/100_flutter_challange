// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  GroupModel({
    required this.groupId,
    required this.groupName,
    required this.groupIcon,
    required this.admin,
    required this.members,
    required this.recentMessage,
    required this.recentMessageSender,
    required this.public,
  });
  String groupId;
  String groupName;
  String groupIcon;
  String admin;
  List members;
  String recentMessage;
  String recentMessageSender;
  bool public;

  factory GroupModel.fromJson(DocumentSnapshot snapshot) {
    return GroupModel(
        groupId: snapshot['groupId'],
        groupName: snapshot['groupName'],
        groupIcon: snapshot['groupIcon'],
        admin: snapshot['admin'],
        members: snapshot['members'],
        recentMessage: snapshot['recentMessage'],
        recentMessageSender: snapshot['recentMessageSender'],
        public: snapshot['public']);
  }
}
