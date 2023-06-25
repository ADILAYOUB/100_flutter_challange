import 'package:flutte_challange/screens/group_info.dart';
import 'package:flutte_challange/shared/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutte_challange/models/group.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    required this.groupModel,
    required this.userId,
  }) : super(key: key);
  final String userId;
  final GroupModel groupModel;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GroupInfoScreen(
                        userId: widget.userId, groupModel: widget.groupModel),
                  ),
                );
              },
              icon: const Icon(Icons.info)),
        ],
      ),
    );
  }
}
