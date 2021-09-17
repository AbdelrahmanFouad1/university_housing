import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class ChooseComplaintsScreen extends StatelessWidget {

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
              padding: const EdgeInsets.only(right:19.0,left: 19.0,top: 35.8),
              child: Column(
                children: [
                  defaultTiTleBoxColumn(
                    img: 'assets/images/broken-plate.svg',
                    title: 'تغيير شئ تالف',
                  ),
                  SizedBox(height: 32.0,),
                  defaultTiTleBoxColumn(
                    img: 'assets/images/locate.svg',
                    title: 'بلاغ عن مفقودات',
                  ),
                  SizedBox(height: 32.0,),
                  defaultTiTleBoxColumn(
                    img: 'assets/images/review.svg',
                    title: 'شكوى عامه',
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
