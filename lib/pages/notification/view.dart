import 'package:app/common/entities/entities.dart';
import 'package:app/common/entities/notification.dart';
import 'package:app/common/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';
import 'widget.dart';
import 'logic.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      if(mounted){
        Logic(context: context).notification();
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
    return BlocBuilder<NotificationBloc, NotificationState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text(
              "Notification",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async{
                await Navigator.of(context).pushNamed(AppRoutes.Message);
              },
              child: Container(
                width: 20.w,
                height: 20.w,
                margin: EdgeInsets.only(right: 16.w),
                child: Image.asset("assets/icons/chat.png",fit: BoxFit.fitWidth,width: 20.w,height: 20.w,color: Theme.of(context).primaryColor,),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).cardColor,
        body: CustomScrollView(slivers: [
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 10.w,
                horizontal: 0.w,
              ),
              sliver: SliverList(delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      NotificationData item = state.message.elementAt(index);
                      return BuildListItem(item: item);
                },
                childCount: state.message.length,
              ),
              )
          ),

        ]),
      );
    });
  }
}


