import 'package:app/common/entities/entities.dart';
import 'package:app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/routes/names.dart';
import 'package:app/common/values/colors.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'bloc.dart';
import 'logic.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 375.w,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 32.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w,top: 20.h, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Find Your",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Specialist",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.Search);
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      padding: EdgeInsets.all(0.w),
                      child: Image.asset(
                        'assets/icons/search1.png',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.Message);
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      padding: EdgeInsets.all(0.w),
                      child: Image.asset(
                        'assets/icons/chat.png',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],)
              ],
            ),
          ),
          MenuItem(),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryList = context.read<DoctorBloc>().state.categoryList;
    final page = context.read<DoctorBloc>().state.page;
    return SizedBox(
      width: 375.w,
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          var item = categoryList.elementAt(index);
          return GestureDetector(
            onTap: (){
              context.read<DoctorBloc>().add(PageChanged(index));
              Logic(context:context).getDoctor(item.id);
            },
            child: Container(
              margin: EdgeInsets.only(left: index==0?16.w:0.w,right: 20.w),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.w)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 3, color: index==page?Colors.blueAccent:AppColors.primaryBackground)),
                    ),
                    child: Text(
                      "${item.title}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],),
            ),
          );
        },
      ),
    );
  }
}


class DoctorItem extends StatelessWidget {
  final DoctorData item;
  const DoctorItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.Detail, arguments: item);
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(10.h)),
          boxShadow: [
            BoxShadow(
              blurRadius: 10, //阴影范围
              spreadRadius: 0.1, //阴影浓度
              color: Colors.grey.withOpacity(0.2), //阴影颜色
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.network(
                "$SERVER_API_URL${item.avatar}",
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "${item.name}",
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "${item.departmentName}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  RatingStars(
                    axis: Axis.horizontal,
                    value: 4,
                    onValueChanged: (v) {

                    },
                    starCount: 5,
                    starSize: 12,
                    maxValue: 5,
                    starSpacing: 2,
                    maxValueVisibility: false,
                    valueLabelVisibility: false,
                    animationDuration: Duration(milliseconds: 1000),
                    starOffColor: AppColors.primaryThreeElementText,
                    starColor: AppColors.primaryWarning,
                    angle: 0,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Experience",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryThreeElementText,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${item.experience} Years",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],),
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Patients",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryThreeElementText,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${item.patient}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],),
                ],),
            ),
          ],
        ),
      ),
    );
  }
}

