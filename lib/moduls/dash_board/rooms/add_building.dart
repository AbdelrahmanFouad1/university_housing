import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/moduls/dash_board/rooms/success_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class AddBuilding extends StatelessWidget {
  AddBuilding({Key? key}) : super(key: key);
  var codeController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var student_roomController = TextEditingController();
  var employee_roomController = TextEditingController();
  var manager_nameController = TextEditingController();
  var manager_phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit,DashBoardStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = DashBoardCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: dashAppBar(title: 'إدارة الغرف', context: context),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      defaultDashBoardTitleBox(
                          img: 'assets/images/home.png',
                          title: 'إضافة مبنى'
                      ),

                      SizedBox(height: 30.0,),
                      Container(
                        width: double.infinity,
                        height:1.0,
                        color: separator,
                      ),
                      SizedBox(height: 30.0,),

                      dashTextFormField(
                        context: context,
                        type: TextInputType.text,
                        controller: codeController,
                        hint: 'كوود المبنى',
                      ),
                      SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.text,
                        controller: nameController,
                        hint: 'اسم المبنى',
                      ),
                      SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.text,
                        controller: addressController,
                        hint: 'العنوان',
                      ),
                      SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.number,
                        controller: student_roomController,
                        hint: 'عدد غرف الطلبة',
                      ),
                      SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.number,
                        controller: employee_roomController,
                        hint: 'عدد غرف العاملين',
                      ),
                      SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.text,
                        controller: manager_nameController,
                        hint: 'اسم مشرف المبنى',
                      ),

                      SizedBox(height: 12.0,),
                      dashTextFormField(
                        context: context,
                        type: TextInputType.number,
                        controller: manager_phoneController,
                        hint: 'رقم المشرف',
                      ),


                      SizedBox(height: 12.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'المستوى :',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: Radio(
                                      value: true,
                                      groupValue: cubit.isSpecial,
                                      activeColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      focusColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      onChanged: (value) {
                                        cubit.changeBuildingLevel(true);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'مميز',
                                    style:
                                    Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0,),
                                  SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: Radio(
                                      value: false,
                                      groupValue: cubit.isSpecial,
                                      activeColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      focusColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      hoverColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      onChanged: (value) {
                                        cubit.changeBuildingLevel(false);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'عادي',
                                    style:
                                    Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 12.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'الحالة :',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: Radio(
                                      value: true,
                                      groupValue: cubit.isWorking,
                                      activeColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      focusColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      onChanged: (value) {
                                        cubit.changeBuildingStatues(true);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'متاح للسكن',
                                    style:
                                    Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0,),
                                  SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: Radio(
                                      value: false,
                                      groupValue: cubit.isWorking,
                                      activeColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      focusColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      hoverColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      onChanged: (value) {
                                        cubit.changeBuildingStatues(false);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'معطل',
                                    style:
                                    Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // button
                      SizedBox(height: 12.0,),
                      Container(
                        width: double.infinity,
                        height: 70.0 ,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: defaultButton(
                            function: () {
                              validation(
                                name: nameController.text,
                                managerPhone: manager_phoneController.text,
                                address: addressController.text,
                                context: context,
                                code: codeController.text,
                                managerName: manager_nameController.text,
                                numOfEmployee: employee_roomController.text,
                                numOfStudents: employee_roomController.text
                              );
                            },
                            text: 'تأكيد',
                            btnColor: mainColors),
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



void validation({
  required context,
  required String code,
  required String name,
  required String address,
  required String numOfStudents,
  required String numOfEmployee,
  required String managerName,
  required String managerPhone,
}){
  if(code.isEmpty){
    showToast(message: 'أدخل الكوود', state: ToastStates.ERROR);
  }else if(name.isEmpty){
    showToast(message: 'أدخل اسم المبنى', state: ToastStates.ERROR);
  }else if(address.isEmpty){
    showToast(message: 'أدخل العنوان', state: ToastStates.ERROR);
  }else if(numOfStudents.isEmpty){
    showToast(message: 'أدخل عدد غرف الطلبة', state: ToastStates.ERROR);
  }else if(numOfEmployee.isEmpty){
    showToast(message: 'أدخل عدد غرف العاملين', state: ToastStates.ERROR);
  }else if(managerName.isEmpty){
    showToast(message: 'أدخل اسم المشرف', state: ToastStates.ERROR);
  }else if(managerPhone.isEmpty){
    showToast(message: 'أدخل رقم المشرف', state: ToastStates.ERROR);
  }else if(managerPhone.length != 11){
    showToast(message: 'رقم الموبيل غير صحيح', state: ToastStates.ERROR);
  }else{
    navigateTo(context, AddingSuccessScreen());
  }
}
