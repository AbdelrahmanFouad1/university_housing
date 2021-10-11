import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/moduls/boarding/on_boarding.dart';
import 'package:university_housing/moduls/login/login_screen.dart';
import 'package:university_housing/moduls/splash/splash_screen.dart';
import 'package:university_housing/shard/bloc_observer.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/security/security_cubit.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
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
//Round 2
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(create: (BuildContext context) => ThemeCubit()..changeTheme(fromShared: isDark),),
        BlocProvider(create: (BuildContext context) => AppCubit()),
        BlocProvider(create: (context) => SecurityCubit()),
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




