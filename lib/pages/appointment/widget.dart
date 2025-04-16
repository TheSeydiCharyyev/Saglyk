import 'package:app/common/values/values.dart';
import 'package:app/pages/appointment/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class MenuItem extends StatelessWidget {
  const MenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dayList = context.read<AppointmentBloc>().state.dayList;
    final page1 = context.read<AppointmentBloc>().state.page1;

    return Container(
      height: 100.h,
      width: 375.w,
      padding: EdgeInsets.only(top: 15.h,bottom: 15.h),
      color:AppColors.primaryBackground,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dayList.length,
        itemBuilder: (context, index) {
          var item = dayList.elementAt(index);
          return GestureDetector(
            onTap: (){
              context.read<AppointmentBloc>().add(Page1Changed(index));
            },
            child: Container(
              height: 70.h,
              width: 40.w,
              padding: EdgeInsets.only(top: 5.h,bottom: 5.h),
              margin: EdgeInsets.only(left: index==0?16.w:0.w,right: 15.w),
              decoration: BoxDecoration(
                color: index==page1?AppColors.primaryElement:AppColors.primaryBackground,
                borderRadius: BorderRadius.all(Radius.circular(5.w)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${item.weekday}",
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: index==page1?AppColors.primaryBackground:AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    child: Text(
                      "${item.day}",
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: index==page1?AppColors.primaryBackground:AppColors.primaryText,
                        fontWeight: FontWeight.normal,
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
