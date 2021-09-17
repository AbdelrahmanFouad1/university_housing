import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

class ComplaintsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(),
        backgroundColor: backGround,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                defaultTitleBox(
                  img: 'assets/images/review.svg',
                  title: 'شكوي عامه',
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'اكتب تفاصيل الشكوى',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                whiteBoard(),
                const SizedBox(
                  height: 88,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: defaultButton(
                      function: (){},
                      text: 'تقديم الطلب',
                      radius: 8.0,
                      height: 47,
                      width: double.infinity
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
