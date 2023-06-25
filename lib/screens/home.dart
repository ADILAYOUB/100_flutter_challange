import 'package:flutte_challange/models/group.dart';
import 'package:flutte_challange/screens/chat.dart';
import 'package:flutte_challange/screens/search.dart';
import 'package:flutte_challange/services/database.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';
import '../shared/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userId});
  final String userId;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController groupController = TextEditingController();
  @override
  void dispose() {
    groupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.person_2_rounded,
              size: 32,
              color: Colors.pinkAccent,
            ),
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          'Chat  Room',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 2),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.search_rounded,
              size: 32,
              color: Colors.pinkAccent,
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(
        userId: widget.userId,
      ), // Pass the actual user ID

      floatingActionButton: FloatingActionButton(
        elevation: 12,
        backgroundColor: backgroundColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Create New Group'),
                  content: TextField(
                    controller: groupController,
                    decoration: InputDecoration(
                      label: const Text('Group Name'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.pinkAccent,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        OutlinedButton(
                          onPressed: () async {
                            if (groupController.text.isNotEmpty) {
                              await DatabaseService(userId: widget.userId)
                                  .createGroup(groupController.text);
                              groupController.text = "";
                              if (mounted) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Grtoup Created Successfully"),
                                  ),
                                );
                              }
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
                            'Create',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          size: 24,
          color: Colors.pinkAccent,
        ),
      ),

      body: StreamBuilder(
          stream: DatabaseService(userId: widget.userId).fetchJoinedGroup(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return const Center(
                  child: Text(
                      'No Group Joined \n Either Search or Join the Group'),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  GroupModel groupData = snapshot.data[index];
                  bool isAdmin = groupData.admin == widget.userId;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: backgroundColor,
                      child: Text(
                          groupData.groupName.substring(0, 1).toUpperCase()),
                    ),
                    title: Text(groupData.groupName),
                    subtitle: groupData.recentMessage == ''
                        ? const Text('Start Conversation')
                        : Text(groupData.recentMessage),
                    trailing: isAdmin
                        ? const Icon(Icons.person)
                        : const Icon(Icons.chat),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                groupModel: groupData, userId: widget.userId),
                          ));
                    },
                  );
                },
              );
            }

            return const LinearProgressIndicator();
          }),
    );
  }
}
