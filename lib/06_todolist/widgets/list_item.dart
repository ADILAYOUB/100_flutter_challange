import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Row buildChannelListItem(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      const Icon(
        FontAwesomeIcons.circle,
        size: 16.0,
      ),
      const SizedBox(width: 10.0),
      Text(title),
      const Spacer(),
      IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {},
      ),
    ],
  );
}
