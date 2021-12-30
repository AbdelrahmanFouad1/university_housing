import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/moduls/requests/change_room/success_change_room_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class ChangeRoomScreen extends StatelessWidget {

  var floorController = TextEditingController();
  var roomController = TextEditingController();


  ChangeRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {
        if(state is PostChangeRoomSuccessStates){
          navigateTo(context, const SuccessChangeRoomScreen());
        }else if(state is PostChangeRoomErrorStates){
          showToast(message: 'لم يتم تقديم الطلب, الرجاء المحاولة في وقت لاحق', state: ToastStates.ERROR);
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit =  AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: defaultAppBar(context: context),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    roomBox(
                      roomNumber: AppCubit.get(context).profileModel!.roomnumber,
                      floor: AppCubit.get(context).profileModel!.floor,
                      buildingName: AppCubit.get(context).profileModel!.buildingName,
                    ),
                    const SizedBox(height: 12.0,),
                    Text(
                      'طلب تغيير الغرفة',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 24.0,),

                    // change floor
                    Container(
                      width: double.infinity,
                      height:45.0,
                      margin: const EdgeInsets.symmetric(horizontal: 14.0),
                      decoration: BoxDecoration(
                        color:ThemeCubit.get(context).darkTheme? finesColorDark : Colors.white,
                        borderRadius: BorderRadius.circular(8.0,),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextFormField(
                        controller: floorController,
                        // enabled: false,
                        readOnly: true,
                        onTap: () {
                          showDialog<void>(
                              context: context,
                              builder: (context) => buildDialog(
                                  context: context,
                                  title: 'اختر رقم الدور',
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: cubit.groupFloor.map((e) => RadioListTile(
                                      activeColor:ThemeCubit.get(context).darkTheme? mainTextColor: backGroundDark,
                                      tileColor: backGroundDark,
                                      title: Text(
                                          e.text,
                                        style: Theme.of(context).textTheme.bodyText1!,
                                      ),
                                      groupValue: cubit.currVal,
                                      value: e.index,
                                      onChanged: (int? val) {
                                        cubit.changeFloor(val!, e.text);
                                        floorController.text = cubit.currText;
                                        Navigator.pop(context);
                                      },
                                    )).toList(),
                                  ),
                              ),
                          );
                        },
                        decoration:   InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down,
                            color:ThemeCubit.get(context).darkTheme? mainTextColor : Colors.black38,
                          ),
                          hintText: 'اختر رقم الدور',
                          hintStyle: Theme.of(context).textTheme.subtitle1,
                          contentPadding:const EdgeInsetsDirectional.all(8.0),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16.0,),

                    // change room
                    Container(
                      width: double.infinity,
                      height:45.0,
                      margin: const EdgeInsets.symmetric(horizontal: 14.0),
                      decoration: BoxDecoration(
                        color:ThemeCubit.get(context).darkTheme? finesColorDark : Colors.white,
                        borderRadius: BorderRadius.circular(8.0,),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextFormField(
                        controller: roomController,
                        readOnly: true,
                        onTap: (){
                          if(floorController.text.isEmpty){
                            showToast(state: ToastStates.WARNING,message: 'أدخل رقم الدور أولا');
                          }else{
                            showDialog<void>(
                              context: context,
                              builder: (context) => buildDialog(
                                context: context,
                                title: 'اختر رقم الغرفه',
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: cubit.roomsList.isEmpty? [
                                    Container(
                                      padding: const EdgeInsetsDirectional.all(10.0),
                                      child: Text(
                                          'لا يوجد غرف في هذا الدور حاليا !!',
                                        style: Theme.of(context).textTheme.subtitle2,
                                      ),
                                    ),
                                  ]: cubit.roomsList.map((e) => RadioListTile(
                                    title: Text(
                                      e.roomNum.toString(),
                                      style: Theme.of(context).textTheme.bodyText1!,
                                    ),
                                    groupValue: cubit.currentRoomVal,
                                    value: e.index,
                                    onChanged: (int? val) {
                                      cubit.selectRoom(val!, e.roomNum.toString() ,e.idDB);
                                      roomController.text = cubit.currentRoomText;
                                      cubit.showAllDetails(true);
                                      Navigator.pop(context);
                                    },
                                  )).toList(),
                                ),
                              ),
                            );
                          }
                        },
                        decoration:   InputDecoration(
                          border: InputBorder.none,
                          suffixIcon:  Icon(
                            Icons.keyboard_arrow_down,
                            color:ThemeCubit.get(context).darkTheme? mainTextColor : Colors.black38,
                          ),
                          hintText: 'اختر رقم الغرفة',
                          hintStyle: Theme.of(context).textTheme.subtitle1,
                          contentPadding:const EdgeInsetsDirectional.all(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 160.0,),


                    defaultButton(
                      function: (){
                        if(floorController.text.isEmpty || roomController.text.isEmpty){
                          showToast(message: 'بررجاء أستكمال البيانات لتقديم الطلب', state: ToastStates.WARNING);
                        }else{
                          int floor =int.parse(floorController.text);
                          int room =int.parse(roomController.text);
                          AppCubit.get(context).postChangeRoom(room: room, floor: floor);
                        }
                      },
                      text: 'تقديم الطلب',
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
        );
      },

    );
  }
}

class ChangeFloorModel {
  late String text;
  late int index;

  ChangeFloorModel({
    required this.text,
    required this.index,
  });
}

class ChangeRoomModel {
  late String text;
  late int index;

  ChangeRoomModel({
    required this.text,
    required this.index,
  });
}
