import 'package:flutte_challange/11/constants/string/image_url.dart';
import 'package:flutter/material.dart';

import '../constants/list_services.dart';
import '../screens/detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 0;
  ImageUrl imageUrl = ImageUrl();
  List<String> imageUrls = [
    'https://images.unsplash.com/photo-1605497788044-5a32c7078486?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMjA3fDB8MXxzZWFyY2h8NHx8YmFyYmVyfHwwfHx8fDE2Mjc4ODE3NjQ&ixlib=rb-1.2.1&q=80&w=1080',
    'https://images.pexels.com/photos/2035310/pexels-photo-2035310.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://th.bing.com/th/id/R.ef94b7a99d630cd967977812355dcb94?rik=dVDXWgGJ6udEvA&riu=http%3a%2f%2fthetailoredmaleofeastsetauket.com%2fwp-content%2fuploads%2f2021%2f05%2ftwo-men-inside-room-2775269-scaled-1.jpg&ehk=4txc1ui6v%2bxcQGM%2bR0FK74LtWGYrpXlhv4GBZd%2fs7k8%3d&risl=&pid=ImgRaw&r=0',
    'https://i2.wp.com/hiphopbarberssupply.com/wp-content/uploads/2021/01/pexels-photo-2035310.jpeg?resize=683%2C1024&ssl=1',
    'https://th.bing.com/th/id/OIP.HVD8K2amfC70COVT2lQa2gHaI8?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.Y2d03zvMFUxesZHMl_1QRgHaJQ?pid=ImgDet&rs=1'
  ];

  List<String> avatars = [
    'https://thumbs.dreamstime.com/b/m-czyzna-z-brody-avatar-postaci-kresk-wki-profilu-obrazkiem-i-niebieskich-oczu-obrazka-wektorowym-ilustracyjnym-graficznym-149677820.jpg',
    'https://thumbs.dreamstime.com/b/cartoon-man-beard-icon-flat-design-cartoon-young-man-beard-icon-over-white-background-vector-illustration-160769419.jpg',
    'https://unndoo.com/blog/wp-content/uploads/2021/07/UD_foreheadbeard.gif',
    'https://thumbs.dreamstime.com/b/bearded-man-character-bearded-man-character-white-background-vector-illustration-144722568.jpg',
    'https://thumbs.dreamstime.com/b/cute-man-face-cartoon-vector-illustration-graphic-design-cute-man-face-cartoon-135024562.jpg',
    'https://thumbs.dreamstime.com/b/cartoon-man-beard-flat-design-cartoon-man-beard-icon-over-white-background-vector-illustration-160769853.jpg'
  ];

  List<String> names = [
    'Olivia',
    'Ava',
    'Isabella',
    'Sophia',
    'Jackson',
    'Aiden'
  ];

  List<String> subtitle = [
    "Unleash your hair's true potential!",
    "Transforming hair, one style at a time.",
    "Experience hair perfection in every cut.",
    "Unlock a world of stunning hairstyles.",
    "Where hair dreams become a reality.",
    "Elevate your style with our expert touch."
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Stack(
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 98.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(serviceType.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = index;
                              });
                            },
                            child: Container(
                              width: 90,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: isSelected == index
                                    ? const Color(0xFF1EFFAE)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Center(
                                child: Text(
                                  serviceType[index],
                                  style: TextStyle(
                                      color: isSelected == index
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      GestureDetector(
                        onTap: () {
                          String selectedImage = imageUrls[index];
                          String selectedName = names[index];
                          String selectedSubtitle = subtitle[index];

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      imageUrl: selectedImage,
                                      name: selectedName,
                                      subtitle: selectedSubtitle)));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Image.network(
                              imageUrls[index],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 8.0,
                          left: 8.0,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(avatars[index]),
                          )),
                      Positioned(
                        top: 18.0,
                        left: 80.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              names[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              subtitle[index],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]);
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
