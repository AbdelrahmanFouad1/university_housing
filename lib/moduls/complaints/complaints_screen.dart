import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';

class ComplaintsScreen extends StatelessWidget {

  var complaintController = TextEditingController();
   ComplaintsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {
        if(state is PostComplaintsSuccessStates){
          showToast(message: 'تم رفع الشكوى بنجاح', state: ToastStates.SUCCESS);
          complaintController.text = '';
          AppCubit.get(context).getProfileData();
        }else if(state is PostComplaintsErrorStates){
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
                      img: 'assets/images/review.svg',
                      title: 'شكوي عامه',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        'اكتب تفاصيل الشكوى',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    whiteBoard(context, controller: complaintController),
                    const SizedBox(
                      height: 88,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: defaultButton(
                          function: (){
                            AppCubit.get(context).postComplaints(
                                complaints: complaintController.text
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
