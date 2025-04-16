import 'package:app/common/values/values.dart';
import 'package:app/common/widgets/app.dart';
import 'package:app/pages/search/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';
import 'logic.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() =>_SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      Logic(context: context).available();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar("Search Here"),
        backgroundColor: Theme.of(context).cardColor,
        body: CustomScrollView(slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.w,
              horizontal: 16.w,
            ),
            sliver: SliverToBoxAdapter(
                child:SearchView()
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.h,
                horizontal: 16.w,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: 343.w,
                  margin: EdgeInsets.only(top:15.h, bottom:15.h),
                  child: Text(
                    state.searchList.isEmpty?"Not Search Result":"Search Result(${state.searchList.length})",
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
              sliver: SliverList(delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  var item = state.searchList.elementAt(index);
                  return BuildListItem(item:item);
                },
                childCount: state.searchList.length,
              ),
              )
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.h,
                horizontal: 16.w,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: 343.w,
                  margin: EdgeInsets.only(top:0.h, bottom:10.h),
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
                      Text(
                        "See All",
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
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
                child: DoctorItem(doctorList: state.availableList,)),
          ),
        ]),
      );
    });
  }
}




