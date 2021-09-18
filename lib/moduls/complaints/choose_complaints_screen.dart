import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/complaints/change_damaged_screen.dart';
import 'package:university_housing/moduls/complaints/complaints_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

import 'change_lost_screen.dart';

class ChooseComplaintsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: defaultAppBar(context: context),
          backgroundColor: backGround,
          body: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) => orientation == Orientation.portrait ? buildPortrait(context) :buildLandScape(context) ,
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
            InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/broken-plate.svg',
                title: 'تغيير شئ تالف',
                height: 160.0,
                width: double.infinity,
              ),
              onTap: () {
                navigateTo(context, ChangeDamagedScreen());
              },
            ),
            const SizedBox(height: 32.0,),
            InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/locate.svg',
                title: 'بلاغ عن مفقودات',
                height: 160.0,
                width: double.infinity,
              ),
              onTap: () {
                navigateTo(context, ChangeLostScreen());
              },
            ),
            const SizedBox(height: 32.0,),
            InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/review.svg',
                title: 'شكوى عامه',
                height: 160.0,
                width: double.infinity,
              ),
              onTap: () {
                navigateTo(context, ComplaintsScreen());
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
                img: 'assets/images/broken-plate.svg',
                title: 'تغيير شئ تالف',
                  height: 160.0,
              ),
              onTap: () {
                navigateTo(context, ChangeDamagedScreen());
              },
            ),
          ),
          const SizedBox(width:  32.0,),
          Flexible(
            flex: 1,
            child: InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/locate.svg',
                title: 'بلاغ عن مفقودات',
                height: 160.0,
              ),
              onTap: () {
                navigateTo(context, ChangeLostScreen());
              },
            ),
          ),
          const SizedBox(width:  32.0,),
          Flexible(
            flex: 1,
            child: InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/review.svg',
                title: 'شكوى عامه',
                  height: 160.0,
              ),
              onTap: () {
                navigateTo(context, ComplaintsScreen());
              },
            ),
          ),

        ],
      ),
    ),
  );
}
