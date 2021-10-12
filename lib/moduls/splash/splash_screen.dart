import 'dart:async';
import 'package:flutter/material.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class SplashScreen extends StatefulWidget {
  final Widget startWidget;

  const SplashScreen({Key? key, required this.startWidget}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5,),
            ()=> Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context) => widget.startWidget
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: ThemeCubit.get(context).darkTheme ? Image.asset(
                      'assets/images/logo_dark.png',
                      width: double.infinity,
                      height: 150.0,
                    ) : Image.asset(
                      'assets/images/logo.png',
                      width: double.infinity,
                      height: 150.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0,),
                Text(
                  'تطبيق الأسكان الجامعى',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Image.asset(
                'assets/images/splash.gif',
                width: double.infinity,
                height: 250.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
