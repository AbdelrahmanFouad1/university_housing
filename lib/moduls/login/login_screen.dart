import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/moduls/security/main/main_security_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/cubit.dart';
import 'package:university_housing/shard/cubit/states.dart';
import 'package:university_housing/shard/style/color.dart';

class LoginScreen extends StatelessWidget {
  DateTime timeBackPressed = DateTime.now();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0,top: 28),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Image.asset(
                            'assets/images/small_logo.png',
                            width: 71.0,
                            height: 71.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: SvgPicture.asset(
                                'assets/images/login.svg',
                                height: 227.0,
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
                            const SizedBox(height:33.0,),
                            Container(
                              height: 48.0,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'رقم الطالب',
                                  hintStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12.0,),
                            Container(
                              height: 48.0,
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: cubit.isPassword,
                                decoration:  InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      cubit.changePasswordVisibility();
                                    },
                                    icon: Icon(
                                      cubit.suffix,
                                    ),
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: 'كلمه المرور',
                                  hintStyle: const TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 36.0,),
                            defaultButton(
                              function:(){
                                navigateAndFinish(context, HomeScreen());
                              } ,
                              text: 'تسجيل دخول',
                              fontSize: 20.0 ,
                              height: 50.0,
                              radius: 5.0,
                              btnColor: mainColors,
                              width:double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //TODO: دي هتتشال بس مش دلوقتي وبلاش غباء هاا
              floatingActionButton: FloatingActionButton(
                  onPressed: (){
                    navigateTo(context, MainSecurityScreen());
                  },
                child: const Icon(
                  Icons.security
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
