import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';

import '../booking_done_screen.dart';

class E_PaymentScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

   E_PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: defaultAppBar(context: context),
              body: SafeArea(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
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
                          ),
                          const SizedBox(height: 12.0,),
                          CreditCardWidget(
                            cardNumber: cubit.cardNumber,
                            expiryDate: cubit.expiryDate,
                            cardHolderName: cubit.cardHolderName,
                            cvvCode: cubit.cvvCode,
                            showBackView: cubit.isCvvFocused,
                            obscureCardNumber: true,
                            obscureCardCvv: true,
                            isHolderNameVisible: true,
                            animationDuration: const Duration(milliseconds: 1000),
                            onCreditCardWidgetChange: (CreditCardBrand ) {  },
                          ),
                          CreditCardForm(
                            cardNumber: cubit.cardNumber,
                            expiryDate: cubit.expiryDate,
                            cardHolderName:  cubit.cardHolderName,
                            cvvCode: cubit.cvvCode,
                            onCreditCardModelChange: cubit.changeCreditCardModel,
                            themeColor: Colors.blue,
                            formKey: formKey,
                            cardNumberDecoration:  const InputDecoration(
                                border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                                hintText: 'xxxx xxxx xxxx xxxx',
                              labelText: 'Number',
                              labelStyle: TextStyle(

                              ),
                            ),
                            expiryDateDecoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                              labelText: 'Expired Date',
                                hintText: 'xx/xx',
                            ),
                            cvvCodeDecoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                              labelText: 'CVV',
                                hintText: 'xxx',
                            ),
                            cardHolderDecoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                                hintText: 'Ex: Nana',
                              labelText: 'Card Holder',
                            ),
                          ),
                          const SizedBox(height: 20.0,),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: defaultButton(
                                function: (){
                                  if(formKey.currentState!.validate()){
                                    showToast(message: 'تم تأكيد البيانات', state: ToastStates.SUCCESS);
                                    navigateTo(context, const BookingDoneScreen());
                                  }
                                  else{
                                    showToast(message: 'البيانات غير صحيحة', state: ToastStates.ERROR);
                                  }
                                },
                              width: double.infinity,
                                text: 'أدفع',
                                btnColor: mainColors,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),
            ),
          );
        },
      ),
    );
  }
}
