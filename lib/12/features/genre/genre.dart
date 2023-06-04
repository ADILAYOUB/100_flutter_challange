// ignore_for_file: public_member_api_docs, sort_constructors_first
//Model to get the data
import 'package:flutter/material.dart';

@immutable //unidirection data flow
class Genre {
  final String name;
  final bool isSelected;
  final int id;
  const Genre({
    required this.name,
    this.isSelected = false,
    this.id = 0,
  });

  Genre toggleSelected() {
    // function return new instance of genre
    // this is one example where we integrate uni directionsl data flow
    // we are not mutating values directly we creat a copy
    return Genre(
      name: name,
      id: id,
      isSelected: !isSelected,
    );
  }

  //override toString
  @override
  String toString() => 'Genre(name: $name,id:$id,isSelected: $isSelected )';

  //compare the obj as well as override the hashcode
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Genre &&
        other.name == name &&
        other.id == id &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ isSelected.hashCode;
}
