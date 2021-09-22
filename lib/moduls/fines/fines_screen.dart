import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class FinesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(context: context,),
        backgroundColor: backGround,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              width:double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/wallet.svg',
                        width: 50.0,
                        height: 50.0,
                      ),
                      const SizedBox(width: 15.0,),
                      Text(
                        'تفاصيل الغرامات',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: mainColors,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height:15.0),
                  Text(
                    '* يجب مراعاه اضافه الغرامات للمصاريف الدراسيه للترم التالي',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: mainColors,
                    ),
                  ),
                  const SizedBox(height:5.0),
                  Container(
                    width: double.infinity,
                    height:1.0,
                    color: separator,
                  ),
                  const SizedBox(height: 15.0,),
                  Row(
                    children: [
                      Text(
                        'صيانه',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: mainColors,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '50 جنيه',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: separator,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  Row(
                    children: [
                      Text(
                        'غرامه تقسيط',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: mainColors,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '150 جنيه',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: separator,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  Row(
                    children: [
                      Text(
                        'دخول متأخر',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: mainColors,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '50 جنيه',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: separator,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  Row(
                    children: [
                      Text(
                        ' غياب بدون أذن',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: mainColors,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '20 جنيه',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: separator,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 150,
                  ),

                  Container(
                    width: double.infinity,
                    height:1.0,
                    color: separator,
                  ),
                  const SizedBox(height: 10.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'اجمالي الغرامات',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: mainColors,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '320 جنيه',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0,),
                  defaultButton(
                    text: 'العوده الي الرئيسيه',
                    function: () {
                      navigateTo(context, HomeScreen());
                    },
                    width: double.infinity,
                    btnColor: mainColors,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
