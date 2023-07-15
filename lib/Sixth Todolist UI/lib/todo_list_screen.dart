import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'assets.dart';
import 'todo_categories.dart';
import 'widgets/list_item.dart';
import 'widgets/recent_todo.dart';

class TodoHomeThreePage extends StatelessWidget {
  static const String path = "lib/src/pages/todo/todo_home3.dart";

  const TodoHomeThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    var orangeTextStyle = const TextStyle(
      color: Colors.deepOrange,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 4.0,
                width: 18.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              const SizedBox(height: 4.0),
              Container(
                height: 4.0,
                width: 12.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: CircleAvatar(
              maxRadius: 15.0,
              backgroundImage: NetworkImage(avatars[0]),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            "Todo Lists",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Expanded(
                child: buildTodoCategory(FontAwesomeIcons.calendarCheck,
                    "All Todo", Colors.deepOrange.withOpacity(0.7)),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: buildTodoCategory(FontAwesomeIcons.lock,
                    "My private notes", Colors.blue.withOpacity(0.6)),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Expanded(
                child: buildTodoCategory(FontAwesomeIcons.bookmark,
                    "Bookmarked Todos", Colors.indigo.withOpacity(0.7)),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: buildTodoCategory(
                    FontAwesomeIcons.file, "Templates", Colors.greenAccent),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            "Recently Opened Todos",
            style: orangeTextStyle,
          ),
          const SizedBox(height: 10.0),
          buildRecenttodoRow(avatars[2], "Brand Guideline"),
          const SizedBox(height: 5.0),
          buildRecenttodoRow(avatars[3], "Project Grail Sprint plan"),
          const SizedBox(height: 5.0),
          buildRecenttodoRow(avatars[4], "Personal Todo"),
          const SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              Text(
                "Channels/Group",
                style: orangeTextStyle,
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                color: Colors.greenAccent,
                onPressed: () {},
              ),
            ],
          ),
          buildChannelListItem("Tixio 2.0"),
          buildChannelListItem("Project Grail"),
          buildChannelListItem("Fun facts"),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5.0,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 16.0),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
              color: Colors.deepOrange,
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {},
            ),
            const SizedBox(width: 16.0),
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        onPressed: () {},
        color: Colors.green,
        textColor: Colors.white,
        minWidth: 0,
        elevation: 4.0,
        padding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
