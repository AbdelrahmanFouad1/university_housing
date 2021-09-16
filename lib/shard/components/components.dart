import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

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


AppBar defaultAppBar()=>AppBar(
  actions: [
    Container(
      padding: const EdgeInsets.all(0.0),
      width: 30.0,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.person_outline),
        onPressed: () {},
      ),
    ),
    Container(
      padding: const EdgeInsets.all(0.0),
      width: 30.0,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
          IconBroken.Notification,
        ),
        onPressed: () {},
      ),
    ),
  ],
  title: Text(
      'أهلا , 42018141',
    style: TextStyle(
      color: mainColors,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  )
);


Widget defaultTitleBox ({
  required String img,
  required String title,
})=> Container(
  width: double.infinity,
  decoration: BoxDecoration(
    color: boxColor,
    borderRadius: BorderRadius.circular(5.0),
  ),
  height: 100,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(width: 20,),
      Align(
        alignment: AlignmentDirectional.center,
        child: SvgPicture.asset(
            img
        ),
      ),
      SizedBox(width: 20,),
      Text(
        title,
        style: TextStyle(
            color: finesColor,
            fontSize: 20
        ),
      ),
    ],
  ),
);



Widget whiteBoard ()=>Container(
  width: double.infinity,
  height: 250,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5.0),
    boxShadow: [BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(5, 5), // changes position of shadow
    ),],
  ),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      cursorColor: mainColors,
      maxLines: 10,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    ),
  ),
);

Widget smallButton({
  required String title,
})=>Padding(
  padding: const EdgeInsets.all(28.0),
  child: defaultButton(
    function:(){} ,
    text: title,
    fontSize: 20 ,
    isUpperCase: false ,
    radius: 5,
    width:double.infinity,
  ),
);