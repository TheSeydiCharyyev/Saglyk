import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/routes/names.dart';
import 'package:app/common/values/colors.dart';

import 'bloc.dart';
import 'logic.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 375.w,
      height: 210.h,
      padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
      child: Column(
        children: [
          Container(
            width: 343.w,
            margin: EdgeInsets.only(top: 55.h),
            alignment: Alignment.centerLeft,
            child: Text(
              "Create Account",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
          ),
          Container(
            width: 343.w,
            alignment: Alignment.centerLeft,
            child: Row(children: [
              Text(
                "Already have an account? ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryThreeElementText,
                  fontWeight: FontWeight.normal,
                  fontSize: 15.sp,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.Sign_in, (Route<dynamic> route) => false);
                },
                child: Container(
                  child: Text(
                    "Sign In!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryBgItem,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              )
            ],),
          ),
        ],
      ),
    );
  }
}

class BuildRegBtn extends StatelessWidget {
  const BuildRegBtn({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        child: Container(
            width: 343.w,
            height: 56.h,
            margin: EdgeInsets.only(top: 30.h, left: 0.w, right: 0.w),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
            ),
            child: Center(
                child: Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryBackground,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                  ),
                ))),
        onTap: () {
            Logic(context: context).handleRegister();
        });
  }
}

class BuildNameInput extends StatelessWidget {
  const BuildNameInput({super.key});

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
            padding: EdgeInsets.only(left: 10.w,right: 10.w),
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Enter your Username",
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
                  color: AppColors.primaryThreeElementText,
                ),
              ),
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
              onChanged: (value) {
                 context.read<RegisterBloc>().add(UserNameChanged(value));
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

class BuildEmailInput extends StatelessWidget {
  const BuildEmailInput({super.key});

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
            padding: EdgeInsets.only(left: 10.w,right: 10.w),
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Enter your Email address",
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
                  color: AppColors.primaryThreeElementText,
                ),
              ),
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
              onChanged: (value) {
                context.read<RegisterBloc>().add(EmailChanged(value));
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

class BuildPasswordInput extends StatelessWidget {
  const BuildPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 343.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 0.h, top: 0.h),
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
            padding: EdgeInsets.only(left: 10.w,right: 10.w),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter your Password",
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
                  color: AppColors.primaryThreeElementText,
                ),
              ),
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
              onChanged: (value) {
                context.read<RegisterBloc>().add(PasswordChanged(value));
              },
              maxLines: 1,
              autocorrect: false, // 自动纠正
              obscureText: true, // 隐藏输入内容, 密码框
            ),
          )
        ],
      ),
    );
  }
}

class BuildThirdLogin extends StatelessWidget {
  const BuildThirdLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(top: 0.h, bottom: 20.h),
        padding: EdgeInsets.only(left: 0.w, right: 0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: Image.asset(
                    "assets/icons/google.png",
                    fit: BoxFit.fill,
                  )),
              onTap: () {
                //  SignInLogic(context: context).handleSignIn("google");
              },
            ),
            GestureDetector(
              child: SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: Image.asset("assets/icons/apple.png", fit: BoxFit.fill)),
              onTap: () {
                //   SignInLogic(context: context).handleSignIn("apple");
              },
            ),
            GestureDetector(
              child: SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: Image.asset("assets/icons/facebook.png", fit: BoxFit.fill)),
              onTap: () {
                //   SignInLogic(context: context).handleSignIn("facebook");
              },
            ),
          ],
        ));
  }
}
