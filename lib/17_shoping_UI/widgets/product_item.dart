import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../models/product.dart';
import 'colors.dart';
import 'text_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.onTap, required this.model});
  final VoidCallback onTap;
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35.h,
        decoration: BoxDecoration(
          color: Colors.red.shade200,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: 16.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        model.images[0],
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )),
            SizedBox(
              width: 0.5.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                model.productCategory,
                style: TextStyle(fontSize: 8.sp, color: AppColors.greyLight),
              ),
            ),
            SizedBox(
              width: 0.5.h,
            ),
            Text(
              model.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.verySmallText
                  .copyWith(fontWeight: FontWeight.w600, height: 1.5),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 16.sp,
                    ),
                    SizedBox(width: .5.w),
                    Text(
                      '${model.rating} | 2,599',
                      style: AppTextStyles.verySmallTextLight,
                    )
                  ],
                ),
                Text(
                  '\$${model.price}',
                  style: AppTextStyles.mediumText.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
