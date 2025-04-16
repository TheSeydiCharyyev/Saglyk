import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/values/values.dart';

///  AppBar
AppBar buildAppBar(String title) {
  return AppBar(
    title: Container(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
    ),
  );
}

/// 10像素 Divider
Widget divider10Px({Color bgColor = AppColors.primaryThreeElementText}) {
  return Container(
    height: 10.w,
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
