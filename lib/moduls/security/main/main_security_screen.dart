import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/fines/fines_screen.dart';
import 'package:university_housing/moduls/requests/hosting_requests_screen.dart';
import 'package:university_housing/moduls/login/login_screen.dart';
import 'package:university_housing/moduls/security/follow/follow_student_screen.dart';
import 'package:university_housing/moduls/security/logout/enter_student_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

class MainSecurityScreen extends StatelessWidget {
  DateTime timeBackPressed = DateTime.now();
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
                  IconBroken.Logout,
                  color: mainColors,
                ),
                onPressed: () {
                  navigateTo(context, LoginScreen());
                },
              ),
            ),
            const SizedBox(width: 12.0,),
          ],
        ),
        backgroundColor: backGround,
        body: WillPopScope(
          onWillPop: () async {
            final difference = DateTime.now().difference(timeBackPressed);
            final isExitWarning = difference >= const Duration(seconds: 2);
            timeBackPressed = DateTime.now();
            if(isExitWarning){
              showToast(message: 'اضغط مرة أخرى للخروج من البرنامج', state: ToastStates.WARNING);
              return false;
            }else{
              return true;
            }
          },
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) =>
            orientation == Orientation.portrait
                ? buildPortrait(context)
                : buildLandScape(context),
          ),
        ),
      ),
    );
  }

  Widget buildPortrait(context) => Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 38,),
            InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/door_opened.svg',
                title: 'تسجيل خروج الطلاب',
                height: 160.0,
                width: double.infinity,
              ),
              onTap: (){
                navigateTo(context, EnterStudentScreen());
              },
            ),
            const SizedBox(
              height: 32.0,
            ),
            InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/doors_opened_entrance.svg',
                title: 'متابعة الطلاب خارج السكن',
                height: 160.0,
                width: double.infinity,
              ),
              onTap: (){
                navigateTo(context, FollowStudentScreen());
              },
            ),
          ],
        ),
      ),
      SvgPicture.asset(
        'assets/images/layer2.svg',
        semanticsLabel: 'layer',
        fit: BoxFit.cover,
      ),
    ],
  );

  Widget buildLandScape(context) => Padding(
    padding: const EdgeInsets.all(19.0),
    child: Center(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/door_opened.svg',
                title: 'تسجيل خروج الطلاب',
                height: 160.0,
              ),
              onTap: (){
                navigateTo(context, EnterStudentScreen());
              },
            ),
          ),
          const SizedBox(width:  32.0,),
          Flexible(
            flex: 1,
            child: InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/doors_opened_entrance.svg',
                title: 'متابعة الطلاب خارج السكن',
                height: 160.0,
              ),
              onTap: (){
                navigateTo(context, FollowStudentScreen());
              },
            ),
          ),
        ],
      ),
    ),
  );
}
