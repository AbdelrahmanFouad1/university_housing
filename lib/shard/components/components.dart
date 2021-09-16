import 'package:flutter/material.dart';
import 'package:university_housing/shard/style/color.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
);

Widget defaultButton({
  double width = double.infinity,
  bool isUpperCase = true,
  double radius = 3.0,
  double fontSize = 20,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: mainColors,
      ),
    );

Widget defaultButton2({
  double? width ,
  double? height,
  bool isUpperCase = true,
  double? radius = 8.0,
  double? fontSize ,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius!,
        ),
        color: mainColors,
      ),
    );