import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

class QueriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(),
        backgroundColor: backGround,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 25, 15.0, 0),
            child: Column(
              children: [
                defaultTitleBox(
                  img: 'assets/images/research.svg',
                  title: 'الاستعلامات',
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'اكتب طلب الاستعلام',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                whiteBoard(),
                SizedBox(
                  height: 15,
                ),
                smallButton(title: 'تقديم الطلب'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
