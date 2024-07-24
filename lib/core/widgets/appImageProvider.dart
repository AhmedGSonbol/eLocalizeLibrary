import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appImageProvider( {required String? img_path ,double width = 60, double height = 80})
{
  return Image.file(File(img_path ?? '',),
    errorBuilder: (context, error, stackTrace) => Image.asset(
      'assets/images/coverTest.jpg',
      height: height.h,
      width: width.w,
      fit: BoxFit.cover,
    ),
    height: height.h,
    width: width.w,
    fit: BoxFit.cover,
  );

}