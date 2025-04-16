import 'package:app/common/values/values.dart';
import 'package:app/pages/frame/register/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return AnnotatedRegion(
            value: SystemUiOverlayStyle.light, // SystemUiOverlayStyle.light
            child: Container(
                decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/icons/bglogin.png"),fit: BoxFit.fill)),
                width: 375.w,
                height: 812.h,
                child: CustomScrollView(slivers: [
                  SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.w,
                        horizontal: 0.w,
                      ),
                      sliver: SliverToBoxAdapter(
                        child:BuildAppBar(),
                      )),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.w,
                      horizontal: 0.w,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.only(left:16.w,right: 16.w),
                        margin: EdgeInsets.only(bottom: 0.h,top: 30.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5.h,top: 0.h),
                              child: Text(
                                "Username",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                ),
                              ),),
                            BuildNameInput(),
                            Container(
                              margin: EdgeInsets.only(bottom: 5.h,top: 0.h),
                              child: Text(
                                "Email",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                ),
                              ),),
                            BuildEmailInput(),
                            Container(
                              margin: EdgeInsets.only(bottom: 5.h,top: 0.h),
                              child: Text(
                                "Password",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                ),
                              ),),
                            BuildPasswordInput(),
                            BuildRegBtn(),
                          ],),),
                    ),
                  ),
                  SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 20.w,
                      ),
                      sliver: SliverToBoxAdapter(
                        child:Container(
                          child: Text(
                            "By signing up you agree to our Terms and Conditions of Use",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryThreeElementText,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      )),
                ])),
          );
        });
  }

}

