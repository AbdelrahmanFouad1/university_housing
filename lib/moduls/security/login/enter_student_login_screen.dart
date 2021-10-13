import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/moduls/security/success/success_enttre_student_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/security/security_cubit.dart';
import 'package:university_housing/shard/cubit/security/security_states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class EnterStudentLoginScreen extends StatelessWidget {
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var nameController = TextEditingController();
  var idController = TextEditingController();
  var notesController = TextEditingController();
  bool show_warning = false ;

  EnterStudentLoginScreen({Key? key}) : super(key: key);

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
              appBar: AppBar(
                titleSpacing: 20.0,
                automaticallyImplyLeading: false,
                actions: [
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      width: 30.0,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon:  Icon(
                          IconBroken.Arrow___Left_2,
                          color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  const SizedBox(width: 6.0,),
                ],
                  title: Text(
                    'تسجيل دخول الطالب الى السكن',
                    style: Theme.of(context).textTheme.headline6,
                  ),
              ),
              body: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
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
                            height: 18.0,
                          ),

                          Container(
                            width: double.infinity,
                            height: 40.0,
                            margin: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                ),
                                hintText: 'اسم الطالب',
                                contentPadding: EdgeInsets.symmetric(horizontal: 14.0),
                                hintStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                errorBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          Container(
                            width: double.infinity,
                            height: 40.0,
                            margin: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: TextFormField(
                              controller: idController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'رقم الطالب',
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
                            height: 18.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.only(
                                    start: 14.0,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    controller: dateController,
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
                                          dateController.text = DateFormat.yMMMd().format(value);
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.only(
                                    end: 14.0,
                                  ),
                                  child: TextFormField(
                                    textDirection: ui.TextDirection.ltr,
                                    textAlign: TextAlign.end,
                                    controller: timeController,
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
                                          timeController.text = value.format(context).toString();
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
                          Container(
                            width: double.infinity,
                            height: 40.0,
                            margin: const EdgeInsets.symmetric(horizontal: 14.0),
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
                              if (nameController.text == '' ||idController.text == ''||dateController.text == ''||timeController.text == '') {
                                showToast(message: 'برجاء أدخال جميع البيانات', state: ToastStates.ERROR);
                              }else{
                                navigateTo(context, const SuccessEnterStudentScreen());
                              }
                            },
                            text: 'تأكيد',
                            width: double.infinity,
                            height: 47.0,
                            btnColor: mainColors,
                            marginSize: const EdgeInsets.symmetric(horizontal: 14.0),
                          ),
                          const SizedBox(
                            height: 180.0,
                          ),
                        ],
                      ),
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