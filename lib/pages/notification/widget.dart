import 'package:app/common/entities/entities.dart';
import 'package:app/common/entities/notification.dart';
import 'package:app/common/routes/names.dart';
import 'package:app/common/utils/utils.dart';
import 'package:app/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildListItem extends StatelessWidget {
  final NotificationData item;
  const BuildListItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
          border: Border(
              bottom: BorderSide(
                  width: 0.5, color: AppColors.primaryBg),
              top: BorderSide(
                  width: 0.5, color: AppColors.primaryBg))),
      child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.NotificationDetail,arguments: item);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 32.w,
                height: 32.w,
                margin: EdgeInsets.only(top: 0.h, left: 0.w, right: 10.w),
                padding: EdgeInsets.all(7.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryBgSuccess,
                  borderRadius: BorderRadius.all(Radius.circular(8.w)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child:Image.network("$SERVER_API_URL${item.pic}")
              ),
              // 右侧
              Container(
                padding: EdgeInsets.only(
                    top: 0.w, left: 0.w, right: 0.w, bottom: 0.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // center
                    SizedBox(
                        width: 210.w,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${item.title}",
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                softWrap: false,
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryText,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "${item.content}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: false,
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.primarySecondaryElementText,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ])),
                    SizedBox(
                        width: 85.w,
                        height: 44.w,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                duTimeLineFormat(item.createdAt??""),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.primaryThreeElementText,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ])),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

