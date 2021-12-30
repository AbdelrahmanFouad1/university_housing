import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/moduls/dash_board/rooms/success_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class AddStudent extends StatelessWidget {
  AddStudent({Key? key}) : super(key: key);
  var idController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit,DashBoardStates>(
        listener: (context,state){
          if(state is postStudentSuccessStates ){
            navigateTo(context, const AddingSuccessScreen());
          }
          if(state is postStudentLoadingStates ){
            showDialog<void>(
                context: context,
                builder: (context)=> waitingDialog(context: context)
            );
          }
          if (state is postStudentErrorStates ){
            Navigator.pop(context);
          }
        },
        builder: (context,state){
          var cubit = DashBoardCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: dashAppBar(title: 'الساكنين', context: context),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      defaultDashBoardTitleBox(
                        svgImage:  'assets/images/follow.svg',
                        title: 'إضافة ساكن جديد',
                        svg: true,
                      ),

                      const SizedBox(height: 30.0,),
                      Container(
                        width: double.infinity,
                        height:1.0,
                        color: separator,
                      ),
                      const SizedBox(height: 30.0,),

                      dashTextFormField(
                        context: context,
                        type: TextInputType.number,
                        controller: idController,
                        hint: 'رقم الطالب',
                      ),
                      const SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.text,
                        controller: nameController,
                        hint: 'اسم الطالب',
                      ),
                      const SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.text,
                        controller: passwordController,
                        hint: 'كلمة المرور',
                      ),
                      const SizedBox(height: 12.0,),



                      // gender
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'النوع :',
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
                                      groupValue: cubit.gender,
                                      activeColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      focusColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      onChanged: (value) {
                                        cubit.changeGender(true);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'ذكر',
                                    style:
                                    Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const SizedBox(width: 10.0,),
                                  SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: Radio(
                                      value: false,
                                      groupValue: cubit.gender,
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
                                        cubit.changeGender(false);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'أنثى',
                                    style:
                                    Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // type
                      const SizedBox(height: 12.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'الوظيفة :',
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
                                      groupValue: cubit.student,
                                      activeColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      focusColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      onChanged: (value) {
                                        cubit.changeJob(true);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'طلاب',
                                    style:
                                    Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const SizedBox(width: 10.0,),
                                  SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: Radio(
                                      value: false,
                                      groupValue: cubit.student,
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
                                        cubit.changeJob(false);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'عاملين',
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
                      const SizedBox(height: 12.0,),
                      Container(
                        width: double.infinity,
                        height: 70.0 ,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: defaultButton(
                            function: () {
                              validation(
                                context: context,
                                  name: nameController.text,
                                  id: idController.text,
                                  password: passwordController.text,
                                cubit: cubit,
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
  required String id,
  required String name,
  required String password,
  required DashBoardCubit cubit,
}){
  if(id.isEmpty){
    showToast(message: 'أدخل رقم الطالب', state: ToastStates.ERROR);
  }else if(name.isEmpty){
    showToast(message: 'أدخل اسم الطالب', state: ToastStates.ERROR);
  }else if(password.isEmpty){
    showToast(message: 'أدخل كلمة المرور', state: ToastStates.ERROR);
  }else{
    cubit.postStudent(
        id: int.parse(id),
      username: name,
      password: password,
      gender: cubit.gender,
      isStudent: cubit.student ? true :false,
      isEmployee: cubit.student ? false :true,
    );
  }
}
