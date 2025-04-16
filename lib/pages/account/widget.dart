import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/values/colors.dart';

import 'bloc.dart';
import 'logic.dart';



class BuildEditBtn extends StatelessWidget {
  const BuildEditBtn({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        child: Container(
            width: 343.w,
            height: 56.h,
            margin: EdgeInsets.only(top: 15.h, left: 0.w, right: 0.w),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
            ),
            child: Center(
                child: Text(
              "Edit",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryBackground,
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
              ),
            ))),
        onTap: () {
            Logic(context: context).handleProfile();
        });
  }
}

class BuildTextInput extends StatelessWidget {


  final String type;
  final TextEditingController controller;
  const BuildTextInput({super.key,required this.type,required this.controller});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 343.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h, top: 0.h),
      padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
      decoration: BoxDecoration(
          color: AppColors.primaryFourElementText,
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          border: Border.all(color: AppColors.primaryFourElementText)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 340.w,
            height: 50.h,
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: TextField(
              keyboardType: TextInputType.multiline,
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter your $type",
                contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                hintStyle: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                ),
              ),
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
              onChanged: (value) {
                var useritem = context.read<AccountBloc>().state.userProfile;

                 if(useritem!=null){
                   if(type=="name"){
                     useritem.name= value;
                   }
                   if(type=="description"){
                     useritem.description= value;
                   }
                   context.read<AccountBloc>().add(UserProfileChanged(useritem));
                 }


              },
              maxLines: 1,
              autocorrect: false, // 自动纠正
              obscureText: false, // 隐藏输入内容, 密码框
            ),
          )
        ],
      ),
    );
  }
}

class BuildGenderInput extends StatelessWidget {
  final int gender;
  const BuildGenderInput({super.key,required this.gender});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.only(bottom: 15.h, top: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 150.w,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                GestureDetector(
                  child: SizedBox(
                      width: 24.h,
                      height: 24.h,
                      child: Image.asset(
                        gender==1?"assets/icons/check.png":"assets/icons/uncheck.png",
                        fit: BoxFit.fill,
                      )),
                  onTap: () {
                    var useritem = context.read<AccountBloc>().state.userProfile;

                    if(useritem!=null){
                      useritem.gender= 1;
                      context.read<AccountBloc>().add(UserProfileChanged(useritem));
                    }
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: Text(
                    "Male",
                    style: TextStyle(
                      color: AppColors.primaryElement,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],),
            ),
            SizedBox(
              width: 150.w,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                GestureDetector(
                  child: SizedBox(
                      width: 24.h,
                      height: 24.h,
                      child: Image.asset(gender==2?"assets/icons/check.png":"assets/icons/uncheck.png", fit: BoxFit.fill)),
                  onTap: () {
                    var useritem = context.read<AccountBloc>().state.userProfile;

                    if(useritem!=null){
                      useritem.gender= 2;
                      context.read<AccountBloc>().add(UserProfileChanged(useritem));
                    }
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: Text(
                    "Female",
                    style: TextStyle(
                      color: AppColors.primaryElement,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],),
            )
          ],
        ));
  }
}

