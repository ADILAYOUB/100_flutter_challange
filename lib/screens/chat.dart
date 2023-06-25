import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutte_challange/screens/group_info.dart';
import 'package:flutte_challange/services/database.dart';
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
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupModel.groupName,
            style: const TextStyle(color: Colors.pinkAccent)),
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: Colors.pink),
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
      body: Column(
        children: [
          Expanded(child: chatmessage()),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            alignment: Alignment.bottomCenter,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.grey[700],
            child: Row(children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Sending a message . . . ',
                      hintStyle: TextStyle(color: Colors.pinkAccent),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () async {
                  if (controller.text != '') {
                    await DatabaseService().sendMessage(controller.text,
                        widget.groupModel.groupId, widget.userId);
                    controller.text = '';
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                      child: Icon(
                    Icons.send,
                    color: Colors.white,
                  )),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget chatmessage() {
    return StreamBuilder<QuerySnapshot>(
      stream: DatabaseService().getChats(widget.groupModel.groupId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final documents = snapshot.data!.docs;
          final messages = documents.reversed.toList();

          return ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              String senderId = (messages[index].data() as Map)['senderId'];
              String senderName = (messages[index].data() as Map)['senderName'];
              String message = (messages[index].data() as Map)['message'];
              bool sentByMe = senderId == widget.userId;

              // Truncate the message if its length exceeds a certain limit
              if (message.length > 50) {
                message = '${message.substring(0, 50)}...';
              }

              return Align(
                alignment:
                    sentByMe ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(
                    top: index == messages.length - 1 ? 10 : 4,
                    bottom: index == 0 ? 10 : 4,
                    left: sentByMe ? 30 : 8,
                    right: sentByMe ? 8 : 30,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: sentByMe ? Colors.red[100] : Colors.grey[300],
                    borderRadius: sentByMe
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))
                        : const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        senderName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          // Error occurred
          return Text('Error: ${snapshot.error}');
        } else {
          // Data is still loading
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
