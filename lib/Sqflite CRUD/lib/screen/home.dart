import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'package:sqflite/sqflite.dart';

class Person implements Comparable {
  final int id;
  final String firstName;
  final String lastName;

  const Person({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  Person.fromRow(Map<String, Object?> row)
      : id = row['ID'] as int,
        firstName = row['FIRST_NAME'] as String,
        lastName = row['LAST_NAME'] as String;

  @override
  int compareTo(covariant Person other) => other.id.compareTo(id);

  @override
  bool operator ==(covariant Person other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class PersonDatabase {
  final String dbName;
  Database? _db;
  List<Person> _persons = [];
  final _streamController = StreamController<List<Person>>.broadcast();

  PersonDatabase({required this.dbName});

  Future<bool> open() async {
    if (_db != null) {
      return true;
    }
    final directory = await p.getApplicationDocumentsDirectory();
    final path = '${directory.path}/$dbName';

    try {
      final db = await openDatabase(path);
      _db = db;

      const create = '''CREATE TABLE IF NOT EXISTS PEOPLE(
              ID INTEGER PRIMARY KEY AUTOINCREMENT,
              FIRST_NAME STRING NOT NULL,
              LAST_NAME STRING NOT NULL
      )''';

      await db.execute(create);

      _persons = await _fetchPeople();

      _streamController.add(_persons);
      return true;
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  Future<List<Person>> _fetchPeople() async {
    final db = _db;
    if (db == null) {
      return [];
    }
    try {
      final read = await db.query(
        'PEOPLE',
        distinct: true,
        columns: [
          'ID',
          'FIRST_NAME',
          'LAST_NAME',
        ],
        orderBy: 'ID',
      );

      final people = read.map((row) => Person.fromRow(row)).toList();
      return people;
    } catch (e) {
      log("Error fetching people: $e");
      return [];
    }
  }

  Future<bool> close() async {
    final db = _db;
    if (db == null) {
      return false;
    }
    await db.close();
    return true;
  }

  Stream<List<Person>> getPeopleStream() {
    return _streamController.stream;
  }

  Future<void> addPerson(String firstName, String lastName) async {
    final db = _db;
    if (db == null) {
      return;
    }

    final values = {
      'FIRST_NAME': firstName,
      'LAST_NAME': lastName,
    };

    try {
      final id = await db.insert('PEOPLE', values);
      final person = Person(
        id: id,
        firstName: firstName,
        lastName: lastName,
      );

      _persons.add(person);
      _streamController.add(_persons);
    } catch (e) {
      log("Error adding person: $e");
    }
  }

  // Not working you can fix it to delete the list from the database
  Future<bool> deleteName(String name) async {
    final db = _db;
    if (db == null) {
      return false;
    }
    try {
      final int rowsAffected = await db.rawDelete(
        'DELETE FROM PEOPLE WHERE FIRST_NAME = ? OR LAST_NAME = ?',
        [name, name],
      );
      return rowsAffected > 0;
    } catch (e) {
      log('Error deleting name $name: $e');
      return false;
    }
  }
}

class Sqflite extends StatefulWidget {
  const Sqflite({super.key});

  @override
  State<Sqflite> createState() => _SqfliteState();
}

class _SqfliteState extends State<Sqflite> {
  late final PersonDatabase _personDatabase;
  List<String> names = [];

  @override
  void initState() {
    super.initState();
    _personDatabase = PersonDatabase(dbName: 'my_db');
    _personDatabase.open();
    _personDatabase.getPeopleStream().listen((people) {
      setState(() {
        names = people
            .map((person) => '${person.firstName} ${person.lastName}')
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _personDatabase.close();
    super.dispose();
  }

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      appBar: AppBar(
        title: const Text('SQFlite Demo'),
      ),
      body: Column(
        children: [
          ComposeWidget(
            onCompose: (firstName, lastName) {
              _personDatabase.addPerson(firstName, lastName);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                final name = names[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onDismissed: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      final removedName = names[index];
                      final deleted =
                          await _personDatabase.deleteName(removedName);
                      if (deleted) {
                        setState(() {
                          names.removeAt(index);
                        });
                        await _personDatabase
                            ._fetchPeople(); // Fetch the updated data after deleting a name
                        scaffoldMessengerKey.currentState?.showSnackBar(
                          SnackBar(
                            content: Text('Deleted $removedName successfully'),
                          ),
                        );
                      }
                    }
                  },
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Phone number',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: 'First Name',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10.0),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: const EdgeInsets.only(bottom: 10.0),
            child: TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                hintText: 'Last Name',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10.0),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: const EdgeInsets.only(bottom: 10.0),
            child: TextButton(
              onPressed: () {
                final firstName = firstNameController.text;
                final lastName = lastNameController.text;
                widget.onCompose(firstName, lastName);
                firstNameController.clear();
                lastNameController.clear();
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Add ',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
