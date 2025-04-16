
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/common/routes/routes.dart';
import 'package:app/common/style/theme.dart';
import 'package:app/global.dart';

void main() async {
  await Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.Blocer(context)],
        child: ScreenUtilInit(
            designSize: Size(375, 812),
            builder: (context, child) => BlocBuilder<ThemeCubit, bool>(
              builder: (context, isDark) => MaterialApp(
                title: 'Clinic',
                themeMode: isDark?ThemeMode.dark:ThemeMode.light,
                darkTheme: AppTheme.dark,
                theme: AppTheme.light,
                navigatorKey: Global.navigatorKey,
                scaffoldMessengerKey: Global.rootScaffoldMessengerKey,
                builder: Global.MaterialAppBuilder(),
                debugShowCheckedModeBanner: false,
                navigatorObservers: [AppPages.observer],
                initialRoute: AppRoutes.Splash,
                onGenerateRoute: AppPages.GenerateRouteSettings,
              ),
            ))
    );
  }
}

