import 'dart:ui';

import 'package:flutter/material.dart';

import 'book_now.dart';

class DetailScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String subtitle;

  const DetailScreen({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).size.height / 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: Colors.black87,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: MediaQuery.of(context).size.height / 2,
          child: Container(color: Colors.black),
        ),
        Positioned(
          top: 280.0,
          left: 40.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 300,
                  ),
                  Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xFF1EFFAE),
                        ),
                        Text(
                          '4.3',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 24,
                    color: Colors.white,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Positioned.fill(
          top: 350,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularContainer(text: 'Haircut', subtitle: '\$80'),
                    CircularContainer(text: 'Shampooing', subtitle: '\$50'),
                    CircularContainer(text: 'Beard Trimming', subtitle: '\$30'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularContainer(
                        text: 'Hot Towel Shave', subtitle: '\$240'),
                    CircularContainer(
                        text: 'Facial Grooming', subtitle: '\$100'),
                    CircularContainer(text: 'Hair Styling', subtitle: '\$40'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Positioned.fill(
          top: 530,
          child: BabarHairCutWidget(),
        ),
        Positioned.fill(
            left: 50,
            right: 50,
            top: 600,
            bottom: 10,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(800,
                          800), // Increase the width and height values as per your requirement
                    ),
                    maximumSize: MaterialStateProperty.all<Size>(
                      const Size(800, 800.0),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50), // Adjust the border radius for a circular shape
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey.shade900,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BookNow()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          height: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF1EFFAE)),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black54,
                            size: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Book Now',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.grey.shade400,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.black38,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}

class CircularContainer extends StatefulWidget {
  final String text;
  final String subtitle;

  const CircularContainer({
    super.key,
    required this.text,
    required this.subtitle,
  });

  @override
  State<CircularContainer> createState() => _CircularContainerState();
}

class _CircularContainerState extends State<CircularContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 95,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: isSelected
                ? [
                    const Color(0xFF1EFFAE),
                    const Color(0xFF1EFFAE),
                  ]
                : [
                    const Color.fromARGB(255, 41, 34, 35),
                    const Color.fromARGB(31, 73, 72, 72),
                  ],
          ),
        ),
        child: Column(
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              widget.subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BabarHairCutWidget extends StatefulWidget {
  const BabarHairCutWidget({super.key});

  @override
  BabarHairCutWidgetState createState() => BabarHairCutWidgetState();
}

class BabarHairCutWidgetState extends State<BabarHairCutWidget> {
  bool showFullText = true;

  @override
  Widget build(BuildContext context) {
    const String fullText =
        "Babar decided to cut his hair. It had been a long time since his last haircut, "
        "and his hair had become quite unruly. He sat in front of the mirror, took a pair "
        "of scissors, and started trimming his locks. Snip, snip, snip. As the hair fell "
        "to the ground, Babar felt a sense of relief. His new haircut made him feel lighter "
        "and more refreshed. He was pleased with the results.";

    final textWidget = Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: Text(
        fullText,
        maxLines: showFullText ? null : 6,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );

    final showMoreWidget = GestureDetector(
      onTap: () {
        setState(() {
          showFullText = !showFullText;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          showFullText ? 'Read more' : 'Read less',
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF1EFFAE),
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget,
        if (fullText.length > 2) showMoreWidget,
      ],
    );
  }
}
