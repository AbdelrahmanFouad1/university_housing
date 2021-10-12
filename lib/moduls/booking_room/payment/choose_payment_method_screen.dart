import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/moduls/booking_room/payment/e_payment_screen.dart';
import 'package:university_housing/moduls/booking_room/payment/receipt_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class ChoosePaymentMethodScreen extends StatelessWidget {
  const ChoosePaymentMethodScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (create)=> AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          // var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: defaultAppBar(context: context),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          const Expanded(
                            flex: 1,
                            child: Text(
                              '. . .',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey,
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
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0,),
                      Center(
                        child: Text(
                          'أختر وسيله الدفع',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(height: 22.0,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: (){
                                  navigateTo(context, ReceiptScreen());
                                },
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: mainColors,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: const Text(
                                    'رفع الإيصال',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0,),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: (){
                                  navigateTo(context, E_PaymentScreen());
                                },
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: mainColors,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: const Text(
                                    'الدفع الكترونيا',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        alignment: AlignmentDirectional.center,
                        child: SvgPicture.asset(
                          'assets/images/questions.svg',
                          height: 400.0,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ) ,
    );
  }
}
