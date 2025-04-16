import 'package:app/pages/account/bloc.dart';
import 'package:app/pages/account/view.dart';
import 'package:app/pages/all/bloc.dart';
import 'package:app/pages/all/view.dart';
import 'package:app/pages/application/bloc.dart';
import 'package:app/pages/application/view.dart';
import 'package:app/pages/appointment/bloc.dart';
import 'package:app/pages/appointment/view.dart';
import 'package:app/pages/chat/bloc/chat_bloc.dart';
import 'package:app/pages/chat/chat.dart';
import 'package:app/pages/detail/bloc.dart';
import 'package:app/pages/detail/view.dart';
import 'package:app/pages/doctor/bloc.dart';
import 'package:app/pages/doctor/view.dart';
import 'package:app/pages/frame/change_password/bloc.dart';
import 'package:app/pages/frame/change_password/view.dart';
import 'package:app/pages/frame/forget/bloc.dart';
import 'package:app/pages/frame/forget/view.dart';
import 'package:app/pages/frame/register/bloc.dart';
import 'package:app/pages/frame/register/view.dart';
import 'package:app/pages/frame/sign_in/bloc.dart';
import 'package:app/pages/frame/sign_in/view.dart';
import 'package:app/pages/frame/splash/splash.dart';
import 'package:app/pages/home/bloc.dart';
import 'package:app/pages/home/view.dart';
import 'package:app/pages/message/bloc/message_bloc.dart';
import 'package:app/pages/message/message.dart';
import 'package:app/pages/my_appointment/bloc.dart';
import 'package:app/pages/my_appointment/view.dart';
import 'package:app/pages/notification/bloc.dart';
import 'package:app/pages/notification/view.dart';
import 'package:app/pages/notification_detail/notification_detail.dart';
import 'package:app/pages/photoview/bloc/photoview_bloc.dart';
import 'package:app/pages/photoview/photoview.dart';
import 'package:app/pages/profile/bloc.dart';
import 'package:app/pages/profile/view.dart';
import 'package:app/pages/search/bloc.dart';
import 'package:app/pages/search/view.dart';
import 'package:app/pages/setting/bloc.dart';
import 'package:app/pages/setting/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/common/routes/observers.dart';
import 'package:app/global.dart';
import 'package:app/pages/frame/welcome/welcome.dart';

import 'routes.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static List<PageEntity> Routes(){
    return [
      PageEntity(
          path:AppRoutes.Splash,
          page:Splash(),
          bloc:null
      ),
      PageEntity(
          path:AppRoutes.Welcome,
          page:Welcome(),
          bloc:null
      ),
      PageEntity(
          path:AppRoutes.Sign_in,
          page:SignInPage(),
          bloc:BlocProvider(create: (_) => SignInBloc())
      ),
      PageEntity(
          path:AppRoutes.Register,
          page:RegisterPage(),
          bloc:BlocProvider(create: (_) => RegisterBloc())
      ),
      PageEntity(
          path:AppRoutes.Forget,
          page:ForgetPage(),
          bloc:BlocProvider(create: (_) => ForgetBloc())
      ),
      PageEntity(
        path:AppRoutes.Application,
        page:ApplicationPage(),
        bloc:BlocProvider(create: (_) => ApplicationBloc())
      ),
      PageEntity(
          path:AppRoutes.Home,
          page:HomePage(),
          bloc:BlocProvider(create: (_) => HomeBloc())
      ),
      PageEntity(
          path:AppRoutes.Profile,
          page:ProfilePage(),
          bloc:BlocProvider(create: (_) => ProfileBloc())
      ),
      PageEntity(
          path:AppRoutes.Search,
          page:SearchPage(),
          bloc:BlocProvider(create: (_) => SearchBloc())
      ),
      PageEntity(
          path:AppRoutes.Setting,
          page:SettingPage(),
          bloc:BlocProvider(create: (_) => SettingBloc())
      ),
      PageEntity(
          path:AppRoutes.Account,
          page:AccountPage(),
          bloc:BlocProvider(create: (_) => AccountBloc())
      ),
      PageEntity(
          path:AppRoutes.Detail,
          page:DetailPage(),
          bloc:BlocProvider(create: (_) => DetailBloc())
      ),
      PageEntity(
          path:AppRoutes.ChangePassword,
          page:ChangePasswordPage(),
          bloc:BlocProvider(create: (_) => ChangePasswordBloc())
      ),
      PageEntity(
          path:AppRoutes.Notification,
          page:NotificationPage(),
          bloc:BlocProvider(create: (_) => NotificationBloc())
      ),
      PageEntity(
          path:AppRoutes.NotificationDetail,
          page:NotificationDetail(),
          bloc:null
      ),
      PageEntity(
          path:AppRoutes.All,
          page:AllPage(),
          bloc:BlocProvider(create: (_) => AllBloc())
      ),
      PageEntity(
          path:AppRoutes.Message,
          page:Message(),
          bloc:BlocProvider(create: (_) => MessageBloc())
      ),
      PageEntity(
          path:AppRoutes.Chat,
          page:Chat(),
          bloc:BlocProvider(create: (_) => ChatBloc())
      ),
      PageEntity(
          path:AppRoutes.Photoimgview,
          page:PhotoView(),
          bloc:BlocProvider(create: (_) => PhotoViewBloc())
      ),
      PageEntity(
          path:AppRoutes.Doctor,
          page:DoctorPage(),
          bloc:BlocProvider(create: (_) => DoctorBloc())
      ),
      PageEntity(
          path:AppRoutes.MyAppointment,
          page:MyAppointmentPage(),
          bloc:BlocProvider(create: (_) => MyAppointmentBloc())
      ),
      PageEntity(
          path:AppRoutes.Appointment,
          page:AppointmentPage(),
          bloc:BlocProvider(create: (_) => AppointmentBloc())
      ),
    ];
  }

  static List<dynamic> Blocer(BuildContext context){
    List<dynamic> blocerList = <dynamic>[];
    for(var blocer in Routes()){
      if(blocer.bloc!=null){
      blocerList.add(blocer.bloc);
      }
    }
    blocerList.add(BlocProvider(create: (_) => ThemeCubit()));
    return blocerList;
  }



  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
      if(settings.name!=null){
        var result = Routes().where((element) => element.path==settings.name);
        if(result.isNotEmpty){
         bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
         if(result.first.path==AppRoutes.Welcome && deviceFirstOpen){
           bool isLogin = Global.storageService.getIsLogin();
           if(isLogin){
             return MaterialPageRoute<void>(builder: (_) => ApplicationPage(),settings: settings);
           }
           return MaterialPageRoute<void>(builder: (_) => SignInPage(),settings: settings);
         }
          return MaterialPageRoute<void>(builder: (_) => result.first.page,settings: settings);
        }
      }

    return MaterialPageRoute<void>(builder: (_) => SignInPage(),settings: settings);
  }
}

class PageEntity<T> {
  String path;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.path,
    required this.page,
     this.bloc,
  });
}

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  void dark() => emit(true);
  void light() => emit(false);
}
