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
import 'package:university_housing/shard/cubit/cubit.dart';
import 'package:university_housing/shard/cubit/states.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/cubit/security/security_cubit.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';
import 'package:university_housing/shard/style/theme/cubit/states.dart';
import 'package:university_housing/shard/style/theme/theme.dart';


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
          BlocProvider(create: (context)=> AppCubit()),
          BlocProvider(create: (context)=> SecurityCubit()),
        ],
        child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
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
              home: SplashScreen(startWidget: startWidget),
            );
          },
        ),
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context)  => ThemeCubit()..changeTheme(fromShared: isDark),),
          BlocProvider(
            create: (BuildContext context)  => AppCubit()),
        ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (BuildContext context, state) {  },
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




