import 'package:app/pages/frame/forget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/values/colors.dart';
import 'bloc.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetBloc, ForgetState>(
        builder: (context, state) {
          return AnnotatedRegion(
            value: SystemUiOverlayStyle.dark,
            child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: SafeArea(
                    child: Scaffold(
                      appBar: AppBar(),
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      body: CustomScrollView(slivers: [
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                            vertical: 16.w,
                            horizontal: 16.w,
                          ),
                          sliver: SliverToBoxAdapter(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 0.h,top: 0.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 343.w,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(bottom: 5.h,top: 0.h),
                                    child: Text(
                                      "Forgot Password",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 24.sp,
                                      ),
                                    ),),
                                  Container(
                                    width: 343.w,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(bottom: 35.h,top: 0.h),
                                    child: Text(
                                      "Recover your account password",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.primarySecondaryElementText,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.sp,
                                      ),
                                    ),),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5.h,top: 0.h),
                                    child: Text(
                                      "Email Address",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.primarySecondaryElementText,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.sp,
                                      ),
                                    ),),
                                  BuildEmailInput(),
                                  BuildLoginBtn(),
                                ],),),
                          ),
                        ),
                      ]),
                    ))),
          );
        });
  }

}

