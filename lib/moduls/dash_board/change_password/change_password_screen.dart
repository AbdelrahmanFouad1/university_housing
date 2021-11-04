import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  var passController = TextEditingController();
  var newPassController = TextEditingController();
  var confirmNewPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'تغيير كلمه المرور',
              context: context,
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    SizedBox(height: 12.0,),
                    dashPasswordFormField(
                      context: context,
                      hint: 'كلمة المرور السابقة',
                      cubit: cubit,
                      passwordController: passController,
                      index: 1,
                    ),

                    SizedBox(height: 12.0,),
                    InkWell(
                      onTap: (){
                        cubit.index = 2;
                      },
                      child: dashPasswordFormField(
                          context: context,
                          hint: 'كلمة المرور الجديده',
                          cubit: cubit,
                          passwordController: newPassController,
                          index: 2,
                      ),
                    ),
                    SizedBox(height: 12.0,),
                    dashPasswordFormField(
                        context: context,
                        hint: 'تأكيد كلمة المرور',
                        cubit: cubit,
                        passwordController: confirmNewPassController,
                        index: 3,
                    ),


                    SizedBox(height: 22.0,),
                    defaultButton(
                      function: (){
                        validation(
                          context: context,
                          newPass: newPassController.text,
                          confirmPass: confirmNewPassController.text,
                        );
                      },
                      text: 'تأكيد',
                      width: double.infinity,
                      height: 47.0,
                      btnColor: mainColors,
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
  required String newPass,
  required String confirmPass,
}){
  if(newPass != confirmPass){
    showToast(message: 'قم بإدخال الباسوورد بطريقة صحيحه', state: ToastStates.ERROR);
  }else{
  //  done
  }
}