import 'package:app/common/entities/entities.dart';
import 'package:app/common/routes/routes.dart';
import 'package:app/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BuildListItem extends StatelessWidget {
  final DoctorData item;
  const BuildListItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(AppRoutes.Detail, arguments: item);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 71.w,
              height: 71.w,
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.h)),
              ),
              child: Image.network("$SERVER_API_URL${item.avatar}"),
            ),
            Container(
              width: 230.w,
              margin: EdgeInsets.only(left: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "${item.name}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Container(
                    child: Text(
                      "${item.description}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width:14.w,
                        height: 14.w,
                        child: Image.asset(
                          "assets/icons/clock.png",
                          fit: BoxFit.fill,
                          color: AppColors.primaryText,
                        ),
                      ),
                      Container(
                        child: Text(
                          "${item.workAt}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      SizedBox(
                        width:14.w,
                        height: 14.w,
                        child: Image.asset(
                          "assets/icons/position.png",
                          fit: BoxFit.fitHeight,
                          color: AppColors.primaryText,
                        ),
                      ),
                      Container(
                        child: Text(
                          "${item.position}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                ],),),
          ],
        ),
      ),
    );
  }
}
