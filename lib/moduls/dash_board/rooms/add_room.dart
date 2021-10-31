import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/moduls/dash_board/rooms/success_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class AddRoom extends StatelessWidget {
  AddRoom({Key? key}) : super(key: key);
  var codeController = TextEditingController();
  var nameController = TextEditingController();
  var roomNumberController= TextEditingController();
  var floorNumberController = TextEditingController();
  var priceController = TextEditingController();

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
                          img: 'assets/images/room.png',
                          title: 'إضافة غرفة'
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
                        type: TextInputType.number,
                        controller: roomNumberController,
                        hint: 'رقم الغرفة',
                      ),
                      SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.number,
                        controller: floorNumberController,
                        hint: 'رقم الدور',
                      ),
                      SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.number,
                        controller: priceController,
                        hint: 'السعر',
                      ),

                      SizedBox(height: 12.0,),
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
                                      groupValue: cubit.isSingle,
                                      activeColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      focusColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      onChanged: (value) {
                                        cubit.changeRoomType(true);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'فردي',
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
                                      groupValue: cubit.isSingle,
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
                                        cubit.changeRoomType(false);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'زوجي',
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
                                'مخصصه لي :',
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
                                      groupValue: cubit.isStudent,
                                      activeColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      focusColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      onChanged: (value) {
                                        cubit.changeRoomFor(true);
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
                                  SizedBox(width: 10.0,),
                                  SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: Radio(
                                      value: false,
                                      groupValue: cubit.isStudent,
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
                                        cubit.changeRoomFor(false);
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
                                      groupValue: cubit.available,
                                      activeColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      focusColor:
                                      ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,
                                      onChanged: (value) {
                                        cubit.changeRoomStatues(true);
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
                                      groupValue: cubit.available,
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
                                        cubit.changeRoomStatues(false);
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
                                context: context,
                                code: codeController.text,
                                floorNumber: floorNumberController.text,
                                price: priceController.text,
                                roomNumber: roomNumberController.text
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
  required String roomNumber,
  required String floorNumber,
  required String price,
}){
  if(code.isEmpty){
    showToast(message: 'أدخل الكوود', state: ToastStates.ERROR);
  }else if(name.isEmpty){
    showToast(message: 'أدخل اسم المبنى', state: ToastStates.ERROR);
  }else if(roomNumber.isEmpty){
    showToast(message: 'أدخل رقم الغرفة', state: ToastStates.ERROR);
  }else if(floorNumber.isEmpty){
    showToast(message: 'أدخل رقم الدور', state: ToastStates.ERROR);
  }else if(price.isEmpty){
    showToast(message: 'أدخل السعر', state: ToastStates.ERROR);
  }else{
    navigateTo(context, AddingSuccessScreen());
  }
}
