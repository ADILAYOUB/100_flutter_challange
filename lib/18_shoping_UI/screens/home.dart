import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/ad_on.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          // silver appbar
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 0,
            title: const Text('HI'), // search bar
            toolbarHeight: 12.h,
            collapsedHeight: 16.h,
            pinned: true,
            expandedHeight:
                MediaQuery.sizeOf(context).height < 700 ? 60.h : 53.h,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              title: Container(
                color: Colors.grey.shade100,
                padding: EdgeInsets.only(
                    top: 2.h, left: 5.w, right: 5.w, bottom: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Sale Products',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    InkWell(
                      child: Text(
                        'See more',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.teal,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ), //
              titlePadding: EdgeInsets.zero,
              expandedTitleScale: 1,
              background: const Column(
                children: [
                  // create widget
                  MainCarouselSlider(),
                  AdOnIcons()
                ],
              ),
            ),
          ),
          const Products(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          elevation: 0,
          selectedItemColor: Colors.amber.shade500,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 28,
              ),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 28,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 28,
              ),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
