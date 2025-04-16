import 'package:app/common/values/colors.dart';
import 'package:app/pages/doctor/view.dart';
import 'package:app/pages/home/view.dart';
import 'package:app/pages/notification/view.dart';
import 'package:app/pages/profile/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc.dart';

class ApplicationPage extends StatelessWidget {
  ApplicationPage({super.key});

 final PageController pageController = PageController(initialPage: 0);

  BottomNavigationBarItem tabBarItem(BuildContext context,String icon,String activeIcon,String title){
    return BottomNavigationBarItem(
      icon: SizedBox(
          width: 20.w,
          height: 20.w,
          child: Image.asset(icon,color: Theme.of(context).primaryColor,)),
      activeIcon: SizedBox(
        width: 20.w,
        height: 20.w,
        child: Image.asset(activeIcon,color: AppColors.primaryElement,),
      ),
      label: title,
      backgroundColor: AppColors.primaryBackground,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (value) {},
          children: <Widget>[
            HomePage(),
            DoctorPage(),
            NotificationPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar:
        BlocBuilder<ApplicationBloc, ApplicationState>(
            builder: (context, state) {
              return Container(
                width: 375.w,
                height: 60.h,
                color: AppColors.primaryBackground,
                child: BottomNavigationBar(
                  elevation: 5,
                  items: [
                    tabBarItem(context,"assets/icons/home.png","assets/icons/home.png","Home"),
                    tabBarItem(context,"assets/icons/doctor.png","assets/icons/doctor.png","Doctor"),
                    tabBarItem(context,"assets/icons/notifications1.png","assets/icons/notifications1.png","Notification"),
                    tabBarItem(context,"assets/icons/menu_go.png","assets/icons/menu_go.png","Menu"),
                  ],
                  currentIndex: state.page,
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    context.read<ApplicationBloc>().add(PageChanged(value));
                    pageController.jumpToPage(value);
                  },
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  unselectedItemColor: AppColors.primaryThreeElementText,
                  selectedItemColor: AppColors.primaryElement,
                ),
              );
            }));
  }

}

