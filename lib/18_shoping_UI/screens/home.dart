import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar is a flexible app bar that can expand and collapse.
          SliverAppBar(
            title: Text(
              'My Custom Scroll View',
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            expandedHeight: 20.h,
            flexibleSpace: Image.network(
              'https://miro.medium.com/v2/resize:fit:1100/format:webp/1*Ktvy6_Ldzx9CjrrK3Vg9Fw.png',
              fit: BoxFit.cover,
            ),
          ),

          // SliverList displays a list of items in a vertical scrollable layout.
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 5,
            ),
          ),

          // SliverGrid displays a grid of items in a scrollable layout.
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('Grid Item $index'),
                  ),
                );
              },
              childCount: 6,
            ),
          ),
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
