
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class todoList extends StatefulWidget {
  @override
  createState() => TodoListState();
}

class TodoListState extends State<todoList> {
  final List<String> _todoItems = [];

  // This will be called each time the + button is pressed
  // void _addTodoItem() {
  //   // Putting our code inside "setState" tells the app that our state has changed, and
  //   // it will automatically re-render the list
  //   setState(() {
  //     int index = _todoItems.length;
  //     _todoItems.add('Item ' + index.toString());
  //   });
  // }

  Widget _buildTodoList() {
    return  ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_todoItems[index]),
          );
        }
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText) {
    return  ListTile(
        title: Text(todoText)
    );
  }

// Instead of autogenerating a todo item, _addTodoItem now accepts a string
  void _addTodoItem(String task) {
    // Only add the task if the user actually entered something
    if(task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
          title: const Text('Todo List')
      ),
      body: _buildTodoList(),
      floatingActionButton:  FloatingActionButton(
          onPressed: _pushAddTodoScreen,
          tooltip: 'Add task',
          child: const Icon(Icons.add)
      ),
    );
  }


  void _pushAddTodoScreen() {
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well
      // as adding a back button to close it
         MaterialPageRoute(
            builder: (context) {
              return  Scaffold(
                  appBar:  AppBar(
                      title: const Text('Add a new task')
                  ),
                  body:  TextField(
                    autofocus: true,
                    onSubmitted: (val) {
                      _addTodoItem(val);
                      Navigator.pop(context); // Close the add todo screen
                    },
                    decoration: const InputDecoration(
                        hintText: 'Enter something to do...',
                        contentPadding:  EdgeInsets.all(16.0)
                    ),
                  )
              );
            }
        )
    );
  }

}

