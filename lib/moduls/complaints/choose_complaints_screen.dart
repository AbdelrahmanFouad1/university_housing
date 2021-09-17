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
          body: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) => orientation == Orientation.portrait ? buildPortrait() :buildLandScape() ,
          ),

        ),
    );
  }
  Widget buildPortrait() => Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            defaultTiTleBoxColumn(
              img: 'assets/images/broken-plate.svg',
              title: 'تغيير شئ تالف',
              height: 160.0,
              width: double.infinity,
            ),
            const SizedBox(height: 32.0,),
            defaultTiTleBoxColumn(
              img: 'assets/images/locate.svg',
              title: 'بلاغ عن مفقودات',
              height: 160.0,
              width: double.infinity,
            ),
            const SizedBox(height: 32.0,),
            defaultTiTleBoxColumn(
              img: 'assets/images/review.svg',
              title: 'شكوى عامه',
              height: 160.0,
              width: double.infinity,
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

  Widget buildLandScape() => Padding(
    padding: const EdgeInsets.all(19.0),
    child: Center(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: defaultTiTleBoxColumn(
              img: 'assets/images/broken-plate.svg',
              title: 'تغيير شئ تالف',
                height: 160.0,
            ),
          ),
          const SizedBox(width:  32.0,),
          Flexible(
            flex: 1,
            child: defaultTiTleBoxColumn(
              img: 'assets/images/locate.svg',
              title: 'بلاغ عن مفقودات',
              height: 160.0,
            ),
          ),
          const SizedBox(width:  32.0,),
          Flexible(
            flex: 1,
            child: defaultTiTleBoxColumn(
              img: 'assets/images/review.svg',
              title: 'شكوى عامه',
                height: 160.0,
            ),
          ),

        ],
      ),
    ),
  );
}
