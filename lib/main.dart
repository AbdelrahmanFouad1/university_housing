import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/moduls/boarding/on_boarding.dart';
import 'package:university_housing/moduls/dash_board/dash_home_screen.dart';
import 'package:university_housing/moduls/dash_board/security/security_screen.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/moduls/login/login_screen.dart';
import 'package:university_housing/moduls/security/main_security_screen.dart';
import 'package:university_housing/moduls/splash/splash_screen.dart';
import 'package:university_housing/shard/bloc_observer.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/security/security_cubit.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/network/remote/dio_helper.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';
import 'package:university_housing/shard/style/theme/cubit/states.dart';
import 'package:university_housing/shard/style/theme/theme.dart';

import 'moduls/dash_board/requests/requests_home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? tokeen = CacheHelper.getData(key: 'token');
  bool? isStudent = CacheHelper.getData(key: 'isStudent');
  bool? isSecurity = CacheHelper.getData(key: 'isSecurity');
  bool? isHousingManager = CacheHelper.getData(key: 'isHousingManager');
  bool? isStudentAffairs = CacheHelper.getData(key: 'isStudentAffairs');
  //TODO: When register user rewrite isresident in CacheHelper
  bool? isresident = CacheHelper.getData(key: 'isresident');

  if (onBoarding != null) {
    if(tokeen != null){
      print(tokeen);
      if(isStudent == true){
        widget =  HomeScreen(isRegister: isresident,);
      }else if(isSecurity == true){
        widget =  MainSecurityScreen();
      }else {
        widget =  LoginScreen();
      }
    }else{
      widget =  LoginScreen();
    }

  } else {
    widget = const OnBoardingScreen();
  }

  bool? isDark = CacheHelper.getData(key: 'isDark');

  print('from main ${isDark}');
  runApp(MyApp(startWidget: widget, isDark: isDark,));
}

class MyApp extends StatelessWidget {

   bool? isDark;
  final Widget startWidget;

     MyApp({
       required this.startWidget,
        this.isDark
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(create: (BuildContext context) => ThemeCubit()..changeTheme(fromShared: isDark),),
        BlocProvider(create: (BuildContext context) => AppCubit()..getProfileData()),
        BlocProvider(create: (context) => SecurityCubit()),
        BlocProvider(create: (context) => DashBoardCubit()),
      ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (BuildContext context, state) {

        },
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeCubit.get(context).darkTheme?  ThemeMode.dark : ThemeMode.light ,
            // home: SplashScreen(startWidget: startWidget),
            home: MainSecurityScreen(),
          );
        },
      ),
    );
  }
}




