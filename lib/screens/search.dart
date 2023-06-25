// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutte_challange/screens/chat.dart';
import 'package:flutter/material.dart';

import 'package:flutte_challange/models/group.dart';
import 'package:flutte_challange/services/database.dart';
import 'package:flutte_challange/shared/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final String userId;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Group',
          style: TextStyle(color: Colors.pinkAccent),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: Colors.pink),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: TextField(
              decoration: const InputDecoration(
                focusColor: Colors.black,
                hintText: 'Search',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pinkAccent),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
              style: const TextStyle(
                  color: Colors.black, fontSize: 18, letterSpacing: 2),
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: StreamBuilder<List>(
              stream: search == ''
                  ? DatabaseService().fetchAllGroups()
                  : DatabaseService().fetchSearchedGroups(search),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: ((context, index) {
                        GroupModel groupData = snapshot.data[index];
                        bool alreadyJoined =
                            groupData.members.contains(widget.userId);
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: backgroundColor,
                            child: Text(groupData.groupName
                                .substring(0, 1)
                                .toUpperCase()),
                          ),
                          title: Text(groupData.groupName),
                          trailing: alreadyJoined
                              ? OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) => ChatScreen(
                                                groupModel: groupData,
                                                userId: widget.userId))));
                                  },
                                  child: const Text(
                                    'Joined',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                )
                              : OutlinedButton(
                                  onPressed: () {
                                    DatabaseService(userId: widget.userId)
                                        .joinGroup(groupData.groupId);
                                  },
                                  child: const Text(
                                    'Join',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                        );
                      }));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
