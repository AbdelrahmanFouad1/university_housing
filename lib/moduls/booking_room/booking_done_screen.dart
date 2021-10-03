import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/profile/follow_requests/follow_requests_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class BookingDoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backGround,
        appBar: defaultAppBar(context: context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                        color: mainColors,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '. . .',
                        style: TextStyle(
                          color: mainColors,
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
                        color: mainColors,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '. . .',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: mainColors,
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
                        color: mainColors,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 22.0,),
                Center(
                  child: Text(
                    ' تم رفع طلبكم بنجاح',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: mainColors,
                    ),
                  ),
                ),
                SizedBox(height: 22.0,),
                SvgPicture.asset(
                  'assets/images/phone.svg',
                ),
                SizedBox(height: 22.0,),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'انتظر موافقة مشرف السكن',
                    style: TextStyle(
                      color: mainColors,
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
                        style: TextStyle(
                          color: mainColors,
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
                          style: TextStyle(
                            color: mainColors,
                            fontSize: 14.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
