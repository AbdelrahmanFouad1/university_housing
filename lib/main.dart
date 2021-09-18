import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:university_housing/moduls/boarding/on_boarding.dart';
import 'package:university_housing/moduls/complaints/choose_complaints_screen.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/moduls/login/login_screen.dart';
import 'package:university_housing/moduls/requests/choose_request_screen.dart';
import 'package:university_housing/moduls/splash/splash_screen.dart';
import 'package:university_housing/moduls/success&waiting/success_screen.dart';
import 'package:university_housing/moduls/success&waiting/success_screen2.dart';
import 'package:university_housing/moduls/success&waiting/waiting_screen.dart';
import 'package:university_housing/shard/bloc_observer.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/style/color.dart';
import 'moduls/complaints/change_damaged_screen.dart';
import 'moduls/complaints/change_lost_screen.dart';
import 'moduls/complaints/complaints_screen.dart';
import 'moduls/hostingRequests/hosting_requests_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();

  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  if (onBoarding != null) {
      widget = const LoginScreen();
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

  final Widget startWidget;

   MyApp({
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backGround,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backGround,
            statusBarIconBrightness: Brightness.dark,
          ),

        ),
        fontFamily: 'cairo_semiBold',
      ),
      themeMode: ThemeMode.light,
      home:  HostingRequestsScreen(),
    );
  }
}




