import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';
import 'widget.dart';
import 'logic.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() =>_DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
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
    return BlocBuilder<DoctorBloc, DoctorState>(builder: (context, state) {
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
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                        childAspectRatio: 1.05,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          var item = state.doctorList.elementAt(index);
                          return DoctorItem(item:item);
                        },
                        childCount: state.doctorList.length,
                      ),
                    )),
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

