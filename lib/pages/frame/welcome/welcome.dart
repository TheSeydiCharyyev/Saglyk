import 'package:app/pages/frame/welcome/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/values/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => Welcome());
  }

  @override
  State<Welcome> createState() => _WelcomePage();
}

class _WelcomePage extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
          decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/icons/initbg.png"),fit: BoxFit.fill)),
          width: 375.w,
          height: 812.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 0.h,top: 0.h),
                child: Text(
                  "CLINIC'S POINT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryElementText,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.sp,
                  ),
                ),),
              SizedBox(height: 200.h,),
              BuildBtn(title: "Sign Up",),
              BuildBtn(title: "Sign In",),
            ],)
      ),
    );
  }



}
