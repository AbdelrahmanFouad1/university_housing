import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/security/main/main_security_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

class SuccessLeavingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backGround,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: backGround,
          elevation: 0.0,
          actions: [
            Container(
              padding: const EdgeInsets.all(0.0),
              width: 30.0,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon:  Icon(
                  IconBroken.Arrow___Left_2,
                  color: mainColors,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 6.0,),
          ],
        ),
        backgroundColor: backGround,
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) =>
              orientation == Orientation.portrait
                  ? buildPortrait()
                  : buildLandScape(),
        ),
      ),
    );
  }

  Widget buildPortrait() => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'طلب أخلاءالسكن',
                  style: TextStyle(
                    color: mainColors,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              SvgPicture.asset(
                'assets/images/phone.svg',
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'تم تأكيد طلبكم',
                  style: TextStyle(
                    color: mainColors,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'أنتظر رد المشرف لأستكمال الأجرائات',
                  style: TextStyle(
                    color: mainColors,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),

        ],
      );

  Widget buildLandScape() => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            'طلب أخلاءالسكن',
            style: TextStyle(
              color: mainColors,
              fontSize: 20.0,
            ),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        SvgPicture.asset(
          'assets/images/phone.svg',
        ),
        const SizedBox(
          height: 6.0,
        ),
        Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            'تم تأكيد طلبكم',
            style: TextStyle(
              color: mainColors,
              fontSize: 20.0,
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            'أنتظر رد المشرف لأستكمال الأجرائات',
            style: TextStyle(
              color: mainColors,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    ),
  );
}
