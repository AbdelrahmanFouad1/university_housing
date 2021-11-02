import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/model/security_model.dart';
import 'package:university_housing/model/students_model.dart';
import 'package:university_housing/moduls/dash_board/rooms/available_now.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen({Key? key}) : super(key: key);

  var dateController = TextEditingController();
  var buildingController = TextEditingController();

  final List<AlertDialogModel> _buildingList = [
    AlertDialogModel(
      text: "عماره الزهراء",
      index: 0,
    ),
    AlertDialogModel(
      text: "سكن ال 36",
      index: 1,
    ),
    AlertDialogModel(
      text: "اسكان مميز(أ)",
      index: 2,
    ),
  ];


  final List<SecurityModel> list = [
    SecurityModel(
      id: '42018122',
      name: 'عبدالرحمن محمد فؤاد',
      enterDate: 'nov 6,2021',
      enterTime: '9:00 AM',
      exitDate: 'nov 6,2021',
      exitTime: '3:00 PM',
      notes: 'لا يوجد',
    ),
    SecurityModel(
      id: '42020102',
      name: 'عمرو سعيد حسن',
      enterDate: 'nov 6,2021',
      enterTime: '9:00 AM',
      exitDate: 'nov 6,2021',
      exitTime: '10:00 PM',
      notes: 'متأخر جدا',
    ),
    SecurityModel(
      id: '42020102',
      name: 'عمرو سعيد حسن',
      enterDate: 'nov 6,2021',
      enterTime: '9:00 AM',
      exitDate: 'nov 6,2021',
      exitTime: '10:00 PM',
      notes: 'متأخر جدا',
    ),
    SecurityModel(
      id: '42020102',
      name: 'عمرو سعيد حسن',
      enterDate: 'nov 6,2021',
      enterTime: '9:00 AM',
      exitDate: 'nov 6,2021',
      exitTime: '10:00 PM',
      notes: 'متأخر جدا',
    ),
    SecurityModel(
      id: '42020102',
      name: 'عمرو سعيد حسن',
      enterDate: 'nov 6,2021',
      enterTime: '9:00 AM',
      exitDate: 'nov 6,2021',
      exitTime: '10:00 PM',
      notes: 'متأخر جدا',
    ),
    SecurityModel(
      id: '42020102',
      name: 'عمرو سعيد حسن',
      enterDate: 'nov 6,2021',
      enterTime: '9:00 AM',
      exitDate: 'nov 6,2021',
      exitTime: '10:00 PM',
      notes: 'متأخر جدا',
    ),
    SecurityModel(
      id: '42020102',
      name: 'عمرو سعيد حسن',
      enterDate: 'nov 6,2021',
      enterTime: '9:00 AM',
      exitDate: 'nov 6,2021',
      exitTime: '10:00 PM',
      notes: 'متأخر جدا',
    ),
  ];

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
                child: Container(
                  height: 600.0,
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
                            'تاريخ التقرير :',
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
                                keyboardType: TextInputType.datetime,
                                controller: dateController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText1,
                                textAlign: TextAlign.center,
                                onTap: () {
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2030-12-12')
                                  ).then((value) {
                                    if (value == null) {
                                      showToast(message: 'برجاء تحديد التاريخ',
                                          state: ToastStates.WARNING);
                                    } else {
                                      dateController.text =
                                          DateFormat.yMMMd().format(value);
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
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
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: _buildingList.map((e) =>
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
                                                      cubit.selectSecurityBuilding(
                                                          val ?? e.index);
                                                      buildingController.text =
                                                          e.text;
                                                      Navigator.pop(context);
                                                    },
                                                  )).toList(),
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
                      if(dateController.text != '' && buildingController.text != '')
                      Expanded(
                        // flex: 1,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) =>
                              securityItem(
                                item: list[index],
                                allList: list,
                                cubit: cubit,
                                context: context,
                                index: index,
                              ),
                          separatorBuilder: (context, index) =>
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                width: double.infinity,
                                height: 1.0,
                                color: separator,
                              ),
                          itemCount: list.length,
                        ),
                      ),
                    ],
                  ),
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
  required SecurityModel item,
  required int index,
  required List<SecurityModel> allList,
}) {
  var idController = TextEditingController();
  var nameController = TextEditingController();
  var exitDateController = TextEditingController();
  var exitTimeController = TextEditingController();
  var enterDateController = TextEditingController();
  var enterTimeController = TextEditingController();
  var notesController = TextEditingController();
  idController.text = item.id!;
  nameController.text = item.name!;
  exitDateController.text = item.exitDate!;
  exitTimeController.text = item.exitTime!;
  enterDateController.text = item.enterDate!;
  enterTimeController.text = item.enterTime!;
  notesController.text = item.notes!;
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
                item.name!,
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
                item.id!,
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
            if (cubit.showSecurity_details == true &&
                cubit.currentSecurityIndex == index)
              Container(
                width: 50.0,
                height: 30.0,
                child: IconButton(
                  onPressed: () {
                    if (cubit.showSecurityEdit == true) {
                        item.id = idController.text;
                        item.name = nameController.text;
                        item.exitDate = exitDateController.text;
                        item.exitTime = exitTimeController.text;
                        item.enterDate = enterDateController.text;
                        item.enterTime = enterTimeController.text;
                        item.notes = notesController.text;
                    }
                    cubit.changeSecurityEditIcon(!cubit.showSecurityEdit);
                  },
                  icon: Icon(
                    cubit.showSecurityEdit == false ? Icons.edit : Icons.done,
                    size: 20.0,
                    color: ThemeCubit
                        .get(context)
                        .darkTheme
                        ? mainTextColor
                        : mainColors,
                  ),
                  alignment: AlignmentDirectional.center,
                ),
              ),
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


                  // exitDate
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '- تاريخ الخروج :',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                      switchedTextFormField(
                        context: context,
                        cubit: cubit,
                        controller: exitDateController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),


                  // exitTime
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '- وقت الخروج :',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                      switchedTextFormField(
                        context: context,
                        cubit: cubit,
                        controller: exitTimeController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),


                  // enterDate
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '- تاريخ الدخول :',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                      switchedTextFormField(
                        context: context,
                        cubit: cubit,
                        controller: enterDateController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),


                  // enterTime
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '- وقت الدخول :',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                      switchedTextFormField(
                        context: context,
                        cubit: cubit,
                        controller: enterTimeController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),


                  // notes
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '- ملاحظات :',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                      switchedTextFormField(
                        context: context,
                        cubit: cubit,
                        controller: notesController,
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


