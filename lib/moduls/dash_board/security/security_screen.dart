import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/model/get_dash_security_model.dart';
import 'package:university_housing/model/security_model.dart';
import 'package:university_housing/moduls/dash_board/rooms/available_now.dart';
import 'package:university_housing/moduls/dash_board/security/security_details_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen({Key? key}) : super(key: key);

  var buildingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'إداره الأمن',
              context: context,
              action: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                width: 30.0,
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: ThemeCubit
                        .get(context)
                        .darkTheme
                        ? mainTextColor
                        : mainColors,
                  ),
                  onPressed: () {
                    ThemeCubit.get(context).changeTheme();
                  },
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultDashBoardTitleBox(
                        img: 'assets/images/security.png',
                        title: 'إداره الأمن'
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'اسم المبنى :',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.only(top: 12.0),
                            decoration: BoxDecoration(
                              color:
                              ThemeCubit
                                  .get(context)
                                  .darkTheme ? finesColorDark : Colors.white,
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: TextFormField(
                              controller: buildingController,
                              readOnly: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'إسكان مميز (أ)',
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                  color: Colors.grey
                                ),
                              ),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1,
                              textAlign: TextAlign.center,
                              onTap: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (context) =>
                                      buildDialog(
                                          context: context,
                                          title: 'اختر المبنى',
                                          child: SingleChildScrollView(
                                            physics: BouncingScrollPhysics(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: cubit.buildingsName.map((e) =>
                                                  RadioListTile(
                                                    activeColor: ThemeCubit
                                                        .get(context)
                                                        .darkTheme
                                                        ? mainTextColor
                                                        : backGroundDark,
                                                    tileColor: backGroundDark,
                                                    title: Text(
                                                      e.text,
                                                    ),
                                                    groupValue: cubit
                                                        .currentSecurityBuildingVal,
                                                    value: e.index,
                                                    onChanged: (int? val) {
                                                      cubit.selectSecurityBuilding(val ?? e.index , e.text);
                                                      buildingController.text =
                                                          e.text;
                                                      Navigator.pop(context);
                                                    },
                                                  )).toList(),
                                            ),
                                          )
                                      ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: separator,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Builder(
                        builder:(context){
                          if(cubit.allAttendance.length == 0){
                            return Container(
                                width:double.infinity,
                                height: 300.0,
                                child: Center(child: CircularProgressIndicator()));
                          }else{
                            return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) =>
                                  securityItem(
                                    item: cubit.allAttendance[index],
                                    cubit: cubit,
                                    context: context,
                                    index: index,
                                  ),
                              separatorBuilder: (context, index) => Container(
                                    margin: EdgeInsets.symmetric(vertical: 10.0),
                                    width: double.infinity,
                                    height: 1.0,
                                    color: separator,
                                  ),
                              itemCount: cubit.allAttendance.length,
                            );
                          }
                        }
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

Widget securityItem({
  required context,
  required DashBoardCubit cubit,
  required GetDashSecurityModel item,
  required int index,
}) {
  var idController = TextEditingController();
  var nameController = TextEditingController();
  var roomController = TextEditingController();
  var buildingController = TextEditingController();
  var detailsController = TextEditingController();
  idController.text = item.id.toString();
  nameController.text = item.username;
  roomController.text = item.roomnumber.toString();
  buildingController.text = item.buildingName;
  detailsController.text = item.exitAndEnters.length.toString();
  return Card(
    color: ThemeCubit
        .get(context)
        .darkTheme ? backGroundDark : backGround,
    elevation: 0.0,
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                item.username,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                item.id.toString(),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
            if (cubit.showSecurity_details == false ||
                cubit.currentSecurityIndex != index)
              Container(
                width: 30.0,
                height: 30.0,
                child: IconButton(
                  onPressed: () {
                    cubit.currentSecurityIndex = index;
                    cubit.showSecurityDetails(
                        !cubit.showSecurity_details, index);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: ThemeCubit
                        .get(context)
                        .darkTheme
                        ? mainTextColor
                        : mainColors,
                  ),
                ),
              ),
            if (cubit.showSecurity_details == true &&
                cubit.currentSecurityIndex == index)
              Container(
                width: 30.0,
                height: 30.0,
                child: IconButton(
                  onPressed: () {
                    cubit.showSecurityDetails(
                        !cubit.showSecurity_details, index);
                  },
                  alignment: Alignment.center,
                  icon: Icon(
                    Icons.keyboard_arrow_up,
                    color: ThemeCubit
                        .get(context)
                        .darkTheme
                        ? mainTextColor
                        : mainColors,
                  ),
                ),
              ),
            // if (cubit.showSecurity_details == true &&
            //     cubit.currentSecurityIndex == index)
              // Container(
              //   width: 50.0,
              //   height: 30.0,
              //   child: IconButton(
              //     onPressed: () {
              //       if (cubit.showSecurityEdit == true) {
              //           item.id = idController.text;
              //           item.name = nameController.text;
              //           item.exitDate = exitDateController.text;
              //           item.exitTime = exitTimeController.text;
              //           item.enterDate = enterDateController.text;
              //           item.enterTime = enterTimeController.text;
              //           item.notes = notesController.text;
              //       }
              //       cubit.changeSecurityEditIcon(!cubit.showSecurityEdit);
              //     },
              //     icon: Icon(
              //       cubit.showSecurityEdit == false ? Icons.edit : Icons.done,
              //       size: 20.0,
              //       color: ThemeCubit
              //           .get(context)
              //           .darkTheme
              //           ? mainTextColor
              //           : mainColors,
              //     ),
              //     alignment: AlignmentDirectional.center,
              //   ),
              // ),
          ],
        ),
        if (cubit.showSecurity_details == true &&
            cubit.currentSecurityIndex == index)
          SizedBox(
            height: 10.0,
          ),
        if (cubit.showSecurity_details == true &&
            cubit.currentSecurityIndex == index)
          AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            height: cubit.animatedSecurityHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cubit.showSecurityEdit == true
                  ? ThemeCubit
                  .get(context)
                  .darkTheme
                  ? mainColors
                  : Colors.white
                  : ThemeCubit
                  .get(context)
                  .darkTheme
                  ? backGroundDark
                  : backGround,
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Column(
                children: [
                  //Id
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '- رقم الطالب :',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                      switchedTextFormField(
                        context: context,
                        cubit: cubit,
                        controller: idController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),

                  // name
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '- اسم الطالب :',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                      switchedTextFormField(
                        context: context,
                        cubit: cubit,
                        controller: nameController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),


                  // building
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '- اسم المبنى :',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                      switchedTextFormField(
                        context: context,
                        cubit: cubit,
                        controller: buildingController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),


                  // room
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '- رقم الغرفة :',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                      switchedTextFormField(
                        context: context,
                        cubit: cubit,
                        controller: roomController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),


                  // details
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '- التفاصيل :',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: detailsController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            hintStyle: Theme.of(context).textTheme.bodyText1,
                          ),
                          readOnly: true,
                          enableInteractiveSelection:false,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                          onTap: (){
                            if(item.exitAndEnters.length == 0){
                              showToast(message: 'لا يوجد تفاصيل حاليا', state: ToastStates.WARNING);
                            }else{
                              navigateTo(context, SecurityDetailsScreen(item: item,));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),


                ],
              ),
            ),
          )
      ],
    ),
  );
}


