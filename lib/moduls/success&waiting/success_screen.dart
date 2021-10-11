import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

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
        'assets/images/phone.svg',

      ),
      const SizedBox(
        height: 22.0,
      ),
      Column(
        children: [
          Text(
            'تم تأكيد طلبك',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'انتظارك موافقه مشرف السكن',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold
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
            'طلب الالتحاق بالسكن',
            style: Theme.of(context).textTheme.headline6,
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
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'انتظارك موافقه مشرف السكن',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
