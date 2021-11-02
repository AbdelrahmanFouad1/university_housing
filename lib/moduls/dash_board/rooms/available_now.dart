import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/buidings_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class AvailableNow extends StatelessWidget {
  final List<AlertDialogModel> _levelList = [
    AlertDialogModel(
      text: "مميز",
      index: 0,
    ),
    AlertDialogModel(
      text: "عادي",
      index: 1,
    ),
  ];

  final List<AlertDialogModel> _stateList = [
    AlertDialogModel(
      text: "متاح للسكن",
      index: 0,
    ),
    AlertDialogModel(
      text: "معطل",
      index: 1,
    ),
  ];

  final List<BuildingsModel> item = [
    BuildingsModel(
      code: 'Rm520',
      name: 'أسكان مميز (أ)',
      address: 'مجاوره 28 امام مسجد علي ابن ابي طالب',
      studentNum: '20',
      employeeNum: '10',
      managerName: 'أحمد معتز سعيد',
      managerPhone: '01119108602',
      level: true,
      statues: true,
    ),
    BuildingsModel(
      code: 'ER020',
      name: 'أسكان 36',
      address: 'مجاوره 33',
      studentNum: '26',
      employeeNum: '15',
      managerName: 'سعاد هاني',
      managerPhone: '01539108603',
      level: false,
      statues: false,
    ),
    BuildingsModel(
      code: 'Rm520',
      name: 'أسكان مميز (أ)',
      address: 'مجاوره 28 امام مسجد علي ابن ابي طالب',
      studentNum: '20',
      employeeNum: '10',
      managerName: 'أحمد معتز سعيد',
      managerPhone: '01119108602',
      level: true,
      statues: true,
    ),
    BuildingsModel(
      code: 'Rm520',
      name: 'أسكان مميز (أ)',
      address: 'مجاوره 28 امام مسجد علي ابن ابي طالب',
      studentNum: '20',
      employeeNum: '10',
      managerName: 'أحمد معتز سعيد',
      managerPhone: '01119108602',
      level: true,
      statues: true,
    ),
    BuildingsModel(
      code: 'Rm520',
      name: 'أسكان مميز (أ)',
      address: 'مجاوره 28 امام مسجد علي ابن ابي طالب',
      studentNum: '20',
      employeeNum: '10',
      managerName: 'أحمد معتز سعيد',
      managerPhone: '01119108602',
      level: true,
      statues: true,
    ),
    BuildingsModel(
      code: 'Rm520',
      name: 'أسكان مميز (أ)',
      address: 'مجاوره 28 امام مسجد علي ابن ابي طالب',
      studentNum: '20',
      employeeNum: '10',
      managerName: 'أحمد معتز سعيد',
      managerPhone: '01119108602',
      level: true,
      statues: true,
    ),
    BuildingsModel(
      code: 'Rm520',
      name: 'أسكان مميز (أ)',
      address: 'مجاوره 28 امام مسجد علي ابن ابي طالب',
      studentNum: '20',
      employeeNum: '10',
      managerName: 'أحمد معتز سعيد',
      managerPhone: '01119108602',
      level: true,
      statues: true,
    ),
    BuildingsModel(
      code: 'Rm520',
      name: 'أسكان مميز (أ)',
      address: 'مجاوره 28 امام مسجد علي ابن ابي طالب',
      studentNum: '20',
      employeeNum: '10',
      managerName: 'أحمد معتز سعيد',
      managerPhone: '01119108602',
      level: true,
      statues: true,
    ),
    BuildingsModel(
      code: 'Rm520',
      name: 'أسكان مميز (أ)',
      address: 'مجاوره 28 امام مسجد علي ابن ابي طالب',
      studentNum: '20',
      employeeNum: '10',
      managerName: 'أحمد معتز سعيد',
      managerPhone: '01119108602',
      level: true,
      statues: true,
    ),

  ];

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
              title: 'إدارة الغرف',
              context: context,
              action: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                width: 30.0,
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: ThemeCubit.get(context).darkTheme
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
                        img: 'assets/images/verification.png',
                        title: 'الموجود حاليا'),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: separator,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => buildingItem(
                          item: item[index],
                          cubit: cubit,
                          context: context,
                          index: index,
                          stateList: _stateList,
                          levelList: _levelList,
                          allList: item),
                      separatorBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        width: double.infinity,
                        height: 1.0,
                        color: separator,
                      ),
                      itemCount: item.length,
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

