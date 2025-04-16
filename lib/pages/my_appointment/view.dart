import 'package:app/common/entities/entities.dart';
import 'package:app/common/values/values.dart';
import 'package:app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';
import 'widget.dart';
import 'logic.dart';

class MyAppointmentPage extends StatefulWidget {
  const MyAppointmentPage({super.key});

  @override
  State<MyAppointmentPage> createState() =>_MyAppointmentPageState();
}

class _MyAppointmentPageState extends State<MyAppointmentPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      if(mounted){
        Logic(context: context).init(1);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyAppointmentBloc, MyAppointmentState>(builder: (context, state) {
      var page = context.read<MyAppointmentBloc>().state.page;
      return Scaffold(
        appBar: buildAppBar("My Appointment"),
        backgroundColor: Theme.of(context).cardColor,
        body: CustomScrollView(slivers: [
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.h,
                horizontal: 0.w,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: 343.w,
                  color: AppColors.primaryBackground,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    GestureDetector(
                      onTap: (){
                        context.read<MyAppointmentBloc>().add(PageChanged(1));
                        Logic(context: context).init(1);
                      },
                      child: Container(
                        height: 60.h,
                        width: 187.5.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 3, color: page==1?Colors.blueAccent:AppColors.primaryBackground)),
                        ),
                        child: Text(
                          "Upcoming",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: page==1?AppColors.primaryText:AppColors.primaryThreeElementText,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                      GestureDetector(
                        onTap: (){
                          context.read<MyAppointmentBloc>().add(PageChanged(2));
                          Logic(context: context).init(2);
                        },
                      child: Container(
                        height: 60.h,
                        width: 187.5.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 3, color: page==2?Colors.blueAccent:AppColors.primaryBackground)),
                        ),
                        child: Text(
                          "Past",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: page==2?AppColors.primaryText:AppColors.primaryThreeElementText,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],),
                ),
              )),
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 10.w,
                horizontal: 16.w,
              ),
              sliver: SliverList(delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      ApppointData item = state.history.elementAt(index);
                  return BuildListItem(item: item);
                },
                childCount: state.history.length,
              ),
              )
          ),
        ]),
      );
    });
  }
}


