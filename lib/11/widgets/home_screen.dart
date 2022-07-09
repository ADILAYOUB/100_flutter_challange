import 'package:flutte_challange/11/constants/string/image_url.dart';
import 'package:flutter/material.dart';

import '../constants/list_services.dart';
import 'scroll_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

ImageUrl imageUrl = ImageUrl();

class _HomePageState extends State<HomePage> {
  int isSelected = 0;

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
              const Positioned(top: 200.0, child: MyList())
            ],
          ),
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              image: NetworkImage(
                imageUrl.backImageOne,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                  child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(imageUrl.avatar),
              )),
              const Positioned(
                  left: 8.0,
                  bottom: 8.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Adil Ayoub',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 4),
                      Text(
                        'Subtitle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )),
              const Positioned(
                  left: 8.0,
                  bottom: 28.0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Location',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ))
            ],
          ),
        );
      },
    );
  }
}
