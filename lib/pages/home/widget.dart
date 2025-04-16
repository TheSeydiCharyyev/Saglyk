import 'package:app/common/entities/entities.dart';
import 'package:app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/routes/names.dart';
import 'package:app/common/values/colors.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'bloc.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 375.w,
      padding: EdgeInsets.only(top: 32.h),
      color: Theme.of(context).scaffoldBackgroundColor,
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
          BannerView(),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerList = context.read<HomeBloc>().state.bannerList;
    return Container(
      width: 343.w,
      height: 180.h,
      margin: EdgeInsets.only(left: 16.w,right: 16.w),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            reverse: false,
            onPageChanged: (index) {
              // context.read<HomeBloc>().add(PageChanged(index));
            },
            pageSnapping: true,
            itemCount:bannerList.length,
            physics: ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = bannerList[index];
              return Container(
                width: 343.w,
                height: 180.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("$SERVER_API_URL${item.thumbnail}"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.h)),
                ),
              );
          },
          ),
        ],
      ),
    );
  }
}


class MenuItem extends StatelessWidget {
  const MenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryList = context.read<HomeBloc>().state.categoryList;
    return SizedBox(
      height: 90.w,
      width: 90.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          var item = categoryList.elementAt(index);
          return GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(AppRoutes.All,arguments: item);
            },
            child: Container(
              height: 90.w,
              width: 90.w,
              margin: EdgeInsets.only(left: index==0?16.w:0.w,right: 16.w),
              decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.all(Radius.circular(5.w)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45.w,
                    alignment: Alignment.center,
                    child: Image.network("$SERVER_API_URL${item.thumbnail}",fit: BoxFit.fill,),
                  ),
                  SizedBox(height: 5.h,),
                  Container(
                    child: Text(
                      "${item.title}",
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
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
  final List<DoctorData> doctorList;
  const DoctorItem({super.key, required this.doctorList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 180.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: doctorList.length,
        itemBuilder: (context, index) {
          var item = doctorList.elementAt(index);
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(AppRoutes.Detail, arguments: item);
            },
            child: Container(
              width: 191.w,
              height: 180.w,
              padding: EdgeInsets.all(10.w),
              margin: EdgeInsets.only(
                  left: index == 0 ? 16.w : 0.w,
                  right: 16.w,
                  bottom: 15.h,
                  top: 10.h),
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
                          value: 4.0,
                          onValueChanged: (v) {

                          },
                          starCount: 5,
                          starSize: 12,
                          maxValue: 5,
                          starSpacing: 2,
                          maxValueVisibility: false,
                          valueLabelVisibility: false,
                          animationDuration: Duration(milliseconds: 1000),
                          starOffColor: const Color(0xffe7e8ea),
                          starColor: Colors.yellow,
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
        },
      ),
    );
  }
}

