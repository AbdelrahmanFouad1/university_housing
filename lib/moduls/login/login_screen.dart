import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: backGround,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,24.0,16.0,0),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Image.asset(
                        'assets/images/small_logo.png',
                        width: 72,
                        height: 72,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.center,
                child: Image.asset(
                    'assets/images/login.png',
                  width: 230,
                  height: 230,
                ),
              ),
              Text(
                'اهلا بك في تطبيق الاسكان الجامعي',
                style: TextStyle(
                  fontSize: 16.0,
                  color: mainColors,
                  fontFamily: 'cairo_semiBold',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'رقم الطالب',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  textDirection: TextDirection.rtl ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'كلمه المرور',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  textDirection: TextDirection.rtl ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: defaultButton(
                  function:(){} ,
                  text: 'تسجيل دخول',
                  fontSize: 20 ,
                  isUpperCase: false ,
                  radius: 5,
                  width:double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
