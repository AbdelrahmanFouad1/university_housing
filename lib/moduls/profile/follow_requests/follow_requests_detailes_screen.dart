import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/profile/technical_support_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class FollowRequestsDetailsScreen extends StatelessWidget {
  const FollowRequestsDetailsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 12.0,
          title: Text(
            'التفاصيل',
            style: Theme.of(context).textTheme.headline6,
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
                    color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                  ),
                ),
              ),
            ),
          ],
        ),
        body:SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsetsDirectional.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '* في حاله وجود خطأ في التفاصيل يرجى المتابعه من خلال ',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 10.0,
                      ),
                    ),
                    const SizedBox(width: 10.0,),
                    InkWell(
                      onTap: (){
                        navigateTo(context,const TechnicalSupportScreen());
                      },
                      child: Text(
                        'الدعم الفني',
                         style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
                const SizedBox(height: 30.0,),
                Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadiusDirectional.circular(8.0),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: const Text(
                    'تمت الموافقه عليه',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'رقم الطلب : ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '200325',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'تاريخ رفع الطلب : ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '9/2/2021',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'تاريخ الرد علي الطلب : ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '11/2/2021',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'غرض الطلب : ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'استضافه',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'تحت اشراف : ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        ' أ/ ادهم الشرقاوي',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'ملاحظات : ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'لا يوجد',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
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
