import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/profile/technical_support_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class FollowRequestsDetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backGround,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backGround,
            statusBarIconBrightness: Brightness.dark,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: backGround,
          elevation: 0.0,
          titleSpacing: 12.0,
          title: Text(
            'التفاصيل',
            style: TextStyle(
              fontSize: 20.0,
              color: mainColors,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Container(
                padding: const EdgeInsets.all(0.0),
                width: 34.0,
                child: IconButton(
                  padding:EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    'assets/images/back_arrow.svg',
                    width: 18.0,
                    height: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        body:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsetsDirectional.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '* في حاله وجود خطأ في التفاصيل يرجى المتابعه من خلال ',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: mainColors,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    InkWell(
                      onTap: (){
                        navigateTo(context,TechnicalSupportScreen());
                      },
                      child: Text(
                        'الدعم الفني',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: mainColors,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height:5.0),
                Container(
                  width: double.infinity,
                  height:1.0,
                  color: separator,
                ),
                SizedBox(height: 30.0,),
                Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadiusDirectional.circular(8.0),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'تمت الموافقه عليه',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'رقم الطلب : ',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: mainColors
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '200325',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: mainColors
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'تاريخ رفع الطلب : ',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: mainColors
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '9/2/2021',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: mainColors
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'تاريخ الرد علي الطلب : ',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: mainColors
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '11/2/2021',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: mainColors
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'غرض الطلب : ',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: mainColors
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'استضافه',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: mainColors
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'تحت اشراف : ',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: mainColors
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        ' أ/ ادهم الشرقاوي',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: mainColors
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'ملاحظات : ',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: mainColors
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'لا يوجد',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: mainColors
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
