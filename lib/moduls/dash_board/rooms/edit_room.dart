import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/get_buildings_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class EditRooms extends StatelessWidget {

  EditRooms({
    Key? key,
    required this.selectedBuilding,
  }): super(key: key);

  BuildingModel selectedBuilding;

  final List<AlertDialogModel> _typeList = [
    AlertDialogModel(
      text: "فردي",
      index: 0,
    ),
    AlertDialogModel(
      text: "زوجي",
      index: 1,
    ),
  ];

  final List<AlertDialogModel> _jobList = [
    AlertDialogModel(
      text: "طلاب",
      index: 0,
    ),
    AlertDialogModel(
      text: "عاملين",
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
        if(state is PutRoomLoadingStates || state is DeleteRoomLoadingStates){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }else if(state is PutRoomSuccessStates || state is DeleteRoomSuccess){
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
                        img: 'assets/images/room.png', title: 'تعديل الغرف'),
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
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => roomItem(
                          item: selectedBuilding.rooms[index],
                          cubit: cubit,
                          context: context,
                          index: index,
                          buildingItem: selectedBuilding,
                          stateList: _stateList,
                          levelList: _typeList,
                          genderList: _jobList),
                      separatorBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        width: double.infinity,
                        height: 1.0,
                        color: separator,
                      ),
                      itemCount: selectedBuilding.rooms.length,
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

Widget roomItem({
  required BuildContext context,
  required DashBoardCubit cubit,
  required Rooms item,
  required BuildingModel buildingItem,
  required int index,
  required List<AlertDialogModel> stateList,
  required List<AlertDialogModel> levelList,
  required List<AlertDialogModel> genderList,
}) {
  var roomForController = TextEditingController();
  var typeController = TextEditingController();
  var statueController = TextEditingController();
  roomForController.text = item.roomfor == true ? 'طلاب' : 'عاملين';
  typeController.text = item.type == true ? 'فردي' : 'زوجي';
  statueController.text = item.availability == true ? 'متاح للسكن' : 'معطل';
  return Builder(builder: (context) {
    if (cubit.showRoom == true) {
      return Card(
        color: ThemeCubit.get(context).darkTheme ? backGroundDark : backGround,
        elevation: 0.0,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.roomnumber.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                if (cubit.showRoom == false || cubit.currentRoomIndex != index)
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: IconButton(
                      onPressed: () {
                        cubit.currentRoomIndex = index;
                        cubit.showRoomDetails(!cubit.showRoom, index);
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: ThemeCubit.get(context).darkTheme
                            ? mainTextColor
                            : mainColors,
                      ),
                    ),
                  ),
                if (cubit.showRoom == true && cubit.currentRoomIndex == index)
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: IconButton(
                      onPressed: () {
                        cubit.showRoomDetails(!cubit.showRoom, index);
                        cubit.showRoomEdit = false;
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
                if (cubit.showRoom == true && cubit.currentRoomIndex == index)
                  SizedBox(
                    width: 50.0,
                    height: 30.0,
                    child: IconButton(
                      onPressed: () {
                        if (cubit.showRoomEdit == true) {
                          item.roomcode = cubit.roomCodeController.text;
                          item.roomnumber = int.parse(cubit.roomRoomNumController.text);
                          item.floor = int.parse(cubit.roomFloorNumController.text);
                          item.userresidentName = cubit.roomUserName.text;
                          item.userresidentId = cubit.roomUserId.text;
                          item.availability = statueController.text == 'معطل' ? false : true;
                          item.type = typeController.text == 'مميز' ? true : false;
                          item.roomfor= roomForController.text == 'طلاب' ? true : false;
                          cubit.putRoom(
                              slug: item.slug,
                              idDB: item.idDB,
                              availability: item.availability,
                              type: item.type,
                              roomfor: item.roomfor,
                              floor: item.floor,
                              roomnumber: item.roomnumber,
                              roomcode: item.roomcode,
                              userresidentId: item.userresidentId,
                              userresidentName: item.userresidentName
                          );
                        }
                        cubit.changeRoomEditIcon(!cubit.showRoomEdit);
                      },
                      icon: Icon(
                        cubit.showRoomEdit == false ? Icons.edit : Icons.done,
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
            if (cubit.showRoom == true && cubit.currentRoomIndex == index)
              const SizedBox(
                height: 10.0,
              ),
            if (cubit.showRoom == true && cubit.currentRoomIndex == index)
              AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                height: cubit.animatedRoomHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: cubit.showRoomEdit == true
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
                            controller: cubit.roomCodeController,
                          ),
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
                              '- رقم الغرفة :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          switchedTextFormField(
                            context: context,
                            cubit: cubit,
                            controller: cubit.roomRoomNumController,
                          ),
                        ],
                      ),

                      //floor num
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- رقم الدور :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          switchedTextFormField(
                            context: context,
                            cubit: cubit,
                            controller: cubit.roomFloorNumController,
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
                              cubit.showRoomEdit == true ? true : false,
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                              onTap: () {
                                if (cubit.showRoomEdit == true) {
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
                                            cubit.currentRoomStateVal,
                                            value: e.index,
                                            onChanged: (int? val) {
                                              cubit.selectRoomState(
                                                  val ?? e.index);
                                              statueController.text =
                                                  cubit
                                                      .currentRoomStateText;
                                              if (val == 0) {
                                                item.availability =
                                                true;
                                              } else {
                                                item.availability =
                                                false;
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

                      //level
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
                              controller: typeController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                hintStyle:
                                Theme.of(context).textTheme.bodyText1,
                              ),
                              readOnly: true,
                              enableInteractiveSelection:
                              cubit.showRoomEdit == true ? true : false,
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                              onTap: () {
                                if (cubit.showRoomEdit == true) {
                                  showDialog<void>(
                                    context: context,
                                    builder: (context) => buildDialog(
                                        context: context,
                                        title: 'اختر النوع',
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
                                            cubit.currentRoomLevelVal,
                                            value: e.index,
                                            onChanged: (int? val) {
                                              cubit.selectRoomLevel(
                                                  val ?? e.index);
                                              typeController.text =
                                                  cubit
                                                      .currentRoomLevelText;
                                              if (val == 0) {
                                                item.type =
                                                true;
                                              } else {
                                                item.type =
                                                false;
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


                      // gender
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- الوظيفه :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: roomForController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                hintStyle:
                                Theme.of(context).textTheme.bodyText1,
                              ),
                              readOnly: true,
                              enableInteractiveSelection:
                              cubit.showRoomEdit == true ? true : false,
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                              onTap: () {
                                if (cubit.showRoomEdit == true) {
                                  showDialog<void>(
                                    context: context,
                                    builder: (context) => buildDialog(
                                        context: context,
                                        title: 'اختر الوظيفة',
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
                                            cubit.currentRoomGenderVal,
                                            value: e.index,
                                            onChanged: (int? val) {
                                              cubit
                                                  .selectRoomGender(
                                                  val ?? e.index);
                                              typeController.text =
                                                  cubit
                                                      .currentRoomGenderText;
                                              if (val == 0) {
                                                item.roomfor = true;
                                              } else {
                                                item.roomfor = false;
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


                      //userName
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- اسم الساكن :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          switchedTextFormField(
                            context: context,
                            cubit: cubit,
                            controller: cubit.roomUserName,
                          ),
                        ],
                      ),

                      //user id
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '- رقم الساكن :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          switchedTextFormField(
                            context: context,
                            cubit: cubit,
                            controller: cubit.roomUserId,
                          ),
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
      return InkWell(
        onTap: (){
          cubit.currentRoomIndex = index;
          cubit.showRoomDetails(!cubit.showRoom, index);
          cubit.inputRoomsData(item);
        },
        child: Dismissible(
          direction: DismissDirection.startToEnd,
          resizeDuration: const Duration(milliseconds: 200),
          onDismissed: (direction) {
            cubit.deleteRoom(
              buildingSlug: buildingItem.slug,
              roomId: item.idDB,
            );
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
                  item.roomnumber.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: IconButton(
                    onPressed: () {
                      cubit.currentRoomIndex = index;
                      cubit.showRoomDetails(!cubit.showRoom, index);
                      cubit.inputRoomsData(item);
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
