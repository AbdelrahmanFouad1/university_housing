import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/security/main_security_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/security/security_cubit.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class SuccessEnterStudentScreen extends StatelessWidget {
  const SuccessEnterStudentScreen({Key? key}) : super(key: key);

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
                  navigateTo(context, MainSecurityScreen());
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
                  'تسجيل دخول الطالب الي السكن',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(
                height: 100.0,
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
                  'تم تأكيد موعد الدخول',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              defaultButton(
                function: (){
                  SecurityCubit.get(context).getUserInSecurity();
                  navigateTo(context, MainSecurityScreen());
                },
                text: 'العودة الي الرئيسية',
                btnColor: mainColors,
                width: double.infinity,
                marginSize: const EdgeInsets.all(20.0),
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
            'تسجيل دخول الطالب الي السكن',
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
            'تم تأكيد موعد الدخول',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        defaultButton(
          function: (){
            SecurityCubit.get(context).getUserInSecurity();
            navigateTo(context, MainSecurityScreen());
          },
          text: 'العودة الي الرئيسية',
          btnColor: mainColors,
          width: double.infinity,
          marginSize: const EdgeInsets.all(50.0),

        ),
      ],
    ),
  );
}
