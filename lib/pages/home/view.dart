import 'package:app/common/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';
import 'widget.dart';
import 'logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>_HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      if(mounted){
        Logic(context: context).init();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return Container(
              color: Theme.of(context).cardColor,
              child: CustomScrollView(slivers: [
                SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.w,
                      horizontal: 0.w,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: BuildAppBar(),
                    )),
                SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.h,
                      horizontal: 16.w,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        width: 343.w,
                        margin: EdgeInsets.only(top:15.h, bottom:15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamed(AppRoutes.All);
                              },
                              child: Text(
                                "See All",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                ),
                              ),
                            )
                          ],),
                      ),
                    )),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.w,
                    horizontal: 0.w,
                  ),
                  sliver: SliverToBoxAdapter(
                      child: MenuItem()),
                ),
                SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.h,
                      horizontal: 16.w,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        width: 343.w,
                        margin: EdgeInsets.only(top:20.h, bottom:5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Available Doctor",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamed(AppRoutes.All);
                              },
                              child: Text(
                                "See All",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                ),
                              ),
                            )
                          ],),
                      ),
                    )),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.w,
                    horizontal: 0.w,
                  ),
                  sliver: SliverToBoxAdapter(
                      child: DoctorItem(doctorList: state.availableList)),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.w,
                    horizontal: 0.w,
                  ),
                  sliver: SliverToBoxAdapter(
                      child: SizedBox(height: 10.h,)),
                ),
              ]));
        });
  }
}

