import 'package:flutte_challange/11/constants/string/image_url.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<String> dates = ['13 ', '14 ', '15 ', '16 '];
  String month = "May";
  List<String> days = ['Fri', 'Sat', 'Sun', 'Mon'];
  int selectedColumnIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: Colors.grey.shade800,
          ),
          child: Center(
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
          ),
        ),
        title: const Center(
          child: Text(
            'Book Now',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            ImageUrl().profilePic,
                          ),
                          maxRadius: 38,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Adil Ayoub",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Gadi Seer",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey.shade800,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Avalable Slots",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: Colors.black87,
                        ),
                        child: const Icon(
                          Icons.tune_outlined,
                          size: 28,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Text(
                        "Select Date",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02,
                            bottom: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(4, (index) {
                              bool isSelected = (index == selectedColumnIndex);
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColumnIndex = index;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.182,
                                  height:
                                      MediaQuery.of(context).size.width * 0.33,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: isSelected
                                        ? const Color(0xFF1EFFAE)
                                        : const Color.fromARGB(
                                            255, 129, 124, 124),
                                    borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.08,
                                    ),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.016,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        dates[index],
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        month,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '|',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        days[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    height: 120,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: const Color.fromARGB(255, 85, 79, 79),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'From',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '5:00PM',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                        Center(
                          child: Text(
                            '>',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'To',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '6:00PM',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 70.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(90,
                          90), // Increase the width and height values as per your requirement
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
                    onTap: () {},
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
                          'Continue Booking',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.grey.shade400,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.grey.shade200,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
