import 'package:elocalize_library_task/core/theming/colors.dart';
import 'package:elocalize_library_task/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles
{


  static TextStyle font32BlueBold = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.mainColor
  );

  static TextStyle font13GrayRegular = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.gray
  );

  static TextStyle font14GrayRegular = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.gray
  );

  static TextStyle font13WhiteSemiBold = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.medium,
      color: Colors.white
  );

  static TextStyle font26WhiteSemiBold = TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeightHelper.medium,
      color: Colors.white
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManager.darkBlue
  );

  static TextStyle font20DarkBlueMedium = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManager.darkBlue
  );

  static TextStyle font26DarkBlueBold = TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.darkBlue
  );

  static TextStyle font13DarkBlueRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.darkBlue,
  );


}