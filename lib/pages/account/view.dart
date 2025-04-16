import 'package:app/common/values/colors.dart';
import 'package:app/common/widgets/app.dart';
import 'package:app/global.dart';
import 'package:app/pages/account/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      if(mounted){
        var userProfile = Global.storageService.getUserProfile();
        context.read<AccountBloc>().add(UserProfileChanged(userProfile));
        nameController.text = userProfile.name??"";
        descriptionController.text = userProfile.description??"";
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar("Edit Profile"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: CustomScrollView(slivers: [
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
                        "Full Name",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primarySecondaryElementText,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                        ),
                      ),),
                    BuildTextInput(type: "name",controller: nameController),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.h,top: 0.h),
                      child: Text(
                        "Gender",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primarySecondaryElementText,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                        ),
                      ),),
                    BuildGenderInput(gender: state.userProfile?.gender??1,),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.h,top: 0.h),
                      child: Text(
                        "Description",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primarySecondaryElementText,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                        ),
                      ),),
                    BuildTextInput(type: "description",controller: descriptionController),
                    BuildEditBtn(),
                  ],),),
            ),
          ),
        ]),
      );
    });
  }

}

