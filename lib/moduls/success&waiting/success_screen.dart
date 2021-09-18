import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/style/color.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

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
                  'تسجيل خروج الطالب من السكن',
                  style: TextStyle(
                    color: mainColors,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 130.0,
              ),
              SvgPicture.asset(
                'assets/images/phone.svg',
              ),
              const SizedBox(
                height: 22.0,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'تم تأكيد موعد الخروج',
                  style: TextStyle(
                    color: mainColors,
                    fontSize: 20.0,
                  ),
                ),
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
            'تسجيل خروج الطالب من السكن',
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
          'assets/images/phone.svg',
        ),
        const SizedBox(
          height: 6.0,
        ),
        Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            'تم تأكيد موعد الخروج',
            style: TextStyle(
              color: mainColors,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    ),
  );
}
