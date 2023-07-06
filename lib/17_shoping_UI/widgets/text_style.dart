import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class AppTextStyles {
  static TextStyle verySmallText =
      TextStyle(fontSize: 10.sp, color: AppColors.textColor);
  static TextStyle verySmallTextLight = TextStyle(
    fontSize: 10.sp,
    color: AppColors.greyLight,
  );
  static TextStyle smallText = TextStyle(
    fontSize: 12.sp,
    color: AppColors.textColor,
  );
  static TextStyle smallTextLight = AppTextStyles.smallText.copyWith(
    color: AppColors.greyLight,
  );
  static TextStyle mediumText = TextStyle(
    fontSize: 14.sp,
    color: AppColors.textColor,
  );
}
