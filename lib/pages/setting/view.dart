import 'package:app/common/routes/routes.dart';
import 'package:app/common/values/values.dart';
import 'package:app/common/widgets/app.dart';
import 'package:app/global.dart';
import 'package:app/pages/setting/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';
import 'state.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar("Setting"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: CustomScrollView(slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 16.w,
              horizontal: 16.w,
            ),
            sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      width: 343.w,
                      margin: EdgeInsets.only(bottom: 15.h),
                      child: Text(
                        "Account Settings",
                        style: TextStyle(
                          color:Theme.of(context).primaryColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    BuildListItem(title:"My Profile",iconImage: "assets/images/user_c.png",callFunc: (){
                      Navigator.of(context).pushNamed(AppRoutes.Account);
                    },),
                    BuildListItem(title:"Notifications",iconImage: "assets/images/notification.png",callFunc: (){
                      Navigator.of(context).pushNamed(AppRoutes.Notification);
                     },),
                    Container(
                      width: 343.w,
                      margin: EdgeInsets.only(bottom:15.h),
                      child: Text(
                        "Preferences",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    BuildListItem(title:"Change Password",iconImage: "assets/images/lock_dark.png",callFunc: (){
                      Navigator.of(context).pushNamed(AppRoutes.ChangePassword);
                    },),
                    Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h,bottom: 15.h),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 24.h,
                                  height: 24.h,
                                  child: Image.asset("assets/images/moon.png",color: AppColors.primaryText,),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.w),
                                  child: Text(
                                    "Dark Mode",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        BlocBuilder<ThemeCubit, bool>(
                          builder: (context, isDark) =>SizedBox(height:25.h,child: Switch(value: isDark,onChanged: (v){
                            if(v){
                              context.read<ThemeCubit>().dark();
                              Global.storageService.setBool(STORAGE_USER_DARK_KEY, true);
                            }else{
                              context.read<ThemeCubit>().light();
                              Global.storageService.setBool(STORAGE_USER_DARK_KEY, false);
                            }

                          },),))
                          ],)
                    ),
                    BuildLogOut(icons: 'assets/images/logout.png',title: "Log Out",callFunc: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm logout"),
                              content: Text("Confirm logout."),
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
                                    Global.storageService.remove(STORAGE_USER_PROFILE_KEY);
                                    Global.storageService.remove(STORAGE_USER_TOKEN_KEY);
                                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.Sign_in, (Route<dynamic> route) => false);
                                  },
                                )
                              ],
                            );
                          });
                    },),
                  ],
                )),
          ),
        ]),
      );
    });
  }

}

