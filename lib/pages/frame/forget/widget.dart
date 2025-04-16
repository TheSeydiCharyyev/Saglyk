import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/values/colors.dart';


class BuildEmailInput extends StatelessWidget {
  const BuildEmailInput({super.key});

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
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Enter your Email",
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
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
              onChanged: (value) {
              //  context.read<ForgetBloc>().add(EmailChanged(value));
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

class BuildLoginBtn extends StatelessWidget {
  const BuildLoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        child: Container(
            width: 343.w,
            height: 50.h,
            margin: EdgeInsets.only(top: 50.h, left: 0.w, right: 0.w),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
            ),
            child: Center(
                child: Text(
                  "Summit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryBackground,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                  ),
                ))),
        onTap: () {
          //ForgetLogic(context: context).handleEmailForgot();
        });
  }
}
