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

Widget defaultFormField() =>
    TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Student ID',
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
      textDirection: TextDirection.rtl ,
    );


Widget defaultButton({
  double width = double.infinity,
  bool isUpperCase = true,
  double radius = 3.0,
  double fontSize = 20,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function(),
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
