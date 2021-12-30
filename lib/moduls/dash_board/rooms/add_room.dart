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
  var roomCodeController = TextEditingController();
  var roomNumberController= TextEditingController();
  var floorNumberController = TextEditingController();
  var priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit,DashBoardStates>(
        listener: (context,state){
          if(state is postRoomSuccessStates ){
            navigateTo(context, const AddingSuccessScreen());
          }
          if(state is postRoomLoadingStates ){
            showDialog<void>(
                context: context,
                builder: (context)=> waitingDialog(context: context)
            );
          }
          if (state is postRoomErrorStates ){
            Navigator.pop(context);
          }
        },
        builder: (context,state){
          var cubit = DashBoardCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: dashAppBar(title: 'إدارة الغرف', context: context),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      defaultDashBoardTitleBox(
                          img: 'assets/images/room.png',
                          title: 'إضافة غرفة'
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
                        type: TextInputType.text,
                        controller: codeController,
                        hint: 'كوود المبنى',
                      ),
                      const SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.text,
                        controller: roomCodeController,
                        hint: 'كوود الغرفة',
                      ),
                      const SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.number,
                        controller: roomNumberController,
                        hint: 'رقم الغرفة',
                      ),
                      const SizedBox(height: 12.0,),


                      dashTextFormField(
                        context: context,
                        type: TextInputType.number,
                        controller: floorNumberController,
                        hint: 'رقم الدور',
                      ),
                      const SizedBox(height: 12.0,),


                      // type
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
                                      groupValue: cubit.isSpecialRoom,
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
                                  const SizedBox(width: 10.0,),
                                  SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: Radio(
                                      value: false,
                                      groupValue: cubit.isSpecialRoom,
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

                      // room for
                      const SizedBox(height: 12.0,),
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
                                  const SizedBox(width: 10.0,),
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

                      //status
                      const SizedBox(height: 12.0,),
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
                                  const SizedBox(width: 10.0,),
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
                      const SizedBox(height: 12.0,),
                      Container(
                        width: double.infinity,
                        height: 70.0 ,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: defaultButton(
                            function: () {
                              validation(
                                context: context,
                                  roomCode: roomCodeController.text,
                                  code: codeController.text,
                                  floorNumber: floorNumberController.text,
                                  roomNumber: roomNumberController.text,
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
  required String code,
  required String roomCode,
  required String roomNumber,
  required String floorNumber,
  required DashBoardCubit cubit,
}){
  if(code.isEmpty){
    showToast(message: 'أدخل كوود المبنى', state: ToastStates.ERROR);
  }else if(roomCode.isEmpty){
    showToast(message: 'أدخل كوود الغرفة', state: ToastStates.ERROR);
  }else if(roomNumber.isEmpty){
    showToast(message: 'أدخل رقم الغرفة', state: ToastStates.ERROR);
  }else if(floorNumber.isEmpty){
    showToast(message: 'أدخل رقم الدور', state: ToastStates.ERROR);
  }else{
    cubit.postRoom(
        slug: code,
        availability: cubit.available,
        type: cubit.isSpecialRoom,
        roomfor: cubit.isStudent,
        roomcode: roomCode,
        floor: int.parse(floorNumber),
        roomnumber: int.parse(roomNumber),
    );
  }
}
