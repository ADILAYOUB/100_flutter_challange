// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutte_challange/models/user.dart';
import 'package:flutte_challange/services/database.dart';
import 'package:flutter/material.dart';

import '../models/group.dart';
import '../shared/constants.dart';

class GroupInfoScreen extends StatefulWidget {
  const GroupInfoScreen({
    Key? key,
    required this.userId,
    required this.groupModel,
  }) : super(key: key);

  final GroupModel groupModel;
  final String userId;
  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupModel.groupName),
        backgroundColor: backgroundColor,
        actions: [
          IconButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'Are You Sure ',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                        'Do You Want to Exit! ${widget.groupModel.groupName}'),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () async {
                              await DatabaseService(userId: widget.userId)
                                  .exitGroup(widget.groupModel.groupId);
                              if (mounted) {
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              side: const BorderSide(
                                color: Colors.pinkAccent,
                                width: 2.0,
                              ),
                            ),
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              side: const BorderSide(
                                color: Colors.pinkAccent,
                                width: 2.0,
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.cancel,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.groupModel.members.length,
        itemBuilder: (context, index) {
          String member = widget.groupModel.members[index];
          return FutureBuilder(
            future: DatabaseService(userId: member).getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // data  will be uerdata model data type
                UserModel userData = snapshot.data!;
                bool isAdmin = userData.userId == widget.groupModel.admin;
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: backgroundColor,
                    backgroundImage: NetworkImage(userData.profilePic),
                  ),
                  title: Text(userData.fullName),
                  subtitle: isAdmin
                      ? Text(
                          'Admin of ${widget.groupModel.groupName}',
                          style: const TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.bold),
                        )
                      : Text(userData.email),
                );
              }
              return const LinearProgressIndicator();
            },
          );
        },
      ),
    );
  }
}
