import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class TotalCostScreen extends StatelessWidget {
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
                        'تفاصيل المصاريف السكنيه',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: mainColors,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height:10.0),
                  Text(
                    '* يجب مراعاه دفع المصاريف السكنيه لأتمام تسجيلك في السكن الجامعي',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: mainColors,
                    ),
                  ),
                  const SizedBox(height:5.0),
                  Container(
                    width: double.infinity,
                    height:1.0,
                    color: separator,
                  ),
                  const SizedBox(height: 10.0,),
                  Text(
                    'تكلفه الغرفه',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: mainColors
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'غرفه سكن مميز',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '3500 جنيه',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: separator,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35.0,),
                  Text(
                    'الغرامات',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: mainColors
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'اجمالي الغرامات',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '150 جنيه',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: separator,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35.0,),
                  Text(
                    'مصاريف اضافية',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: mainColors
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'أستضافة',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '300 جنيه',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: separator,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 60.0,),
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
                        'اجمالي المبلغ المستحق',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: mainColors,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '500 جنيه',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: defaultButton(
                          text: 'رفع الإيصال',
                          function: () {
                            showToast(message: 'غير مصرح لك الدفع حاليا', state: ToastStates.WARNING);
                          },
                          width: double.infinity,
                          btnColor: mainColors,
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      Expanded(
                        flex: 1,
                        child: defaultButton(
                          text: 'الدفع الكترونيا',
                          function: () {
                            showToast(message: 'غير مصرح لك الدفع حاليا', state: ToastStates.WARNING);
                          },
                          width: double.infinity,
                          btnColor: mainColors,
                        ),
                      ),
                    ],
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
