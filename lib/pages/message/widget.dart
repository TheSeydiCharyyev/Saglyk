import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
      centerTitle:false,
      title: Container(
        child: Text(
          "Messages",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
      ),
  );
}
