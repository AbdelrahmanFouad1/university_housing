import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/moduls/security/success/success_enttre_student_screen.dart';
import 'package:university_housing/moduls/security/success/success_exit_student_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/security/security_cubit.dart';
import 'package:university_housing/shard/cubit/security/security_states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class EnterStudentDetailsScreen extends StatelessWidget {
  var exitDateController = TextEditingController();
  var exitTimeController = TextEditingController();
  var enterDateController = TextEditingController();
  var enterTimeController = TextEditingController();
  var notesController = TextEditingController();
  bool show_warning = false ;

  EnterStudentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SecurityCubit(),
      child: BlocConsumer<SecurityCubit, SecurityStates>(
        listener: (BuildContext context, state) {
          if( state is SecurityShowWarningState){
            show_warning = true;
          }else{
            show_warning = false;
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = SecurityCubit.get(context);
          return Directionality(
            textDirection: ui.TextDirection.rtl,
            child: Scaffold(
              appBar: dashAppBar(title: 'التفاصيل', context: context),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.0,),

                        //warning
                        if(show_warning == true)
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
                            const CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'عبدالرحمن محمد فؤاد',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  '42018122',
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
                              child: Container(
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
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 8.0,
                            ),

                            // time
                            Expanded(
                              child: Container(
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
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      if(value == null){
                                        showToast(message: 'برجاء تحديد الوقت', state: ToastStates.WARNING);
                                      }else{
                                        checkTime(value.hour.toString(),cubit);
                                        exitTimeController.text = value.format(context).toString();
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
                              child: Container(
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
                              child: Container(
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
                                        checkTime(value.hour.toString(),cubit);
                                        enterTimeController.text = value.format(context).toString();
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
                          'الملاحظات',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),

                        //notes
                        Container(
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
                            if (exitDateController.text == ''||exitTimeController.text == '') {
                              showToast(message: 'برجاء أدخال تاريخ و وقت الخروج', state: ToastStates.ERROR);
                            }else if(enterDateController.text != '' && enterTimeController.text != ''){
                              navigateTo(context, const SuccessEnterStudentScreen());
                            }else{
                              navigateTo(context, const SuccessExitStudentScreen());
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


void checkTime (h,cubit){
  for(int i=18;i<25;i++){
    if(h==i.toString()){
      cubit.showStudentWarning(true);
    }
  }
  for(int i=1;i<18;i++){
    if(h==i.toString()){
      cubit.showStudentWarning(false);
    }
  }

}