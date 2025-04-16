import 'package:app/common/entities/entities.dart';
import 'package:app/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'logic.dart';


class BuildListItem extends StatelessWidget {
  final ApppointData item;
  const BuildListItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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

      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Date",
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
                        "${item.chooseDay}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Time",
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
                        "${item.chooseTime}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Doctor",
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
                        "${item.doctorName}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],),
            ], ),
          ),
          Container(height: 1.h,color: AppColors.primaryFourElementText,),
          Container(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Appointment Type",
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
                        "${item.appointmentType}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Place",
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
                        "${item.place}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],),
                GestureDetector(
                    child: Container(
                        width: 88.w,
                        height: 28.w,
                        decoration: BoxDecoration(
                          color: item.status==1?AppColors.primaryError:AppColors.primaryElement,
                          borderRadius: BorderRadius.all(Radius.circular(8.h)),
                        ),
                        child: Center(
                            child: Text(
                              item.status==1?"Cancel":"Reschedule",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryBackground,
                                fontWeight: FontWeight.normal,
                                fontSize: 12.sp,
                              ),
                            ))),
                    onTap: () {
                      if(item.status==1){

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Confirm Cancel"),
                                content: Text("Confirm Cancel."),
                                actions: [
                                  TextButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text("Confirm"),
                                    onPressed: () {
                                      Logic(context: context).goCancel(item.id);
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      }else{
                        Navigator.pop(context);
                      }



                    }),

              ],),),
        ],
      ),
    );
  }
}
