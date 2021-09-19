import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/style/color.dart';

class BusScreen extends StatelessWidget {

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
          titleSpacing: 20.0,
          automaticallyImplyLeading: false,
          title: Text(
            'مواعيد اتوبيسات السكن',
            style: TextStyle(
              color: mainColors,
              fontSize: 20.0,
            ),
          ),
          actions: [
            IconButton(
              icon:  SvgPicture.asset(
                'assets/images/back_arrow.svg',

              ),
              onPressed: () {
              Navigator.pop(context);
            },
            ),
          ],
        ),
        backgroundColor: backGround,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height:12.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                        'assets/images/bus.svg',
                    ),
                    SizedBox(width: 12.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'موعد الخروج',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                        Text(
                          'موعد الوصول الي مبني S',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                        Text(
                          'موعد الوصول الي مبني M',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '8:45',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                          Text(
                            '9:00',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                          Text(
                            '9:30',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:15.0),
              Container(
                width: double.infinity,
                height:1.0,
                color: separator,
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/bus.svg',
                    ),
                    SizedBox(width: 12.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'موعد الخروج',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                        Text(
                          'موعد الوصول الي مبني S',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                        Text(
                          'موعد الوصول الي مبني M',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '8:45',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                          Text(
                            '9:00',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                          Text(
                            '9:30',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:15.0),
              Container(
                width: double.infinity,
                height:1.0,
                color: separator,
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/bus.svg',
                    ),
                    SizedBox(width: 12.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'موعد الخروج',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                        Text(
                          'موعد الوصول الي مبني S',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                        Text(
                          'موعد الوصول الي مبني M',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '8:45',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                          Text(
                            '9:00',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                          Text(
                            '9:30',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:15.0),
              Container(
                width: double.infinity,
                height:1.0,
                color: separator,
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/bus.svg',
                    ),
                    SizedBox(width: 12.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'موعد الخروج',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                        Text(
                          'موعد الوصول الي مبني S',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                        Text(
                          'موعد الوصول الي مبني M',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '8:45',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                          Text(
                            '9:00',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                          Text(
                            '9:30',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:15.0),
              Container(
                width: double.infinity,
                height:1.0,
                color: separator,
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/bus.svg',
                    ),
                    SizedBox(width: 12.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'موعد الخروج',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                        Text(
                          'موعد الوصول الي مبني S',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                        Text(
                          'موعد الوصول الي مبني M',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: mainColors,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '8:45',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                          Text(
                            '9:00',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                          Text(
                            '9:30',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: mainColors,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:15.0),
              Container(
                width: double.infinity,
                height:1.0,
                color: separator,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
