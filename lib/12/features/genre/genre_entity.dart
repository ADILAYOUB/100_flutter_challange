// this will map all of the data coming from the api and then we can use
// to map to the genre class
import 'package:flutter/material.dart';

@immutable
class GenreEntity {
  final int id;
  final String name;
  const GenreEntity({required this.id, required this.name});
  // create the named constructor
  // it will be responsilbe for the maping it to Genre Entity object
  factory GenreEntity.fromMap(Map<String, dynamic> map) {
    // here we will return the new instance of the genreEntity and map the id and name to the constructor
    return GenreEntity(id: map['id'], name: map['name']);
  }
  @override
  String toString() => 'GenreEntity(id: $id, name: $name)';

  //? You can use packages such as equatable
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GenreEntity && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

// go to genre.dart 
