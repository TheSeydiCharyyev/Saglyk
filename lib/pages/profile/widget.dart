import 'package:app/common/entities/entities.dart';
import 'package:app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/values/colors.dart';



class BuildUserItem extends StatelessWidget {
  final UserItem item;
  const BuildUserItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 375.w,
      child: Column(
        children: [
          Center(
            child: Container(
              width: 100.h,
              height: 100.h,
              margin: EdgeInsets.only(top: 20.h),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.h)),
              ),
              child: item.avatar==null?Image.asset('assets/images/head7.png'):Image.network("$SERVER_API_URL${item.avatar}"),
            ),
          ),
          Container(
            width: 375.w,
            margin: EdgeInsets.only(top: 10.h,bottom: 30.h),
            child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              width: 343.w,
              alignment: Alignment.center,
              child: Text(
                "${item.name}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              width: 343.w,
              alignment: Alignment.center,
              child: Text(
                item.description??"",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],),)
        ],
      ),
    );
  }
}

class BuildMenuItem extends StatelessWidget {
  final String icons;
  final String title;
  final Function()? callFunc;
  const BuildMenuItem({super.key,required this.icons,required this.title,required this.callFunc});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap:callFunc,
      child: Container(
        padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h,bottom: 15.h),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
          boxShadow: [
            BoxShadow(
              blurRadius: 10, //阴影范围
              spreadRadius: 0.1, //阴影浓度
              color: Colors.grey.withOpacity(0.2), //阴影颜色
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
           SizedBox(
             width: 20.w,
             height: 20.w,
             child: Image.asset(icons,color: AppColors.primaryElement,),
           ),
           SizedBox(width: 10.w,),
           Container(
             alignment: Alignment.centerLeft,
             child: Text(
               title,
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: AppColors.primaryText,
                 fontWeight: FontWeight.w500,
                 fontSize: 14.sp,
               ),
             ),
           ),
         ],),
          SizedBox(
            width: 18.w,
            height: 18.w,
            child: Image.asset("assets/images/arrow-right.png"),
          ),
      ],),),
    );
  }
}

class BuildLogOut extends StatelessWidget {
  final String icons;
  final String title;
  final Function()? callFunc;
  const BuildLogOut({super.key,required this.icons,required this.title,required this.callFunc});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap:callFunc,
      child: Container(
        padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h,bottom: 15.h),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
          boxShadow: [
            BoxShadow(
              blurRadius: 10, //阴影范围
              spreadRadius: 0.1, //阴影浓度
              color: Colors.grey.withOpacity(0.2), //阴影颜色
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: Image.asset(icons,color: AppColors.primaryError,),
                ),
                SizedBox(width: 10.w,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryError,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],),

          ],),),
    );
  }
}
