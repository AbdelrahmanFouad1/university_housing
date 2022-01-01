import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/model/main_security_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/cubit/security/security_cubit.dart';
import 'package:university_housing/shard/cubit/security/security_states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

import 'success/success_enttre_student_screen.dart';

class EnterStudentDetailsScreen extends StatelessWidget {
  var exitDateController = TextEditingController();
  var exitTimeController = TextEditingController();
  var enterDateController = TextEditingController();
  var enterTimeController = TextEditingController();
  var notesController = TextEditingController();
  EnterStudentDetailsScreen({Key? key, required this.item}) : super(key: key);
  MainSecurityModel item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SecurityCubit(),
      child: BlocConsumer<SecurityCubit, SecurityStates>(
        listener: (BuildContext context, state) {

          if (state is PostAttendanceErrorStates || state is PutAttendanceErrorStates ) {
            Navigator.pop(context);
          }
          if (state is PostAttendanceLoadingStates || state is PutAttendanceLoadingStates) {
            showDialog<void>(
                context: context,
                builder: (context) => waitingDialog(context: context));
          }
        },
        builder: (BuildContext context, Object? state) {
          if(item.ExitandEnters.isNotEmpty){
            if(item.ExitandEnters.last.exitDate.isNotEmpty && item.ExitandEnters.last.enterDate.isNotEmpty){
              enterDateController.text = '';
              enterTimeController.text = '';
            }else if(item.ExitandEnters.isNotEmpty){
              enterDateController.text = item.ExitandEnters.last.enterDate;
              enterTimeController.text = item.ExitandEnters.last.enterAt;
            }
          }

          if(state is SecurityShowWarningState){
            enterDateController.text = securityDate;
            enterTimeController.text = securityTime;
          }

          var cubit = SecurityCubit.get(context);
          return Directionality(
            textDirection: ui.TextDirection.rtl,
            child: Scaffold(
              appBar: dashAppBar(title: 'التفاصيل', context: context),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20.0,),

                        //warning
                        if(cubit.showWarning == true)
                        Container(
                          width: double.infinity,
                          height: 40.0,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            color: warning,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: const Text(
                            'لقد تعدى الوقت المصرح له للدخول !!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),

                        // profile
                        Row(
                          children: [
                            if(item.image.isNotEmpty)
                              CircleAvatar(
                              radius: 30.0,
                              backgroundColor: ThemeCubit.get(context).darkTheme
                                  ? mainTextColor
                                  : mainColors,
                              backgroundImage: NetworkImage(
                                item.image
                              ),
                            ),
                            if(item.image.isEmpty)
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: ThemeCubit.get(context).darkTheme
                                    ? mainTextColor
                                    : mainColors,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 80.0,
                                  child: Icon(Icons.error,
                                    color: ThemeCubit.get(context).darkTheme
                                        ? mainColors
                                        : mainTextColor,
                                  ),
                                ),
                              ),

                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.username,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  item.id.toString(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 12.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),

                        Text(
                          'الدخول',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),

                        //enter
                        Row(
                          children: [
                            //Date
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: 40.0,
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  controller: enterDateController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'تاريخ الدخول',
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 14.0),
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2030-12-12')
                                    ).then((value) {
                                      if(value == null){
                                        showToast(message: 'برجاء تحديد التاريخ', state: ToastStates.WARNING);
                                      }else{
                                        enterDateController.text = DateFormat.yMMMd().format(value);
                                        securityDate = DateFormat.yMMMd().format(value);
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 8.0,
                            ),

                            // time
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: 40.0,
                                child: TextFormField(
                                  textDirection: ui.TextDirection.ltr,
                                  textAlign: TextAlign.end,
                                  controller: enterTimeController,
                                  keyboardType: TextInputType.number,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'وقت الدخول',
                                    hintTextDirection: ui.TextDirection.ltr,
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 14.0),
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  onTap: (){
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      if(value == null){
                                        showToast(message: 'برجاء تحديد الوقت', state: ToastStates.WARNING);
                                      }else{
                                        checkTime(
                                          h: value.hour.toString(),
                                          time: enterTimeController.text,
                                          date: enterDateController.text,
                                          cubit: cubit
                                        );
                                        enterTimeController.text = value.format(context).toString();
                                        securityTime=value.format(context).toString();
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),

                        Text(
                            'الخروج',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),

                        //Exit
                        Row(
                          children: [
                            //Date
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: 40.0,
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  controller: exitDateController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'تاريخ الخروج',
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 14.0),
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    if(enterDateController.text.isNotEmpty && enterTimeController.text.isNotEmpty ){
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.parse('2030-12-12')
                                      ).then((value) {
                                        if(value == null){
                                          showToast(message: 'برجاء تحديد التاريخ', state: ToastStates.WARNING);
                                        }else{
                                          exitDateController.text = DateFormat.yMMMd().format(value);
                                        }
                                      });
                                    }else{
                                      showToast(message: 'يجب إدخال بيانات الدخول أولا ', state: ToastStates.WARNING);
                                    }
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 8.0,
                            ),

                            // time
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: 40.0,
                                child: TextFormField(
                                  textDirection: ui.TextDirection.ltr,
                                  textAlign: TextAlign.end,
                                  controller: exitTimeController,
                                  keyboardType: TextInputType.number,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'وقت الخروج',
                                    hintTextDirection: ui.TextDirection.ltr,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 14.0),
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  onTap: (){
                                    if(enterDateController.text.isNotEmpty && enterTimeController.text.isNotEmpty ){
                                     showTimePicker(
                                       context: context,
                                       initialTime: TimeOfDay.now(),
                                     ).then((value) {
                                       if(value == null){
                                         showToast(message: 'برجاء تحديد الوقت', state: ToastStates.WARNING);
                                       }else{
                                         exitTimeController.text = value.format(context).toString();
                                       }
                                     });
                                   }else{
                                     showToast(message: 'يجب إدخال بيانات الدخول أولا ', state: ToastStates.WARNING);
                                   }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),

                        Text(
                          'الملاحظات',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),

                        //notes
                        SizedBox(
                          width: double.infinity,
                          height: 40.0,
                          child: TextFormField(
                            controller: notesController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'ملاحظات',
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 14.0),
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 54.0,
                        ),

                        defaultButton(
                          function: () {
                            if(exitDateController.text.isNotEmpty && exitTimeController.text.isNotEmpty && enterDateController.text.isNotEmpty && enterTimeController.text.isNotEmpty){
                              cubit.putAttendance(
                                  idDB: item.idDB,
                                  exitDate: exitDateController.text,
                                  exitAt: exitTimeController.text,
                                  enterDate: enterDateController.text,
                                  enterAt: enterTimeController.text,
                                  Notes: notesController.text,
                                  attendanceID: item.ExitandEnters.last.idDB,
                                  context: context
                              );
                            }else if(enterDateController.text.isNotEmpty && enterTimeController.text.isNotEmpty){
                              cubit.postAttendance(
                                  idDB: item.idDB,
                                  enterDate: enterDateController.text,
                                  enterAt:enterTimeController.text,
                                  Notes: notesController.text,
                                  context: context
                              );
                            }
                          },
                          text: 'تأكيد',
                          width: double.infinity,
                          height: 47.0,
                          btnColor: mainColors,
                          marginSize: const EdgeInsets.symmetric(horizontal: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


void checkTime ({
  required h,
  required SecurityCubit cubit,
  required String date,
  required String time,
}){
  for(int i=18;i<25;i++){
    if(h==i.toString()){
      cubit.showStudentWarning(
        isLate: true,
      );
    }
  }
  for(int i=1;i<18;i++){
    if(h==i.toString()){
      cubit.showStudentWarning(
        isLate: false,
      );
    }
  }

}