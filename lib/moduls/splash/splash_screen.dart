import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget startWidget;

  const SplashScreen({Key? key, required this.startWidget}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3,),
            ()=> Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context) => widget.startWidget
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
