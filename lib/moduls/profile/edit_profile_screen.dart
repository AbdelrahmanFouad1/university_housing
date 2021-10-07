import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/profile/about_app_screen.dart';
import 'package:university_housing/moduls/profile/follow_requests/follow_requests_screen.dart';
import 'package:university_housing/moduls/profile/student_rate/student_rate_screen.dart';
import 'package:university_housing/moduls/profile/technical_support_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: backGround,
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: backGround,
                  statusBarIconBrightness: Brightness.dark,
                ),
                automaticallyImplyLeading: false,
                backgroundColor: backGround,
                elevation: 0.0,
                titleSpacing: 12.0,
                title: Text(
                  'الأعدادات',
                  style: TextStyle(
                    color: mainColors,
                    fontSize: 25.0,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/back_arrow.svg',
                      width: 18.0,
                      height: 18.0,
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomStart,
                            children: [
                            Builder(
                              builder: (context){
                                if(cubit.profileImage == null){
                                  return cubit.img;
                                }else{
                                  return cubit.img;
                                }
                              },
                            ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  child: IconButton(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(0.0),
                                    iconSize: 20.0,
                                    icon: cubit.icon,
                                    onPressed: () {
                                      if(cubit.profileImage != null){
                                        cubit.deleteImg();
                                      }else{
                                        cubit.pikeProfileIdImage();
                                      }
                                    },
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                navigateTo(context, FollowRequestsScreen(),);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'متابعه طلباتي',
                                    style: TextStyle(
                                      color: mainColors,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      IconBroken.Arrow___Left_2,
                                      color: mainColors,
                                    ),
                                    onPressed: () {
                                      navigateTo(context, FollowRequestsScreen());
                                      },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                width: double.infinity,
                                height: 1.0,
                                color: mainColors,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context,StudentRateScreen(),);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'تقييم الطلاب',
                                    style: TextStyle(
                                      color: mainColors,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      IconBroken.Arrow___Left_2,
                                      color: mainColors,
                                    ),
                                    onPressed: () {
                                      navigateTo(context,StudentRateScreen(),);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                width: double.infinity,
                                height: 1.0,
                                color: mainColors,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context, AboutAppScreen());
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'خدماتنا',
                                    style: TextStyle(
                                      color: mainColors,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      IconBroken.Arrow___Left_2,
                                      color: mainColors,
                                    ),
                                    onPressed: () {
                                      navigateTo(context, AboutAppScreen());
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                width: double.infinity,
                                height: 1.0,
                                color: mainColors,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context, TechnicalSupportScreen());
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'الدعم الفني',
                                    style: TextStyle(
                                      color: mainColors,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      IconBroken.Arrow___Left_2,
                                      color: mainColors,
                                    ),
                                    onPressed: () {
                                      navigateTo(context, TechnicalSupportScreen());
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                width: double.infinity,
                                height: 1.0,
                                color: mainColors,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'الوضع الليلي',
                                  style: TextStyle(
                                    color: mainColors,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Spacer(),
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 1000),
                                  height: 30.0,
                                  width: 70.0,
                                  child: Stack(
                                    children: [
                                      AnimatedPositioned(
                                        duration: Duration(milliseconds: 1000),
                                        child: InkWell(
                                          onTap: () {
                                            cubit.getTheme();
                                          },
                                          child: AnimatedSwitcher(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            transitionBuilder: (Widget child,
                                                Animation<double> animation) {
                                              return RotationTransition(
                                                  child: child,
                                                  turns: animation);
                                            },
                                            child: cubit.isDark
                                                ? Icon(
                                                    Icons.nightlight_round,
                                                    color: Colors.white,
                                                    size: 20.0,
                                                    key: UniqueKey(),
                                                  )
                                                : Icon(
                                                    Icons.wb_sunny_sharp,
                                                    color: Colors.amberAccent,
                                                    size: 20.0,
                                                    key: UniqueKey(),
                                                  ),
                                          ),
                                        ),
                                        curve: Curves.easeIn,
                                        top: 5.0,
                                        right: cubit.isDark ? 40.0 : 0.0,
                                        left: cubit.isDark ? 0.0 : 40.0,
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: cubit.isDark == true
                                        ? mainColors
                                        : Colors.white,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            defaultButton(
                              text: 'تسجيل خروج',
                              function: (){},
                              btnColor: Colors.red,
                              fontSize: 20,
                              height: 40.0,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
