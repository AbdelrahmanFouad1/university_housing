import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';

class ChangeLostScreen extends StatelessWidget {
  var lostController = TextEditingController();
   ChangeLostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {
        if(state is PostLostSuccessStates){
          showToast(message: 'تم رفع الشكوى بنجاح', state: ToastStates.SUCCESS);
          lostController.text = '';
          AppCubit.get(context).getProfileData();
        }else if(state is PostLostErrorStates){
          showToast(message: 'لم يتم رفع الشكوى, الرجاء المحاولة في وقت لاحق', state: ToastStates.ERROR);
          AppCubit.get(context).getProfileData();
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
                      img: 'assets/images/locate.svg',
                      title: 'بلاغ عن شئ مفقود',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'اكتب تفاصيل عن المفقودات',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    whiteBoard(context, controller: lostController),
                    const SizedBox(
                      height: 88,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: defaultButton(
                          function: (){
                            AppCubit.get(context).postLost(
                                complaints: lostController.text
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
