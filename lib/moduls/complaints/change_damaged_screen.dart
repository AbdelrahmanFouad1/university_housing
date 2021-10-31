import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';

class ChangeDamagedScreen extends StatelessWidget {
  var damageController = TextEditingController();
   ChangeDamagedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {
        if(state is PostDamagedSuccessStates){
          showToast(message: 'تم رفع الشكوى بنجاح', state: ToastStates.SUCCESS);
        }else if(state is PostDamagedErrorStates){
          showToast(message: 'لم يتم رفع الشكوى, الرجاء المحاولة في وقت لاحق', state: ToastStates.ERROR);
        }
      },
      builder: (BuildContext context, Object? state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: defaultAppBar(context: context, state: state),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    defaultTitleBox(
                      img: 'assets/images/broken-plate.svg',
                      title: 'تغيير شئ تالف',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        'اكتب تفاصيل عن الشئ التالف',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    whiteBoard(context,controller: damageController),
                    const SizedBox(
                      height: 88,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: defaultButton(
                          function: (){
                            AppCubit.get(context).postDamaged(
                                complaints: damageController.text
                            );
                          },
                          text: 'تقديم الطلب',
                          radius: 8.0,
                          height: 47,
                          btnColor: mainColors,
                          width: double.infinity
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
