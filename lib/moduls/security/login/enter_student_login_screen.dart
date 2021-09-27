import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/cubit.dart';
import 'package:university_housing/shard/cubit/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

class EnterStudentLoginScreen extends StatelessWidget {
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: ui.TextDirection.rtl,
            child: Scaffold(
              backgroundColor: backGround,
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: backGround,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: backGround,
                elevation: 0.0,
                titleSpacing: 20.0,
                automaticallyImplyLeading: false,
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
                  title: Text(
                    'تسجيل دخول الطالب من السكن',
                    style: TextStyle(
                      color: mainColors,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
              ),
              body: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 40.0,
                            margin: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'اسم الطالب',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 14.0),
                                hintStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          Container(
                            width: double.infinity,
                            height: 40.0,
                            margin: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'رقم الطالب',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 14.0),
                                hintStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.only(
                                    start: 14.0,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    controller: dateController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'تاريخ الدخول',
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 14.0),
                                      hintStyle: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:
                                                  DateTime.parse('2030-12-12'))
                                          .then((value) {
                                        dateController.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.only(
                                    end: 14.0,
                                  ),
                                  child: TextFormField(
                                    textDirection: ui.TextDirection.ltr,
                                    textAlign: TextAlign.end,
                                    controller: timeController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'وقت الدخول',
                                      hintTextDirection: ui.TextDirection.ltr,
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 14.0),
                                      hintStyle: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onTap: (){
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) => timeController.text = value!.format(context).toString());
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          Container(
                            width: double.infinity,
                            height: 40.0,
                            margin: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'ملاحظات',
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 14.0),
                                hintStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 54.0,
                          ),
                          defaultButton(
                            function: () {},
                            text: 'تأكيد',
                            width: double.infinity,
                            height: 47.0,
                            btnColor: mainColors,
                            marginSize: EdgeInsets.symmetric(horizontal: 14.0),
                            //
                          ),
                          const SizedBox(
                            height: 180.0,
                          ),
                        ],
                      ),
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