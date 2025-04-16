import 'package:app/common/routes/routes.dart';
import 'package:app/common/values/values.dart';
import 'package:app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    var isDark = Global.storageService.getBool(STORAGE_USER_DARK_KEY);
    if(isDark){
      context.read<ThemeCubit>().dark();
    }else{
      context.read<ThemeCubit>().light();
    }
    Future.delayed(Duration(seconds: 2), () => {
      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.Welcome, (Route<dynamic> route) => false)
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light, // SystemUiOverlayStyle.light
      child: Scaffold(
        appBar: null,
        backgroundColor: AppColors.primaryBackground,
        body: Center(
          child: SizedBox(
              width: 375.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                    width: 60.w,
                    height: 60.w,
                    clipBehavior:Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      borderRadius: BorderRadius.all(Radius.circular(15.w)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10, //阴影范围
                          spreadRadius: 0.1, //阴影浓度
                          color: Colors.grey.withOpacity(0.2), //阴影颜色
                        ),
                      ],
                    ),
                    child: Image.asset("assets/icons/logo.png",fit: BoxFit.fill,)
                ),
                Container(
                  margin: EdgeInsets.only(left:15.w,bottom: 0.h,top: 0.h),
                  child: Text(
                    "Clinic",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryElement,
                      fontWeight: FontWeight.bold,
                      fontSize: 21.sp,
                    ),
                  ),),
              ],)
          ),
        ),
      ),
    );
  }
  
  
}