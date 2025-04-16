import 'package:app/common/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/values/colors.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => NotificationDetail());
  }

  @override
  State<NotificationDetail> createState() => _NotificationDetailPage();
}

class _NotificationDetailPage extends State<NotificationDetail> {
 String? title = "";
 String? content = "";
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (mounted) {
        final data = ModalRoute.of(context)!.settings.arguments as NotificationData;
        print(data);
        setState(() {
          title = data.title;
          content = data.content;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          padding: EdgeInsets.all(20.w),
          child: Text(
            "$content",
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              color: Theme.of(context).primaryColor,
              fontSize: 16.sp,
            ),
          ),
        ),
    );
  }
  AppBar _buildAppBar() {
    return AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              color: AppColors.primaryThreeElementText,
              height: 2.0,
            )),
        title: Text(
          "$title",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ));
  }
}
