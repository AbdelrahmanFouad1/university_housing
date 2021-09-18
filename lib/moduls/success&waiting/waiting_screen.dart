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
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backGround,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: backGround,
          elevation: 0.0,
        ),
        backgroundColor: backGround,
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) =>
              orientation == Orientation.portrait
                  ? buildPortrait()
                  : buildLandScape(),
        ),
      ),
    );
  }

  Widget buildPortrait() => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'طلب الالتحاق بالسكن',
                  style: TextStyle(
                    color: mainColors,
                    fontSize: 20.0,
                  ),
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
                    style: TextStyle(
                        color: mainColors,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'لحين وجود أماكن متاحه',
                    style: TextStyle(
                        color: mainColors,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/images/layer2.svg',
            semanticsLabel: 'layer',
            fit: BoxFit.cover,
          ),
        ],
      );

  Widget buildLandScape() => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            'طلب الالتحاق بالسكن',
            style: TextStyle(
              color: mainColors,
              fontSize: 20.0,
            ),
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
              style: TextStyle(
                  color: mainColors,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'لحين وجود أماكن متاحه',
              style: TextStyle(
                  color: mainColors,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
