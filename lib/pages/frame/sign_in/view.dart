import 'package:app/common/values/values.dart';
import 'package:app/pages/frame/sign_in/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
        },
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
                                "Email",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryThreeElementText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.sp,
                                ),
                              ),),
                            BuildEmailInput(),
                            Container(
                              margin: EdgeInsets.only(bottom: 5.h,top: 0.h),
                              child: Text(
                                "Password",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryThreeElementText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.sp,
                                ),
                              ),),
                            BuildPasswordInput(),
                            ForgotPassword(),
                            BuildLoginBtn(),
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

