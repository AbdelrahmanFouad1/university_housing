import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/moduls/boarding/on_boarding.dart';
import 'package:university_housing/moduls/dash_board/dash_home_screen.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/moduls/login/login_screen.dart';
import 'package:university_housing/moduls/security/main_security_screen.dart';
import 'package:university_housing/shard/bloc_observer.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/security/security_cubit.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/network/remote/dio_helper.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';
import 'package:university_housing/shard/style/theme/cubit/states.dart';
import 'package:university_housing/shard/style/theme/theme.dart';

import 'moduls/splash/splash_screen.dart';

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
  bool? isEmployee = CacheHelper.getData(key: 'isEmployee');
  bool? isHousingManager = CacheHelper.getData(key: 'isHousingManager');
  bool? isresident = CacheHelper.getData(key: 'isresident');

//TODO: Home user
    // id: 42018141
    // password: Farah@2000
  ////////////////////////////
  // id: 42018444
  // password:  Yousef@2000
//TODO: Home Housing Manager
  // id: 2222222
  // password: 22@@EEhh
//TODO: Home Security
  // id: 555555
  // password: 22@@KKhh
  if (onBoarding != null) {
    if(tokeen != null){
      print(tokeen);
      if(isStudent == true || isEmployee == true){
        widget =  HomeScreen(isRegister: isresident,);
      }else if(isSecurity == true){
        widget =  MainSecurityScreen();
      }else if(isHousingManager == true){
        widget =  const DashHomeScreen();
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

  runApp(MyApp(startWidget: widget, isDark: isDark,));
}

class MyApp extends StatelessWidget {

   bool? isDark;
  final Widget startWidget;

     MyApp({Key? key,
       required this.startWidget,
        this.isDark
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(create: (BuildContext context) => ThemeCubit()..changeTheme(fromShared: isDark),),
        BlocProvider(create: (BuildContext context) => AppCubit()..getProfileData()),
        BlocProvider(create: (BuildContext context) => DashBoardCubit()..getDashProfileData()),
        BlocProvider(create: (BuildContext context) => SecurityCubit()..getSecurityProfileData()..getUserInSecurity()),

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
            home: SplashScreen(startWidget: startWidget),
          );
        },
      ),
    );
  }
}




