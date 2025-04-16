import 'package:app/common/routes/names.dart';
import 'package:app/common/values/values.dart';
import 'package:app/pages/detail/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'logic.dart';




class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    final detail = context.read<DetailBloc>().state.detail;
    return detail==null?SizedBox(
      width: 375.w,
      height: 340.h,
    ):SizedBox(
      width: 375.w,
      height: 340.h,
      child: Image.network("$SERVER_API_URL${detail.avatar}",
          fit: BoxFit.fill),
    );
  }
}


class DetailTitleView extends StatelessWidget {
  const DetailTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    final detail = context.read<DetailBloc>().state.detail;
    return Container(
      color: Theme.of(context).cardColor,
      padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 16.h,bottom: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          child: Text(
            "${detail?.departmentName}",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
        ),
        SizedBox(height: 10.h,),
          Container(
            child: Text(
              "${detail?.description}",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.primaryThreeElementText,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(height: 10.h,),
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
        SizedBox(height: 10.h,),
        Container(
          child: Text(
            "About Serena",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(height: 5.h,),
          Container(
            child: Text(
              "${detail?.about}",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        "${detail?.patient}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        "${detail?.experience} Years",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Review",
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
                        "${detail?.review}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],),),
          SizedBox(height: 20.h,),
          GestureDetector(
            onTap: (){
              if(detail!=null){
                Logic(context: context).goMessage(detail);
              }
            },
            child: Container(
              width: 343.w,
              height: 54.h,
              margin: EdgeInsets.only(top: 0.h, left: 0.w, right: 0.w,bottom: 15.h),
              decoration: BoxDecoration(
                color: AppColors.primaryWarning,
                borderRadius: BorderRadius.all(Radius.circular(10.h)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width:15.w,
                    height: 15.w,
                    child: Image.asset(
                      "assets/icons/chat1.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(width: 3.w,),
                  Container(
                    child: Text(
                      "Message",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.primaryBackground,
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
              child: Container(
                  width: 343.w,
                  height: 54.h,
                  margin: EdgeInsets.only(top: 0.h, left: 0.w, right: 0.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.all(Radius.circular(15.h)),
                  ),
                  child: Center(
                      child: Text(
                        "Book an Appoinment",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryBackground,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.sp,
                        ),
                      ))),
              onTap: () {
                 final item = context.read<DetailBloc>().state.detail;
                 Navigator.of(context).pushNamed(AppRoutes.Appointment,arguments: item);
              }),
          SizedBox(height: 20.h,),
    ],),);
  }
}




