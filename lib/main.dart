import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:university_housing/moduls/boarding/on_boarding.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/moduls/login/login_screen.dart';
import 'package:university_housing/moduls/splash/splash_screen.dart';
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
      widget = LoginScreen();
  } else {
    widget = OnBoardingScreen();
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
          titleSpacing: 20.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backGround,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: backGround,
          elevation: 0.0,
          titleTextStyle: const TextStyle(
            fontFamily: 'cairo_semiBold',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'cairo_semiBold',
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontFamily: 'cairo_semiBold',
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            height: 1.3,
          ),
          caption: TextStyle(
            fontFamily: 'cairo_semiBold',
          ),
        ),
        fontFamily: 'cairo_semiBold',
      ),
      themeMode: ThemeMode.light,
      home: SplashScreen(startWidget: startWidget),
    );
  }
}


