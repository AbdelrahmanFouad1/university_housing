import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

class SuccessChangeRoomScreen extends StatelessWidget {
  const SuccessChangeRoomScreen({Key? key}) : super(key: key);

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
          actions: [
            Container(
              padding: const EdgeInsets.all(0.0),
              width: 30.0,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon:  Icon(
                  IconBroken.Arrow___Left_2,
                  color: mainColors,
                ),
                onPressed: () {
                  navigateTo(context, HomeScreen());
                },
              ),
            ),
            const SizedBox(width: 6.0,),
          ],
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
                  'طلب تغير الغرفة',
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
                'assets/images/phone.svg',

              ),
              const SizedBox(
                height: 22.0,
              ),
              Column(
                children: [
                  Text(
                    'تم تأكيد طلبك',
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'انتظارك موافقه مشرف السكن',
                    style: TextStyle(
                        color: mainColors,
                        fontSize: 16.0,
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
          'assets/images/phone.svg',
          // height: 200.0,
        ),
        const SizedBox(
          height: 6.0,
        ),
        Column(
          children: [
            Text(
              'تم تأكيد طلبك',
              style: TextStyle(
                  color: mainColors,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'انتظارك موافقه مشرف السكن',
              style: TextStyle(
                  color: mainColors,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
