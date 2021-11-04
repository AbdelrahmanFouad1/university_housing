import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class SuccessLeavingScreen extends StatelessWidget {
  const SuccessLeavingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Container(
              padding: const EdgeInsets.all(0.0),
              width: 30.0,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon:  Icon(
                  IconBroken.Arrow___Left_2,
                  color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                ),
                onPressed: () {
                  navigateTo(context, HomeScreen());
                },
              ),
            ),
            const SizedBox(width: 6.0,),
          ],
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

  Widget buildPortrait(context) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'طلب أخلاءالسكن',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              SvgPicture.asset(
                'assets/images/phone.svg',
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'تم تأكيد طلبكم',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'أنتظر رد المشرف لأستكمال الأجرائات',
                  style: Theme.of(context).textTheme.headline6,
                ),
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
            'طلب أخلاءالسكن',
            style: Theme.of(context).textTheme.headline6,
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
            'تم تأكيد طلبكم',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            'أنتظر رد المشرف لأستكمال الأجرائات',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    ),
  );
}
