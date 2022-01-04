import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_housing/shard/style/color.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: backGround,
  dialogBackgroundColor: backGround,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: backGround,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: backGround,
    elevation: 0.0,
  ),
  textTheme: TextTheme(
    headline5: TextStyle(
      fontSize: 26.0,
      color: mainColors,
      fontFamily: 'cairo_semiBold',
    ),
    bodyText1: TextStyle(
      fontSize: 16.0,
      color: mainColors,
      fontFamily: 'cairo_semiBold',
    ),
    subtitle1: TextStyle(
      fontSize: 18.0,
      color: mainColors,
      fontFamily: 'cairo_semiBold',
    ),
    headline6: TextStyle(
      fontSize: 20.0,
      color: mainColors,
      fontFamily: 'cairo_semiBold',
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      fontSize: 12.0,
      color: mainColors,
      fontFamily: 'cairo_semiBold',
    ),
  ),
  fontFamily: 'cairo_semiBold',
);

ThemeData darkTheme = ThemeData(
  unselectedWidgetColor: mainTextColor,
  disabledColor: mainTextColor,
  scaffoldBackgroundColor: backGroundDark,
  dialogBackgroundColor: backGroundDark,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: backGroundDark,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: backGroundDark,

    elevation: 0.0,
  ),
  textTheme: TextTheme(
    headline5: TextStyle(
      fontSize: 26.0,
      color: mainTextColor,
      fontFamily: 'cairo_semiBold',
    ),
    bodyText1: TextStyle(
      fontSize: 16.0,
      color: mainTextColor,
      fontFamily: 'cairo_semiBold',
    ),
    subtitle1: TextStyle(
      fontSize: 18.0,
      color: mainTextColor,
      fontFamily: 'cairo_semiBold',
    ),
    headline6: TextStyle(
      fontSize: 20.0,
      color: mainTextColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'cairo_semiBold',
    ),
    bodyText2: TextStyle(
      fontSize: 12.0,
      color: mainTextColor,
      fontFamily: 'cairo_semiBold',
    ),
  ),
  fontFamily: 'cairo_semiBold',
);