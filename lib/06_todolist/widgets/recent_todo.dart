import 'package:flutter/material.dart';

Row buildRecenttodoRow(String avatar, String title) {
  return Row(
    children: <Widget>[
      CircleAvatar(
        radius: 15.0,
        backgroundImage: NetworkImage(avatar),
      ),
      const SizedBox(width: 10.0),
      Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}
