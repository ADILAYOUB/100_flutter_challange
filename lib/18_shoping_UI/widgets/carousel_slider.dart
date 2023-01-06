import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainCarouselSlider extends StatefulWidget {
  const MainCarouselSlider({super.key});

  @override
  State<MainCarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<MainCarouselSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<Widget> imageList = [
    Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.network(
              'https://img.freepik.com/free-photo/shopping-trolleys-packets-tags_23-2147961897.jpg?w=740&t=st=1688454828~exp=1688455428~hmac=94fbdade29620b3bad2e17221f8ffa46537e77668f6e40dda3d42a1874233cea',
              fit: BoxFit.fitHeight,
              height: 40.h),
        )
      ],
    ),
    Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.network(
              'https://img.freepik.com/premium-photo/fast-delivery-by-scooter-van-mobile_156429-975.jpg?w=740',
              fit: BoxFit.fitHeight,
              height: 40.h),
        )
      ],
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          height: 40.h,
          child: CarouselSlider(
            carouselController: _controller,
            items: imageList,
            options: CarouselOptions(
                height: 40.h,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInOut,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = 0;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: imageList.asMap().entries.map((e) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(e.key),
              child: AnimatedContainer(
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
                width: 6.0,
                height: 2.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == e.key ? 0.9 : 0.2),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
