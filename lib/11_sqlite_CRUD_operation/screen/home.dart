import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// to compare with the compare function BASE CLASS)
class Person implements Comparable {
  final int id;
  final String firstName;
  final String lastName;

  const Person({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  // from here we pass / get a map of string and obj(optional)
  Person.fromRow(Map<String, Object?> row)
      : id = row['ID'] as int,
        firstName = row['FIRST_NAME'] as String,
        lastName = row['LAST_NAME'] as String;

  // compare to takes two parameter to be compare
  @override
  int compareTo(covariant Person other) =>
      other.id.compareTo(id); //reverse order last on first

  /* override == operator because if the firstName and lastName of two user be
     same then we should not delete base on the these two parameter rather based
     on the id 
  */

  @override
  bool operator ==(covariant Person other) => id == other.id;

  // to override the hashcode of id
  @override
  int get hashCode => id.hashCode;
}

//create a db and put these objects in the database  and connection to the db
//plugin used is sqflite and for the directory permission using path_provider

class PersonDataBase {
  // one of the min component of this class is the it have a stream Controller
  // because it will be expose to the stream of person objects to its consumer which is going to be home page
  // with in the stream will give us a array of person as we update detelet we are going to work with the stream
//1. wer are going to ask the consumer of this class to pass the db name ;
  final String dbName;
  // work with the db object so a database object is define in sqflite so import it
  // here in this package you can find the class openDatabase which is a future and abstract class
  // so when we work with db we need to hold the object of db class and execute our quries on that
  Database? _db; //by default the db id null until we call a fun open();
  List<Person> _persons = [];
  // create a streamcontroller of type list of person bec it is going to contain list of person and this is going to be a broadcast
  //for stream controller we have to import the dart:async
  // if we don't use broadcast we will not be able to do hot reload bec on H R we are building the build fun and stram is going to subscribe again
  // and we can't do that that to listen the stream on building the build fun bec we are already subscribed and can't do it again that is why we need to do broadcast thus no hotreload the build fun get called and then we will subscribe the broadcast of this stream controller again
  final _streamController = StreamController<List<Person>>.broadcast();
  PersonDataBase({required this.dbName});
  //create a fun open to open the db
  // we choose future bool bec we are going to handle error here based the true and flase of the return type
  Future<bool> open() async {
    // if we already have a db
    if (_db != null) {
      return true;
    }
    //other wise we are going to open the db
    // create the db path in directory using path_provider package
    final directory = await getApplicationDocumentsDirectory();
    final path =
        '${directory.path}/$dbName'; //passed the db name which is pass to us on creation

    //let us do try and catch
    try {
      //her we are doing something that is going to or may produce an error
      //Command one need to know when working with sqfile is open the db and there is path to it
      final db = await openDatabase(path); // it returns a future of db
      _db = db; // save the db in private instance we created

      //Create a table with three single quotes and write the sql query of create table
      const create = ''' CREATE TABLE IF NOT EXISTS PEOPLE(
              ID INTEGER PRIMARY KEY AUTOINCREMENT,
              FIRST_NAME STRING NOT NULL,
              LAST_NAME STRING NOT NULL,
      )''';
      //LET us execute this  commond and create a db table
      await db.execute(create);
      //as we open the db we need to read the content of the db and place it in some sort of array
      // create an array above List<Person> _persons

      //Read all existing Person objects from the db
      _persons = await _fetchPeople();
      //as soon as we read the data we are going to place them inside our array _persons private veriable

      // now we got all the local copy of all the data we have read form the db
      // now how we are going to give this data back to the home page for that we need STREAME controller
      // streame controller is your gateway in containing a stream for both read and write
      //let us then define a stream controller
      // now we have stream controller let us add persons to our controller
      _streamController.add(_persons);
      return true;
    } catch (e) {
      log('This is error message $e');
      return false;
    }
  }

  //create a fun that returns all the instances of person class within our table
  //create a fun
  Future<List<Person>> _fetchPeople() async {
    // the goal of this fun is to be called from the open function
    // check first db has been created
    final db = _db;
    if (db == null) {
      return [];
    }
    try {
      //let us execute a read query
      final read = await db.query(
        'PEOPLE',
        distinct: true,
        columns: [
          'ID',
          'FIRST_NAME',
          'LAST_NAME',
        ],
        orderBy: 'ID',
      ); // it return a list of string map of objects so it is a list of dictonary with keys of type string with value of optional objects

      //this read so be transferred to the list of person object thus we have to map this list to a list of person
      // for that we have to crete a function in Person class Person.fromRow()

      final people = read.map((row) => Person.fromRow(row)).toList();
      return people;
    } catch (e) {
      log("error fetching people $e");
      return [];
    }
  }

  //as we have open fun let us create a close fun
  Future<bool> close() async {
    final db = _db;
    if (db == null) {
      return false;
    }
    await db.close();
    return true;
  }

  // we need to ensure that we can return the list of person that we fetch here for that we have stream controller
  // but the stream controller here are private to this class
  // from the consumers point of view they are not interested in stream controller they're interested in a stream
// so let us expose that
//let us sort => stream.map()
  Stream<
      List<Person>> all() => _streamController.stream.map((persons) => persons
    ..sort()); // this will return the sort list of List of persons => which inturn call the compareto function and it's going to sort them in reverse chronological order

}

//Create the instance of the person class

class Sqflite extends StatefulWidget {
  const Sqflite({Key? key}) : super(key: key);

  @override
  State<Sqflite> createState() => _SqfliteState();
}

class _SqfliteState extends State<Sqflite> {
  late final PersonDataBase _crudStorage;
  @override
  void initState() {
    _crudStorage = PersonDataBase(dbName: 'db.sqlite');
    _crudStorage.open();
    super.initState();
  }

  @override
  void dispose() {
    _crudStorage.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CRUD sqflite',
        ),
      ),
      body: StreamBuilder(
        stream: _crudStorage.all(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              if (snapshot.data == null) {
                const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final people = snapshot.data as List<Person>;
              return Column(
                children: [
                  ComposeWidget(
                    onCompose: (firstName, lastName) async {},
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: people.length,
                        itemBuilder: (context, index) {
                          final person = people[index];
                          return ListTile();
                        }),
                  ),
                ],
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

//call back definition from the TextButton onPress
typedef OnCompose = void Function(String firstName, String lastName);

class ComposeWidget extends StatefulWidget {
  final OnCompose onCompose;
  const ComposeWidget({Key? key, required this.onCompose}) : super(key: key);

  @override
  State<ComposeWidget> createState() => _ComposeWidgetState();
}

class _ComposeWidgetState extends State<ComposeWidget> {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: firstNameController,
          decoration: const InputDecoration(hintText: 'Enter First Name'),
        ),
        TextField(
          controller: lastNameController,
          decoration: const InputDecoration(hintText: 'Enter Last Name'),
        ),
        TextButton(
            onPressed: () {
              final firstName = firstNameController.text;
              final lastName = lastNameController.text;
              widget.onCompose(firstName, lastName);
              firstNameController.clear();
              lastNameController.clear();
            },
            child: const Text(
              "Add Item ",
              style: TextStyle(fontSize: 24),
            )),
      ],
    );
  }
}
