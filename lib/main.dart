import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:university_housing/moduls/boarding/on_boarding.dart';
import 'package:university_housing/moduls/booking_room/booking_done_screen.dart';
import 'package:university_housing/moduls/booking_room/booking_room_screen.dart';
import 'package:university_housing/moduls/booking_room/payment/choose_payment_method_screen.dart';
import 'package:university_housing/moduls/booking_room/payment/e_payment_screen.dart';
import 'package:university_housing/moduls/complaints/choose_complaints_screen.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/moduls/login/login_screen.dart';
import 'package:university_housing/moduls/news_details/news_details_screen.dart';
import 'package:university_housing/moduls/requests/leaving_room_screen.dart';
import 'package:university_housing/moduls/profile/profile_screen.dart';
import 'package:university_housing/moduls/queries/queries_screen.dart';
import 'package:university_housing/moduls/requests/change_room/change_room_screen.dart';
import 'package:university_housing/moduls/requests/choose_request_screen.dart';
import 'package:university_housing/moduls/security/follow/follow_student_screen.dart';
import 'package:university_housing/moduls/security/main/main_security_screen.dart';
import 'package:university_housing/moduls/splash/splash_screen.dart';
import 'package:university_housing/moduls/security/success/success_enttre_student_screen.dart';
import 'package:university_housing/moduls/success&waiting/success_screen.dart';
import 'package:university_housing/moduls/success&waiting/waiting_screen.dart';
import 'package:university_housing/shard/bloc_observer.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/style/color.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();

  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  if (onBoarding != null) {
      widget =  LoginScreen();
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
          backgroundColor: backGround,
          elevation: 0.0,
        ),
        fontFamily: 'cairo_semiBold',
      ),
      themeMode: ThemeMode.light,
      // home: SplashScreen(startWidget: startWidget),
      home:const BookingDoneScreen(),
    );
  }
}




