import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
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
  double? width ,
  double? height,
  double? radius = 8.0,
  double? fontSize ,
  required VoidCallback function,
  required String text,
}) => Container(
  width: width,
  height: height,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      text,
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


AppBar defaultAppBar({
  double? titleSpacing = 12.0,
  bool? showBus = false,
})=> AppBar(
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: backGround,
    statusBarIconBrightness: Brightness.dark,
  ),
    backgroundColor: backGround,
    elevation: 0.0,
    titleSpacing: titleSpacing,
  actions: [
    if(showBus == true)
      Container(
      padding: const EdgeInsets.all(0.0),
      width: 30.0,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(
          'assets/icon/bus.svg',
          width: 18.0,
          height: 18.0,
        ),
        onPressed: () {},
      ),
    ),
    Container(
      padding: const EdgeInsets.all(0.0),
      width: 30.0,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon:  Icon(
            Icons.person_outline,
          color: mainColors,
        ),
        onPressed: () {},
      ),
    ),
    Container(
      padding: const EdgeInsets.all(0.0),
      width: 30.0,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Icon(
              IconBroken.Notification,
              color: mainColors,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0,left: 4.0),
              child: SvgPicture.asset('assets/icon/dot.svg'),
            ),
          ],
        ),
        onPressed: () {},
      ),
    ),
  ],
  title: Text(
      'أهلا , 42018122',
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
    borderRadius: BorderRadius.circular(8.0),
  ),
  height: 88.0,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(width: 20,),
      Align(
        alignment: AlignmentDirectional.center,
        child: SvgPicture.asset(
            img,
          width: 68.0,
          height: 68.0,
        ),
      ),
      const SizedBox(width: 20.0,),
      Text(
        title,
        style: TextStyle(
            color: finesColor,
            fontSize: 20.0,
        ),
      ),
    ],
  ),
);

Widget defaultTiTleBoxColumn ({
  required String img,
  required String title,
  double? width ,
  double? height,
  double widthImage = 68.0,
  double heightImage = 68.0,
  double fontSize = 20.0,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
})=>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(8.0),
      ),

      child: Column(
        mainAxisAlignment:mainAxisAlignment,
        children: [
          const SizedBox(height: 20.0,),
          Align(
            alignment: AlignmentDirectional.center,
            child: SvgPicture.asset(
              img,
              width: widthImage,
              height: heightImage,
            ),
          ),
          const SizedBox(height: 5.0,),
          Text(
            title,
            style: TextStyle(
              color: finesColor,
              fontSize: fontSize,
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
    borderRadius: BorderRadius.circular(8.0),
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

