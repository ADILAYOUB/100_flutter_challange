import 'package:flutte_challange/11/constants/string/image_url.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImageUrl imageUrl = ImageUrl();
  List<bool> isSelected = List.generate(10, (index) => false);
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 72.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: isSelected[index]
                                ? const Color(0xFF1EFFAE)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Center(
                            child: Text(
                              serviceType[index],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
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
        ),
      ),
    );
  }
}
