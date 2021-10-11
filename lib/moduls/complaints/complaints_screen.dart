import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(context: context),
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
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                whiteBoard(context),
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
                      btnColor: mainColors,
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