Widget buildingItem({
  required BuildContext context,
  required DashBoardCubit cubit,
  required BuildingsModel item,
  required int index,
  required List<AlertDialogModel> stateList,
  required List<AlertDialogModel> levelList,
  required List<BuildingsModel> allList,
}) {
  var codeController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var studentNumController = TextEditingController();
  var employeeNumController = TextEditingController();
  var levelController = TextEditingController();
  var managerNameController = TextEditingController();
  var managerPhoneController = TextEditingController();
  var statueController = TextEditingController();
  codeController.text = item.code!;
  nameController.text = item.name!;
  addressController.text = item.address!;
  studentNumController.text = item.studentNum!;
  employeeNumController.text = item.employeeNum!;
  levelController.text = item.level! == true ? 'مميز' : 'عادي';
  managerNameController.text = item.managerName!;
  managerPhoneController.text = item.managerPhone!;
  statueController.text = item.statues! == true ? 'متاح للسكن' : 'معطل';
  return Builder(builder: (context) {
    if (cubit.showDetails == true) {
      return Card(
        color: ThemeCubit.get(context).darkTheme ? backGroundDark : backGround,
        elevation: 0.0,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.name!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                if (cubit.showDetails == false || cubit.currentIndex != index)
                  Container(
                    width: 30.0,
                    height: 30.0,
                    child: IconButton(
                      onPressed: () {
                        cubit.currentIndex = index;
                        cubit.showBuildingDetails(!cubit.showDetails, index);
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: ThemeCubit.get(context).darkTheme
                            ? mainTextColor
                            : mainColors,
                      ),
                    ),
                  ),
                if (cubit.showDetails == true && cubit.currentIndex == index)
                  Container(
                    width: 30.0,
                    height: 30.0,
                    child: IconButton(
                      onPressed: () {
                        cubit.showBuildingDetails(!cubit.showDetails, index);
                      },
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.keyboard_arrow_up,
                        color: ThemeCubit.get(context).darkTheme
                            ? mainTextColor
                            : mainColors,
                      ),
                    ),
                  ),
                if (cubit.showDetails == true && cubit.currentIndex == index)
                  Container(
                    width: 50.0,
                    height: 30.0,
                    child: IconButton(
                      onPressed: () {
                        if (cubit.showEdit == true) {
                          if (managerPhoneController.text.length == 11) {
                            item.code = codeController.text;
                            item.name = nameController.text;
                            item.managerPhone = managerPhoneController.text;
                            item.managerName = managerNameController.text;
                            item.employeeNum = employeeNumController.text;
                            item.studentNum = studentNumController.text;
                            item.address = addressController.text;
                            item.statues =
                                statueController.text == 'معطل' ? false : true;
                            // item.level = statueController.text == 'مميز' ? true :false;
                          } else {
                            showToast(
                                message: 'رقم الموبيل غير صحيح',
                                state: ToastStates.ERROR);
                            cubit.changeBuildingEditIcon(!cubit.showEdit);
                          }
                        }
                        cubit.changeBuildingEditIcon(!cubit.showEdit);
                      },
                      icon: Icon(
                        cubit.showEdit == false ? Icons.edit : Icons.done,
                        size: 20.0,
                        color: ThemeCubit.get(context).darkTheme
                            ? mainTextColor
                            : mainColors,
                      ),
                      alignment: AlignmentDirectional.center,
                    ),
                  ),
              ],
            ),
            if (cubit.showDetails == true && cubit.currentIndex == index)
              SizedBox(
                height: 10.0,
              ),
            if (cubit.showDetails == true && cubit.currentIndex == index)
              AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                height: cubit.animatedHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: cubit.showEdit == true
                      ? ThemeCubit.get(context).darkTheme
                          ? mainColors
                          : Colors.white
                      : ThemeCubit.get(context).darkTheme
                          ? backGroundDark
                          : backGround,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  child: Column(
                    children: [
                      //code
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- الكوود :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          switchedTextFormField(
                            context: context,
                            cubit: cubit,
                            controller: codeController,
                          ),
                        ],
                      ),

                      //BuildingName
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- اسم المبنى :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          switchedTextFormField(
                            context: context,
                            cubit: cubit,
                            controller: nameController,
                          ),
                        ],
                      ),

                      //address
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- العنوان :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          switchedTextFormField(
                            context: context,
                            cubit: cubit,
                            controller: addressController,
                          ),
                        ],
                      ),

                      //studentNum
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- عدد غرف الطلبة :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          switchedTextFormField(
                            context: context,
                            cubit: cubit,
                            controller: studentNumController,
                          ),
                        ],
                      ),

                      //employeeNum
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- عدد غرف العاملين :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          switchedTextFormField(
                            context: context,
                            cubit: cubit,
                            controller: employeeNumController,
                          ),
                        ],
                      ),

                      //level
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- المستوى :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: levelController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                hintStyle:
                                    Theme.of(context).textTheme.bodyText1,
                              ),
                              readOnly: true,
                              enableInteractiveSelection:
                                  cubit.showEdit == true ? true : false,
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                              onTap: () {
                                if (cubit.showEdit == true) {
                                  showDialog<void>(
                                    context: context,
                                    builder: (context) => buildDialog(
                                        context: context,
                                        title: 'اختر المستوى',
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: levelList
                                              .map((e) => RadioListTile(
                                                    activeColor:
                                                        ThemeCubit.get(context)
                                                                .darkTheme
                                                            ? mainTextColor
                                                            : backGroundDark,
                                                    tileColor: backGroundDark,
                                                    title: Text(
                                                      e.text,
                                                    ),
                                                    groupValue:
                                                        cubit.currentLevelVal,
                                                    value: e.index,
                                                    onChanged: (int? val) {
                                                      cubit.selectBuildingLevel(
                                                          val ?? e.index);
                                                      levelController.text =
                                                          cubit
                                                              .currentLevelText;
                                                      if (val == 0) {
                                                        item.level = true;
                                                      } else {
                                                        item.level = false;
                                                      }
                                                      Navigator.pop(context);
                                                    },
                                                  ))
                                              .toList(),
                                        )),
                                  );
                                }
                              },
                            ),
                          )
                        ],
                      ),

                      //managerName
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- اسم المشرف :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          switchedTextFormField(
                            context: context,
                            cubit: cubit,
                            controller: managerNameController,
                          ),
                        ],
                      ),

                      // managerPhone
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- رقم المشرف :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          switchedTextFormField(
                            context: context,
                            cubit: cubit,
                            controller: managerPhoneController,
                          ),
                        ],
                      ),

                      // statue
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- الحالة :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: statueController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                hintStyle:
                                    Theme.of(context).textTheme.bodyText1,
                              ),
                              readOnly: true,
                              enableInteractiveSelection:
                                  cubit.showEdit == true ? true : false,
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                              onTap: () {
                                if (cubit.showEdit == true) {
                                  showDialog<void>(
                                    context: context,
                                    builder: (context) => buildDialog(
                                        context: context,
                                        title: 'اختر الحالة',
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: stateList
                                              .map((e) => RadioListTile(
                                                    activeColor:
                                                        ThemeCubit.get(context)
                                                                .darkTheme
                                                            ? mainTextColor
                                                            : backGroundDark,
                                                    tileColor: backGroundDark,
                                                    title: Text(
                                                      e.text,
                                                    ),
                                                    groupValue:
                                                        cubit.currentStateVal,
                                                    value: e.index,
                                                    onChanged: (int? val) {
                                                      cubit.selectBuildingState(
                                                          val ?? e.index);
                                                      statueController.text =
                                                          cubit
                                                              .currentStateText;
                                                      if (val == 0) {
                                                        item.statues = true;
                                                      } else {
                                                        item.statues = false;
                                                      }
                                                      Navigator.pop(context);
                                                    },
                                                  ))
                                              .toList(),
                                        )),
                                  );
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      );
    } else {
      return Dismissible(
        direction: DismissDirection.startToEnd,
        resizeDuration: Duration(milliseconds: 200),
        onDismissed: (direction) {
          cubit.deleteBuilding(allList, index);
        },
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadiusDirectional.circular(8.0),
          ),
          padding: EdgeInsets.all(5.0),
          alignment: AlignmentDirectional.centerStart,
          child: Icon(
            Icons.delete_forever,
            color: Colors.white,
          ),
        ),
        key: ObjectKey(item),
        child: Card(
          color:
              ThemeCubit.get(context).darkTheme ? backGroundDark : backGround,
          elevation: 0.0,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.name!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  if (cubit.showDetails == false || cubit.currentIndex != index)
                    Container(
                      width: 30.0,
                      height: 30.0,
                      child: IconButton(
                        onPressed: () {
                          cubit.currentIndex = index;
                          cubit.showBuildingDetails(!cubit.showDetails, index);
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: ThemeCubit.get(context).darkTheme
                              ? mainTextColor
                              : mainColors,
                        ),
                      ),
                    ),
                  if (cubit.showDetails == true && cubit.currentIndex == index)
                    Container(
                      width: 30.0,
                      height: 30.0,
                      child: IconButton(
                        onPressed: () {
                          cubit.showBuildingDetails(!cubit.showDetails, index);
                        },
                        alignment: Alignment.center,
                        icon: Icon(
                          Icons.keyboard_arrow_up,
                          color: ThemeCubit.get(context).darkTheme
                              ? mainTextColor
                              : mainColors,
                        ),
                      ),
                    ),
                  if (cubit.showDetails == true && cubit.currentIndex == index)
                    Container(
                      width: 50.0,
                      height: 30.0,
                      child: IconButton(
                        onPressed: () {
                          if (cubit.showEdit == true) {
                            if (managerPhoneController.text.length == 11) {
                              item.code = codeController.text;
                              item.name = nameController.text;
                              item.managerPhone = managerPhoneController.text;
                              item.managerName = managerNameController.text;
                              item.employeeNum = employeeNumController.text;
                              item.studentNum = studentNumController.text;
                              item.address = addressController.text;
                              item.statues = statueController.text == 'معطل'
                                  ? false
                                  : true;
                              // item.level = statueController.text == 'مميز' ? true :false;
                            } else {
                              showToast(
                                  message: 'رقم الموبيل غير صحيح',
                                  state: ToastStates.ERROR);
                              cubit.changeBuildingEditIcon(!cubit.showEdit);
                            }
                          }
                          cubit.changeBuildingEditIcon(!cubit.showEdit);
                        },
                        icon: Icon(
                          cubit.showEdit == false ? Icons.edit : Icons.done,
                          size: 20.0,
                          color: ThemeCubit.get(context).darkTheme
                              ? mainTextColor
                              : mainColors,
                        ),
                        alignment: AlignmentDirectional.center,
                      ),
                    ),
                ],
              ),
              if (cubit.showDetails == true && cubit.currentIndex == index)
                SizedBox(
                  height: 10.0,
                ),
              if (cubit.showDetails == true && cubit.currentIndex == index)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  height: cubit.animatedHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: cubit.showEdit == true
                        ? ThemeCubit.get(context).darkTheme
                            ? mainColors
                            : Colors.white
                        : ThemeCubit.get(context).darkTheme
                            ? backGroundDark
                            : backGround,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    child: Column(
                      children: [
                        //code
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '- الكوود :',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            switchedTextFormField(
                              context: context,
                              cubit: cubit,
                              controller: codeController,
                            ),
                          ],
                        ),

                        //BuildingName
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '- اسم المبنى :',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            switchedTextFormField(
                              context: context,
                              cubit: cubit,
                              controller: nameController,
                            ),
                          ],
                        ),

                        //address
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '- العنوان :',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            switchedTextFormField(
                              context: context,
                              cubit: cubit,
                              controller: addressController,
                            ),
                          ],
                        ),

                        //studentNum
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '- عدد غرف الطلبة :',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            switchedTextFormField(
                              context: context,
                              cubit: cubit,
                              controller: studentNumController,
                            ),
                          ],
                        ),

                        //employeeNum
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '- عدد غرف العاملين :',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            switchedTextFormField(
                              context: context,
                              cubit: cubit,
                              controller: employeeNumController,
                            ),
                          ],
                        ),

                        //level
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '- المستوى :',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: levelController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                ),
                                readOnly: true,
                                enableInteractiveSelection:
                                    cubit.showEdit == true ? true : false,
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.center,
                                onTap: () {
                                  if (cubit.showEdit == true) {
                                    showDialog<void>(
                                      context: context,
                                      builder: (context) => buildDialog(
                                          context: context,
                                          title: 'اختر المستوى',
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: levelList
                                                .map((e) => RadioListTile(
                                                      activeColor:
                                                          ThemeCubit.get(
                                                                      context)
                                                                  .darkTheme
                                                              ? mainTextColor
                                                              : backGroundDark,
                                                      tileColor: backGroundDark,
                                                      title: Text(
                                                        e.text,
                                                      ),
                                                      groupValue:
                                                          cubit.currentLevelVal,
                                                      value: e.index,
                                                      onChanged: (int? val) {
                                                        cubit
                                                            .selectBuildingLevel(
                                                                val ?? e.index);
                                                        levelController.text =
                                                            cubit
                                                                .currentLevelText;
                                                        if (val == 0) {
                                                          item.level = true;
                                                        } else {
                                                          item.level = false;
                                                        }
                                                        Navigator.pop(context);
                                                      },
                                                    ))
                                                .toList(),
                                          )),
                                    );
                                  }
                                },
                              ),
                            )
                          ],
                        ),

                        //managerName
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '- اسم المشرف :',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            switchedTextFormField(
                              context: context,
                              cubit: cubit,
                              controller: managerNameController,
                            ),
                          ],
                        ),

                        // managerPhone
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '- رقم المشرف :',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            switchedTextFormField(
                              context: context,
                              cubit: cubit,
                              controller: managerPhoneController,
                            ),
                          ],
                        ),

                        // statue
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '- الحالة :',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: statueController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                ),
                                readOnly: true,
                                enableInteractiveSelection:
                                    cubit.showEdit == true ? true : false,
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.center,
                                onTap: () {
                                  if (cubit.showEdit == true) {
                                    showDialog<void>(
                                      context: context,
                                      builder: (context) => buildDialog(
                                          context: context,
                                          title: 'اختر الحالة',
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: stateList
                                                .map((e) => RadioListTile(
                                                      activeColor:
                                                          ThemeCubit.get(
                                                                      context)
                                                                  .darkTheme
                                                              ? mainTextColor
                                                              : backGroundDark,
                                                      tileColor: backGroundDark,
                                                      title: Text(
                                                        e.text,
                                                      ),
                                                      groupValue:
                                                          cubit.currentStateVal,
                                                      value: e.index,
                                                      onChanged: (int? val) {
                                                        cubit
                                                            .selectBuildingState(
                                                                val ?? e.index);
                                                        statueController.text =
                                                            cubit
                                                                .currentStateText;
                                                        if (val == 0) {
                                                          item.statues = true;
                                                        } else {
                                                          item.statues = false;
                                                        }
                                                        Navigator.pop(context);
                                                      },
                                                    ))
                                                .toList(),
                                          )),
                                    );
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      );
    }
  });
}

class AlertDialogModel {
  late String text;
  late int index;

  AlertDialogModel({
    required this.text,
    required this.index,
  });
}
