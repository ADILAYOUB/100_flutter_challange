import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../models/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          const Icon(Icons.favorite_border_rounded),
          SizedBox(width: 4.w),
          const Icon(Icons.share),
          SizedBox(width: 4.w),
          const Icon(
            Icons.shopping_bag, // Use the shopping bag icon from Material Icons
            // Customize the appearance of the icon using properties such as size, color, etc.
            size: 24, // Adjust the size as needed
            color: Colors.black, // Adjust the color as needed
          ),
          SizedBox(width: 4.w),
        ],
      ),
      body: const Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ))
        ],
      ),
    );
  }
}
