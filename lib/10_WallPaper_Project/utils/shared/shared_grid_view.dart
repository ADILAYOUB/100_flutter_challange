import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/wallpaper.dart';
import '../../view/view_photo_onclick.dart';
import '../colors.dart';

// ignore: must_be_immutable

class SharedGridWidget extends StatelessWidget {
  final List<Wallpaper> wallpapers;
  const SharedGridWidget({Key? key, required this.wallpapers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            childAspectRatio: 2 / 2.7,
          ),
          itemCount: wallpapers.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.to(() => WallpaperView(
                        wallpaper: wallpapers[index],
                      ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: pinkcolor,
                    ),
                    child: Hero(
                      tag: wallpapers[index].urls.regular,
                      child: Image.network(
                        wallpapers[index].urls.regular,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
