import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class TotalCostScreen extends StatelessWidget {
  const TotalCostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(context: context,),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
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
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  const SizedBox(height:10.0),
                  Text(
                    '* يجب مراعاه دفع المصاريف السكنيه لأتمام تسجيلك في السكن الجامعي',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 10.0,
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
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                         Text(
                          'غرفه سكن مميز',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'اجمالي الغرامات',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'أستضافة',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                  const SizedBox(height: 60.0,),
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
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const Spacer(),
                       Text(
                        '500 جنيه',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color:ThemeCubit.get(context).darkTheme? Colors.white : Colors.black,
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
