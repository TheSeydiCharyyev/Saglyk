import 'package:app/common/entities/entities.dart';
import 'package:app/common/values/values.dart';
import 'package:app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';
import 'widget.dart';
import 'logic.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  String? doctorToken;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (mounted) {
        var data = ModalRoute.of(context)?.settings.arguments as DoctorData;
        setState(() {
          doctorToken = data.token;
        });
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
    return BlocBuilder<AppointmentBloc, AppointmentState>(
        builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar("Appointment"),
        backgroundColor: AppColors.primaryFourElementText,
        body: CustomScrollView(slivers: [
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.h,
                horizontal: 0.w,
              ),
              sliver: SliverToBoxAdapter(
                child: MenuItem(),
              )),
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 16.w,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: 343.w,
                  margin: EdgeInsets.only(top: 0.h),
                  child: Text(
                    "Morning Slots",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              )),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.h,
              horizontal: 16.w,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5, // spacing between columns
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                var item = state.morningList.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    context.read<AppointmentBloc>().add(Page2Changed(index));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: index == state.page2
                          ? AppColors.primaryElement
                          : AppColors.primaryBackground,
                      borderRadius: BorderRadius.all(Radius.circular(5.w)),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        color: index == state.page2
                            ? AppColors.primaryBackground
                            : AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                );
              }, childCount: state.morningList.length),
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 16.w,
              ),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  width: 343.w,
                  child: Text(
                    "Afternoon Slots",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              )),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.h,
              horizontal: 16.w,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5, // spacing between columns
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                var item = state.afternoonList.elementAt(index);
                var indexAdd = index+state.morningList.length;
                return GestureDetector(
                  onTap: () {
                    context.read<AppointmentBloc>().add(Page2Changed(indexAdd));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: indexAdd == state.page2
                          ? AppColors.primaryElement
                          : AppColors.primaryBackground,
                      borderRadius: BorderRadius.all(Radius.circular(5.w)),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        color: indexAdd == state.page2
                            ? AppColors.primaryBackground
                            : AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                );
              }, childCount: state.afternoonList.length),
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.h,
                horizontal: 0.w,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: 343.w,
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 16.w,
                  ),
                  child: Text(
                    "Evening Slots",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              )),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.h,
              horizontal: 16.w,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5, // spacing between columns
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                var item = state.eveningList.elementAt(index);
                var indexAdd = index+state.morningList.length+state.afternoonList.length;
                return GestureDetector(
                  onTap: () {
                    context.read<AppointmentBloc>().add(Page2Changed(indexAdd));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: indexAdd == state.page2
                          ? AppColors.primaryElement
                          : AppColors.primaryBackground,
                      borderRadius: BorderRadius.all(Radius.circular(5.w)),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        color: indexAdd == state.page2
                            ? AppColors.primaryBackground
                            : AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                );
              }, childCount: state.eveningList.length),
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.h,
                horizontal: 16.w,
              ),
              sliver: SliverToBoxAdapter(
                child: GestureDetector(
                    child: Container(
                        width: 343.w,
                        height: 54.h,
                        margin:
                            EdgeInsets.only(top: 30.h, left: 0.w, right: 0.w,bottom: 20.h),
                        decoration: BoxDecoration(
                          color: AppColors.primaryElement,
                          borderRadius: BorderRadius.all(Radius.circular(15.h)),
                        ),
                        child: Center(
                            child: Text(
                          "Confirm Appoinment",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryBackground,
                            fontWeight: FontWeight.normal,
                            fontSize: 15.sp,
                          ),
                        ))),
                    onTap: () {
                        if(doctorToken!=null){
                          Logic(context: context).confirm(doctorToken!);
                        }
                    }),
              )),
        ]),
      );
    });
  }
}
