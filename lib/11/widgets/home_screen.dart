import 'package:flutte_challange/11/constants/string/image_url.dart';
import 'package:flutter/material.dart';

import 'scroll_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImageUrl imageUrl = ImageUrl();
  int isSelected = 0;
  List<String> serviceType = [
    'Hair',
    'Beard',
    'Shampoo',
    'Masaj',
    'Waxing',
    'Facial',
    'Manicure',
    'Pedicure',
    'Massage',
    'Trimming',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Stack(
            children: [
              Positioned(
                top: 8.0,
                left: 8.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl.profilePic,
                    scale: 8,
                  ),
                ),
              ),
              const Positioned(
                top: 8.0,
                left: 60.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Adil Ayoub",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Gadi Seer",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                child: MySingleChildScrollView(
                  isSelected: isSelected,
                  serviceType: serviceType,
                  onItemSelected: (index) {
                    setState(() {
                      isSelected = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
