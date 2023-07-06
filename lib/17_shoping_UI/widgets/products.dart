import 'package:flutte_challange/17_shoping_UI/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../data/local_data.dart';
import '../screens/product_detail.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
        crossAxisCount: 2,
        childAspectRatio: 0.68,
        crossAxisSpacing: 3.w,
        mainAxisSpacing: 1.5.h,
        children: List.generate(
            productList.length,
            (index) => ProductItem(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetail(model: productList[index])));
                },
                model: productList[index])));
  }
}
