import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/get_buildings_model.dart';
import 'package:university_housing/moduls/dash_board/rooms/edit_room.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class AvailableNow extends StatelessWidget {
  AvailableNow({Key? key}) : super(key: key);

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

  final List<AlertDialogModel> _genderList = [
    AlertDialogModel(
      text: "ذكور",
      index: 0,
    ),
    AlertDialogModel(
      text: "إناث",
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


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {
        if(state is DeleteBuildingLoadingStates || state is PutBuildingLoadingStates){
          showDialog<void>(
            context: context,
            builder: (context)=> waitingDialog(context: context)
          );
        }else if(state is DeleteBuildingSuccess || state is PutBuildingSuccessStates){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'إدارة الغرف',
              context: context,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultDashBoardTitleBox(
                        img: 'assets/images/verification.png',
                        title: 'الموجود حاليا'),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: separator,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Builder(
                      builder: (context){
                        if (cubit.availableNow != null){
                          return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => buildingItem(
                                  item: cubit.availableNow!.Buildings[index],
                                  cubit: cubit,
                                  context: context,
                                  index: index,
                                  stateList: _stateList,
                                  levelList: _levelList,
                                  genderList: _genderList
                              ),
                              separatorBuilder: (context, index) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 10.0),
                                width: double.infinity,
                                height: 1.0,
                                color: separator,
                              ),
                              itemCount: cubit.availableNow!.Buildings.length,
                            );
                      }else{
                          return const SizedBox(
                              width:double.infinity,
                              height: 300.0,
                              child: Center(child: CircularProgressIndicator()));
                        }
                      },
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
  required BuildingModel item,
  required int index,
  required List<AlertDialogModel> stateList,
  required List<AlertDialogModel> levelList,
  required List<AlertDialogModel> genderList,
}) {
  var codeController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var genderController = TextEditingController();
  var roomNumController = TextEditingController();
  var levelController = TextEditingController();
  var managerNameController = TextEditingController();
  var managerPhoneController = TextEditingController();
  var statueController = TextEditingController();
  codeController.text = item.buildingCode;
  nameController.text = item.buildingName;
  addressController.text = item.address;
  genderController.text = item.gender == true ?'ذكور':'إناث';
  roomNumController.text = item.rooms.length.toString();
  levelController.text = item.buildingLevels == true ? 'مميز' : 'عادي';
  managerNameController.text = item.buildingsupervisorName;
  managerPhoneController.text = item.buildingsupervisorPhonenumber;
  statueController.text = item.availability == true ? 'متاح للسكن' : 'معطل';
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
                    item.buildingName,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                if (cubit.showDetails == false || cubit.currentIndex != index)
                  SizedBox(
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
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: IconButton(
                      onPressed: () {
                        cubit.showBuildingDetails(!cubit.showDetails, index);
                        cubit.showEdit = false;
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
                  SizedBox(
                    width: 50.0,
                    height: 30.0,
                    child: IconButton(
                      onPressed: () {
                        if (cubit.showEdit == true) {
                          if (managerPhoneController.text.length == 11) {
                            item.buildingCode = codeController.text;
                            item.buildingName = nameController.text;
                            item.buildingsupervisorPhonenumber = managerPhoneController.text;
                            item.buildingsupervisorName = managerNameController.text;
                            item.address = addressController.text;
                            item.availability = statueController.text == 'معطل' ? false : true;
                            item.buildingLevels = levelController.text == 'مميز' ? true : false;
                            item.gender = genderController.text == 'ذكور' ? true : false;
                            cubit.putBuilding(
                              availability: item.availability,
                              //todo put building image
                              image: item.image,
                              address: item.address,
                              buildingName: item.buildingName,
                              buildingCode: item.buildingCode,
                              buildingLevels: item.buildingLevels,
                              buildingsupervisorName: item.buildingsupervisorName,
                              buildingsupervisorPhonenumber: item.buildingsupervisorPhonenumber,
                              numberofrooms: item.rooms.length,
                              gender: item.gender,
                              slug: item.slug,
                            );
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
              const SizedBox(
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
                      const SizedBox(
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
                      const SizedBox(
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


                      // gender
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- النوع :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: genderController,
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
                                        title: 'اختر النوع',
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: genderList
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
                                            cubit.currentBuildingGenderVal,
                                            value: e.index,
                                            onChanged: (int? val) {
                                              cubit.selectBuildingGender(
                                                  val ?? e.index);
                                              levelController.text =
                                                  cubit.currentBuildingGenderText;
                                              if (val == 0) {
                                                item.gender = true;
                                              } else {
                                                item.gender = false;
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

                      //Room Num
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- عدد الغرف :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: roomNumController,
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
                                if(item.rooms.isEmpty){
                                  showToast(message: 'لا يوجد غرف في هذا المبني حاليا', state: ToastStates.WARNING);
                                }else{
                                  navigateTo(context, EditRooms(selectedBuilding: item,));
                                }
                              },
                            ),
                          ),
                        ],
                      ),



                      //level
                      const SizedBox(
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
                                                        cubit.currentBuildingLevelVal,
                                                    value: e.index,
                                                    onChanged: (int? val) {
                                                      cubit.selectBuildingLevel(
                                                          val ?? e.index);
                                                      levelController.text =
                                                          cubit
                                                              .currentBuildingLevelText;
                                                      if (val == 0) {
                                                        item.buildingLevels = true;
                                                      } else {
                                                        item.buildingLevels = false;
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
                      const SizedBox(
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
                      const SizedBox(
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
                      const SizedBox(
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
                                                        cubit.currentBuildingStateVal,
                                                    value: e.index,
                                                    onChanged: (int? val) {
                                                      cubit.selectBuildingState(
                                                          val ?? e.index);
                                                      statueController.text =
                                                          cubit
                                                              .currentBuildingStateText;
                                                      if (val == 0) {
                                                        item.availability = true;
                                                      } else {
                                                        item.availability = false;
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
        resizeDuration: const Duration(milliseconds: 200),
        onDismissed: (direction) {
          cubit.deleteBuilding(item.idDB);
        },
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadiusDirectional.circular(8.0),
          ),
          padding: const EdgeInsets.all(5.0),
          alignment: AlignmentDirectional.centerStart,
          child: const Icon(
            Icons.delete_forever,
            color: Colors.white,
          ),
        ),
        key: UniqueKey(),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.buildingName,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
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
          ],
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
