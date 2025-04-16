import 'package:app/common/routes/names.dart';
import 'package:app/common/values/values.dart';
import 'package:app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BuildBtn extends StatelessWidget {
  final String title;
  const BuildBtn({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(top: 25.h, left: 25.w, right: 25.w),
            decoration: BoxDecoration(
              color: title=="Sign In"?AppColors.primaryElement:AppColors.primaryBgSuccess,
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
              border: Border.all(color: AppColors.primaryBgSuccess),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryElementText,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ))),
        onTap: () {
          Global.storageService.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
          if(title=="Sign In"){
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.Sign_in, (Route<dynamic> route) => false);
          }else{
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.Register, (Route<dynamic> route) => false);
          }

        });
  }
}

