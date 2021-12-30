import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/profile/follow_requests/follow_requests_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class BookingDoneScreen extends StatelessWidget {
  const BookingDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(context: context, bookingDone: true, pop: false),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        'assets/icon/maps.svg',
                        height: 25.0,
                        width: 25.0,
                        color:ThemeCubit.get(context).darkTheme? Colors.white : mainColors,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '. . .',
                        style: TextStyle(
                          color:ThemeCubit.get(context).darkTheme? Colors.white : mainColors,
                          fontSize: 25.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        'assets/icon/credit_card.svg',
                        height: 25.0,
                        width: 25.0,
                        color:ThemeCubit.get(context).darkTheme? Colors.white : mainColors,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '. . .',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:ThemeCubit.get(context).darkTheme? Colors.white : mainColors,
                            fontSize: 25.0
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        'assets/icon/check.svg',
                        height: 25.0,
                        width: 25.0,
                        alignment: AlignmentDirectional.center,
                        color:ThemeCubit.get(context).darkTheme? Colors.white : mainColors,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22.0,),
                Center(
                  child: Text(
                    ' تم رفع طلبكم بنجاح',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(height: 22.0,),
                SvgPicture.asset(
                  'assets/images/phone.svg',
                ),
                const SizedBox(height: 22.0,),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'انتظر موافقة مشرف السكن',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'ويمكنك متابعه طلبك من',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        navigateTo(context, FollowRequestsScreen());
                      },
                      child: Container(
                        width: 100.0,
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          'متابعة طلباتى ',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
