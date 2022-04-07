// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:eng/10_WallPaper_Project/controller/home_controller.dart';
import 'package:eng/10_WallPaper_Project/utils/colors.dart';
import 'package:eng/10_WallPaper_Project/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/shared/shared_grid_view.dart';

class HomeWallpaper extends StatelessWidget {
  const HomeWallpaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Wallpaper",
            style: h1,
          ),
          centerTitle: true,
          backgroundColor: whitecolor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: greyColor,
              ),
            ),
          ],
          bottom: const TabBar(
              indicatorColor: Colors.transparent,
              labelColor: pinkcolor,
              unselectedLabelColor: greyColor,
              tabs: [
                Text(
                  "LATEST",
                  style: links,
                ),
                Text(
                  "TRENDING",
                  style: links,
                ),
                Text(
                  "TOP",
                  style: links,
                ),
              ]),
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (_) {},
          builder: (controller) {
            return TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                controller.state
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SharedGridWidget(
                        wallpapers: controller.todaysList,
                      ),
                controller.state
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SharedGridWidget(
                        wallpapers: controller.popularList,
                      ),
                controller.state
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SharedGridWidget(
                        wallpapers: controller.oldestList,
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
