
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/task.dart';

class todoList extends StatefulWidget {
  const todoList({Key? key}) : super(key: key);
  @override
    State<todoList> createState() => _TodoListState();
}

class _TodoListState extends State<todoList> {
  String _newTasktitle = '';
  String _newTaskDescription = '';
  List<Task> todoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList.addAll([],);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
              key: Key(todoList[index].title),
              child: Card(
               color: Colors.deepPurple,
                child: ListTile(
                  title: Text(todoList[index].title,
                  style: Theme.of(context).textTheme.caption,),
                  subtitle: Text(todoList[index].description,
                    style: const TextStyle(color: Colors.white),),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete,color: Colors.white),
                    onPressed: (){
                      setState(() {
                        todoList.removeAt(index);
                      });},
                  ),
                ),
              ),
            );
          }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _newTaskDescription = "";
          _newTasktitle = "";
          showDialog(context: context,
              builder: (BuildContext context){
               return AlertDialog(
                 title: const Text('Add Today Todolist', style: TextStyle(color:Colors.deepPurpleAccent),textAlign: TextAlign.center,),
                 content: SizedBox(
                   height: 200,
                   child: Column(
                     children: [
                       Divider(
                         color: Theme.of(context).primaryColor,
                       ),
                        TextField(style: const TextStyle(color: Colors.deepPurpleAccent),
                         decoration: const InputDecoration (
                           border: OutlineInputBorder(),
                           labelText: 'Task Name ',
                           hintText: 'Enter Text',
                         ),
                         onChanged: (String value){
                           _newTasktitle = value;
                         },
                       ),
                       const SizedBox(
                         height: 30,
                       ),
                       TextField(style: const TextStyle(color: Colors.deepPurpleAccent),
                         decoration: const InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: 'Description',
                           hintText: 'Enter Description',
                         ),
                         onChanged: (String value){
                           _newTaskDescription = value;
                         },
                       )
                     ],
                   ),

                 ),
               actions: [
                 ElevatedButton(
                   child: Text('Cancel',style: Theme.of(context).textTheme.caption,),
                     onPressed: (){
                       Navigator.of(context).pop();
                     },
                 ),

                 ElevatedButton(
                   child: Text('Create',style: Theme.of(context).textTheme.caption,),
                   onPressed: (){
                     if(_newTasktitle == '' && _newTaskDescription == '') return;
                     setState(() {
                       todoList.add(Task(title: _newTasktitle, description: _newTaskDescription));
                     });
                     Navigator.of(context).pop();
                   },
                 ),

               ],
               );
              }
          );
        },
        child: const Icon(Icons.add,
        color: Colors.white,),
      ),
    );
  }
}

