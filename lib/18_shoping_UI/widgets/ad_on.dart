import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../data/local_data.dart';

class AdOnIcons extends StatelessWidget {
  const AdOnIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      height: 15.h,
      child: Center(
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(height: 2.h),
                  GestureDetector(
                    onTap: () => [index],
                    child: Container(
                      padding: EdgeInsets.all(2.h),
                      height: 7.h,
                      width: 7.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.green,
                              offset: Offset(0, 1),
                            )
                          ]),
                      //        child: SvgPicture.asset(
                      //   itemList[index].iconAsset,
                      //   fit: BoxFit.fitHeight,
                      //   color: Colors.teal.shade400,
                      // ),
                      child: Icon(
                          // Access the iconAsset property of the TabItemModel
                          // and create an Icon widget using the corresponding IconData.
                          IconData(
                        itemList[index].iconCodePoint,
                        fontFamily:
                            'MaterialIcons', // Replace with the appropriate font family if needed
                      )
                          // You can specify additional properties for the Icon widget here.
                          // For example, you can set the color using `color: Colors.blue`.
                          ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  // Text(
                  //   (itemList[index].title),
                  //   style: AppTextStyles.verySmallText,
                  // ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 4.w);
            }),
      ),
    );
  }
}
