import 'package:flutter/material.dart';
import 'package:app/common/values/colors.dart';

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  //  Theme.of(context).primaryColor
  //  Theme.of(context).scaffoldBackgroundColor
  //  Theme.of(context).cardColor

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryBackground,
    useMaterial3:false,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColors.primaryText,
    cardColor: AppColors.primaryFourElementText,
    colorScheme: ColorScheme.light(),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation:0.0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: AppColors.primaryText,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        color: AppColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryBackground,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xffA2A5B9),
      selectedItemColor: AppColors.primaryElement,
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColors.primaryThreeElementText,
      unselectedLabelColor: AppColors.primaryElement,
    ),
  );


  static ThemeData dark = ThemeData(
    useMaterial3:false,
    scaffoldBackgroundColor: AppColors.primaryText,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColors.primaryBackground,
    cardColor: AppColors.primaryText,
    colorScheme: ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation:0.0,
      backgroundColor: AppColors.primaryText,
      iconTheme: IconThemeData(
        color: AppColors.primaryBackground,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.primaryBackground,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        color: AppColors.primaryBackground,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryText,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xffA2A5B9),
      selectedItemColor: AppColors.primaryElement,
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColors.primaryThreeElementText,
      unselectedLabelColor: AppColors.primaryElement,
    ),
  );
}
