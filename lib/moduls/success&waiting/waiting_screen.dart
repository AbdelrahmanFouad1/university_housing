import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/style/color.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) =>
              orientation == Orientation.portrait
                  ? buildPortrait(context)
                  : buildLandScape(context),
        ),
      ),
    );
  }

  Widget buildPortrait(context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        alignment: AlignmentDirectional.center,
        child: Text(
          'طلب الالتحاق بالسكن',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      const SizedBox(
        height: 90.0,
      ),
      SvgPicture.asset(
        'assets/images/waiting.svg',
      ),
      const SizedBox(
        height: 30.0,
      ),
      Column(
        children: [
          Text(
            'تم وضعك في قائمه الانتظار',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'لحين وجود أماكن متاحه',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    ],
  );

  Widget buildLandScape(context) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            'طلب الالتحاق بالسكن',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        SvgPicture.asset(
          'assets/images/waiting.svg',
        ),
        const SizedBox(
          height: 6.0,
        ),
        Column(
          children: [
            Text(
              'تم وضعك في قائمه الانتظار',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'لحين وجود أماكن متاحة',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ],
    ),
  );
}
