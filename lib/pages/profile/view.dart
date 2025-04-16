import 'package:app/common/routes/names.dart';
import 'package:app/common/widgets/app.dart';
import 'package:app/global.dart';
import 'package:app/pages/profile/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      var userProfile = Global.storageService.getUserProfile();
      context.read<ProfileBloc>().add(UserProfileChanged(userProfile));
    });
  }

  @override
  Widget build(BuildContext context) {
    var userProfile = Global.storageService.getUserProfile();
    return BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: buildAppBar("Profile"),
            body: Container(
              color: Theme.of(context).cardColor,
              child: CustomScrollView(slivers: [
                SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.w,
                      horizontal: 0.w,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: BuildUserItem(item: userProfile,),
                    )),

                SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: SizedBox(
                        width: 343.w,
                        child: Text(
                          "Menu",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    )),
                SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.h,
                      horizontal: 16.w,
                    ),
                    sliver: SliverList.list(
                      children: [
                        BuildMenuItem(icons: 'assets/icons/event.png',title: "My Appointment",callFunc: (){
                          Navigator.of(context).pushNamed(AppRoutes.MyAppointment);
                        },),
                        SizedBox(height: 15.h,),
                        BuildMenuItem(icons: 'assets/icons/user.png',title: "My Profile",callFunc: (){
                          Navigator.of(context).pushNamed(AppRoutes.Account);
                        },),
                        SizedBox(height: 15.h,),
                        BuildMenuItem(icons: 'assets/icons/setting.png',title: "Setting",callFunc: (){
                          Navigator.of(context).pushNamed(AppRoutes.Setting);
                        },),

                      ],
                    )),
                SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 16.w,
                    ),
                    sliver: SliverToBoxAdapter(
                      child:  SizedBox(height: 10.h,),
                    )),

              ])
            ),
          );
        });
  }
}
