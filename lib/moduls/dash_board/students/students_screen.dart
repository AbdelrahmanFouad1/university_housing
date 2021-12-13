import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/model/get_all_users_model.dart';
import 'package:university_housing/moduls/dash_board/rooms/available_now.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

import 'fiens_details_screen.dart';

class StudentsScreen extends StatelessWidget {
  StudentsScreen({Key? key}) : super(key: key);

  final List<AlertDialogModel> _termList = [
    AlertDialogModel(
      text: "الأول",
      index: 0,
    ),
    AlertDialogModel(
      text: "الثاني",
      index: 1,
    ),
    AlertDialogModel(
      text: "الثالث",
      index: 2,
    ),
  ];

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


  final List<AlertDialogModel> _creditList = [
    AlertDialogModel(
      text: "تم الدفع",
      index: 0,
    ),
    AlertDialogModel(
      text: "لم يتم الدفع",
      index: 1,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {
        if(state is PutStudentLoadingStates || state is DeleteStudentLoadingStates){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }else if(state is PutStudentSuccessStates ){
          Navigator.pop(context);
          showToast(message: 'تم التعديل بنجاح', state: ToastStates.SUCCESS);
        }else if(state is DeleteStudentSuccess){
          Navigator.pop(context);
          showToast(message: 'تم الحذف بنجاح', state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'الساكنين',
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
                        svgImage: 'assets/images/check.svg',
                        svg: true,
                        title: 'مقيدين بالسكن'),
                    SizedBox(
                      height: 12.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'الترم :',
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
                                    value: 1,
                                    groupValue: cubit.termNum,
                                    activeColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    focusColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    onChanged: (value) {
                                      cubit.changeTerm(1);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'الأول',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Radio(
                                    value: 2,
                                    groupValue: cubit.termNum,
                                    activeColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    focusColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    hoverColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    onChanged: (value) {
                                      cubit.changeTerm(2);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'الثاني',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Radio(
                                    value: 3,
                                    groupValue: cubit.termNum,
                                    activeColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    focusColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    hoverColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    onChanged: (value) {
                                      cubit.changeTerm(3);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'الثالث',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
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
                                    groupValue: cubit.isStudentKind,
                                    activeColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    focusColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    onChanged: (value) {
                                      cubit.changePeopleType(true);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'طلاب',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Radio(
                                    value: false,
                                    groupValue: cubit.isStudentKind,
                                    activeColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    focusColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    hoverColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    onChanged: (value) {
                                      cubit.changePeopleType(false);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'عاملين',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                        builder: (context){
                          if(state is GetAllUsersLoadingStates){
                            return Container(
                                width:double.infinity,
                                height: 300.0,
                                child: Center(child: CircularProgressIndicator()));
                          }else{
                            return ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => studentItem(
                                  item:  cubit.allUsers!.users[index],
                                  cubit: cubit,
                                  context: context,
                                  level: _levelList,
                                  credit: _creditList,
                                  term: _termList,
                                  job: _jobList,
                                  index: index
                              ),
                              separatorBuilder: (context, index) => Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                width: double.infinity,
                                height: 1.0,
                                color: separator,
                              ),
                              itemCount: cubit.allUsers!.users.length,
                            );
                          }
                        }),

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

Widget studentItem({
  required context,
  required DashBoardCubit cubit,
  required Users item,
  required int index,
  required List<AlertDialogModel> term,
  required List<AlertDialogModel> level,
  required List<AlertDialogModel> job,
  required List<AlertDialogModel> credit,
}) {
  var idController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var sectionController = TextEditingController();
  var nationalIDController = TextEditingController();
  var termController = TextEditingController();
  var nationalPhotoController = TextEditingController();
  var phoneController = TextEditingController();
  var levelController = TextEditingController();
  var jobController = TextEditingController();
  var roomController = TextEditingController();
  var creditController = TextEditingController();
  var paymentDateController = TextEditingController();
  var buildingController = TextEditingController();
  var fiensController = TextEditingController();

  DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(item.createdAt);
  String date = tempDate.toString().substring(0, 10);

  idController.text = item.id.toString();
  nameController.text = item.username;
  fiensController.text = item.fines.length.toString();
  addressController.text = item.address;
  sectionController.text = item.section;
  nationalIDController.text = item.NationalID.toString();
  paymentDateController.text = date;
  roomController.text = item.roomnumber.toString();
  buildingController.text = item.buildingName;
  termController.text = item.firstTerm == true ? 'الأول' : item.secondTerm == true ?'الثاني' :'الثالث';
  nationalPhotoController.text = item.cardPhoto;
  phoneController.text = item.phone;
  levelController.text = item.buildingType == true ? 'مميز' : 'عادي';
  jobController.text = item.isStudent == true ? 'طلاب' : 'عاملين';
  creditController.text = item.isPaid == true ? 'تم الدفع' : 'لم يتم الدفع';
  return Builder(
      builder: (context){
        if(cubit.showStudent_details==true){
          return Card(
            color: ThemeCubit.get(context).darkTheme ? backGroundDark : backGround,
            elevation: 0.0,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.username,
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item.id.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (cubit.showStudent_details == false ||
                        cubit.currentStudentIndex != index)
                      Container(
                        width: 30.0,
                        height: 30.0,
                        child: IconButton(
                          onPressed: () {
                            cubit.currentStudentIndex = index;
                            cubit.showStudentDetails(
                                !cubit.showStudent_details, index);
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: ThemeCubit.get(context).darkTheme
                                ? mainTextColor
                                : mainColors,
                          ),
                        ),
                      ),
                    if (cubit.showStudent_details == true &&
                        cubit.currentStudentIndex == index)
                      Container(
                        width: 30.0,
                        height: 30.0,
                        child: IconButton(
                          onPressed: () {
                            cubit.showStudentDetails(
                                !cubit.showStudent_details, index);
                            if(cubit.showStudentEdit)
                            cubit.changeStudentEditIcon(!cubit.showStudentEdit);

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
                    if (cubit.showStudent_details == true &&
                        cubit.currentStudentIndex == index)
                      Container(
                        width: 50.0,
                        height: 30.0,
                        child: IconButton(
                          onPressed: () {
                            if (cubit.showStudentEdit == true) {
                              if (phoneController.text.length == 11 && nationalIDController.text.length==14) {
                                 // todo add phone
                                  // item.phone = phoneController.text;
                                cubit.putStudent(
                                  idDB: item.idDB,
                                  id: int.parse(idController.text),
                                  roomnumber: int.parse(roomController.text),
                                  buildingName: buildingController.text,
                                  address: addressController.text,
                                  username: nameController.text,
                                  Section: sectionController.text,
                                  NationalID: int.parse(nationalIDController.text),
                                  buildingType: levelController.text == 'مميز' ? true :false,
                                  isEmployee: jobController.text == 'طلاب'? false : true,
                                  isStudent: jobController.text == 'طلاب'? true : false,
                                  isPaid: creditController.text == 'تم الدفع' ? true :false,
                                  paidAt: paymentDateController.text,
                                  firstTerm: termController.text == 'الأول'? true : false,
                                  secondTerm: termController.text == 'الثاني'? true : false,
                                  thirdTerm: termController.text == 'الثالث'? true : false,
                                  cardPhoto: item.cardPhoto,
                                );
                              } else {
                                if(phoneController.text.length != 11){
                                  showToast(
                                      message: 'رقم الموبيل غير صحيح',
                                      state: ToastStates.ERROR);
                                  cubit.changeStudentEditIcon(!cubit.showStudentEdit);
                                }else{
                                  showToast(
                                      message: 'الرقم القومي غير صحيح',
                                      state: ToastStates.ERROR);
                                  cubit.changeStudentEditIcon(!cubit.showStudentEdit);
                                }
                              }
                            }
                            cubit.changeStudentEditIcon(!cubit.showStudentEdit);
                          },
                          icon: Icon(
                            cubit.showStudentEdit == false ? Icons.edit : Icons.done,
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
                if (cubit.showStudent_details == true &&
                    cubit.currentStudentIndex == index)
                  SizedBox(
                    height: 10.0,
                  ),
                if (cubit.showStudent_details == true &&
                    cubit.currentStudentIndex == index)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    height: cubit.animatedStudentHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: cubit.showStudentEdit == true
                          ? ThemeCubit.get(context).darkTheme
                          ? mainColors
                          : Colors.white
                          : ThemeCubit.get(context).darkTheme
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
                                  style: Theme.of(context).textTheme.bodyText1,
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
                          SizedBox(
                            height: 5.0,
                          ),

                          //address
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
                          SizedBox(
                            height: 5.0,
                          ),

                          // section
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- القسم :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              switchedTextFormField(
                                context: context,
                                cubit: cubit,
                                controller: sectionController,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          // term
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- الترم :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: termController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    hintStyle: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  readOnly: true,
                                  enableInteractiveSelection: cubit.showStudentEdit == true ? true : false ,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                  onTap: () {
                                    if(cubit.showStudentEdit == true ){
                                      showDialog<void>(
                                        context: context,
                                        builder: (context) => buildDialog(
                                            context: context,
                                            title: 'اختر الترم',
                                            child:Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: term.map((e) => RadioListTile(
                                                activeColor:ThemeCubit.get(context).darkTheme? mainTextColor: backGroundDark,
                                                tileColor: backGroundDark,
                                                title: Text(
                                                  e.text,
                                                ),
                                                groupValue: cubit.currentStudentTermVal,
                                                value: e.index,
                                                onChanged: (int? val) {
                                                  cubit.selectStudentTerm(val ?? e.index);
                                                  termController.text = cubit.currentStudentTermText;
                                                  if(val == 0){
                                                    item.firstTerm = true;
                                                  }else if(val == 1){
                                                    item.firstTerm = false;
                                                    item.secondTerm = true;
                                                  }else{
                                                    item.secondTerm = false;
                                                    item.thirdTerm = true;
                                                  }
                                                  Navigator.pop(context);
                                                },
                                              )).toList(),
                                            )
                                        ),
                                      );
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          // job
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- الوظيفة :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: jobController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    hintStyle: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  readOnly: true,
                                  enableInteractiveSelection: cubit.showStudentEdit == true ? true : false ,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                  onTap: () {
                                    if(cubit.showStudentEdit == true ){
                                      showDialog<void>(
                                        context: context,
                                        builder: (context) => buildDialog(
                                            context: context,
                                            title: 'اختر الوظية',
                                            child:Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: job.map((e) => RadioListTile(
                                                activeColor:ThemeCubit.get(context).darkTheme? mainTextColor: backGroundDark,
                                                tileColor: backGroundDark,
                                                title: Text(
                                                  e.text,
                                                ),
                                                groupValue: cubit.currentStudentJobVal,
                                                value: e.index,
                                                onChanged: (int? val) {
                                                  cubit.selectStudentJob(val ?? e.index);
                                                  jobController.text = cubit.currentStudentJobText;
                                                  if(val == 0){
                                                    item.isStudent = true;
                                                  }else{
                                                    item.isStudent = false;
                                                  }
                                                  Navigator.pop(context);
                                                },
                                              )).toList(),
                                            )
                                        ),
                                      );
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          //phone
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- الموبيل :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              switchedTextFormField(
                                context: context,
                                cubit: cubit,
                                controller: phoneController,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),


                          // buildingName
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- المبنى :',
                                  style: Theme.of(context).textTheme.bodyText1,
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
                                  '- الغرفة :',
                                  style: Theme.of(context).textTheme.bodyText1,
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

                          // level
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- نوع السكن :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: levelController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    hintStyle: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  readOnly: true,
                                  enableInteractiveSelection: cubit.showStudentEdit == true ? true : false ,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                  onTap: () {
                                    if(cubit.showStudentEdit == true ){
                                      showDialog<void>(
                                        context: context,
                                        builder: (context) => buildDialog(
                                            context: context,
                                            title: 'اختر نوع السكن',
                                            child:Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: level.map((e) => RadioListTile(
                                                activeColor:ThemeCubit.get(context).darkTheme? mainTextColor: backGroundDark,
                                                tileColor: backGroundDark,
                                                title: Text(
                                                  e.text,
                                                ),
                                                groupValue: cubit.currentStudentLevelVal,
                                                value: e.index,
                                                onChanged: (int? val) {
                                                  cubit.selectStudentLevel(val ?? e.index);
                                                  levelController.text = cubit.currentStudentLevelText;
                                                  if(val == 0){
                                                    item.buildingType = true;
                                                  }else{
                                                    item.buildingType = false;
                                                  }
                                                  Navigator.pop(context);
                                                },
                                              )).toList(),
                                            )
                                        ),
                                      );
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          // credit
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- نوع الدفع :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: creditController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    hintStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                  ),
                                  readOnly: true,
                                  enableInteractiveSelection:
                                  cubit.showStudentEdit == true ? true : false,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                  onTap: () {
                                    if (cubit.showStudentEdit == true) {
                                      showDialog<void>(
                                        context: context,
                                        builder: (context) => buildDialog(
                                            context: context,
                                            title: 'اختر طريقة الدفع',
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: credit
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
                                                cubit.currentStudentCreditVal,
                                                value: e.index,
                                                onChanged: (int? val) {
                                                  cubit.selectStudentCredit(
                                                      val ?? e.index);
                                                  creditController.text =
                                                      cubit
                                                          .currentStudentCreditText;
                                                  if (val == 0) {
                                                    item.isPaid = true;
                                                  } else {
                                                    item.isPaid = false;
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
                          SizedBox(
                            height: 5.0,
                          ),

                          //payment date
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- تاريخ الدفع :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              switchedTextFormField(
                                context: context,
                                cubit: cubit,
                                controller: paymentDateController,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          //nationalID
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- الرقم القومي :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              switchedTextFormField(
                                context: context,
                                cubit: cubit,
                                controller: nationalIDController,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          //fines
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- الغرامات :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: fiensController,
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
                                    navigateTo(context, FinesDetailsScreen(item:  item,));
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),

                          //nationalPhoto
                          Text(
                            'صورة البطاقه',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0,),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: item.cardPhoto,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>  Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: Icon(Icons.error,
                                      color: ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 188.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: Colors.grey, width: 1),
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
        else{
          return InkWell(
            onTap: (){
              cubit.currentStudentIndex = index;
              cubit.showStudentDetails(
                  !cubit.showStudent_details, index);
            },
            child: Dismissible(
              direction: DismissDirection.startToEnd,
              resizeDuration: Duration(milliseconds: 200),
              onDismissed: (direction) {
                cubit.deleteStudent(item.idDB , false);
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
              key: UniqueKey(),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item.username,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item.id.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      width: 30.0,
                      height: 30.0,
                      child: IconButton(
                        onPressed: () {
                          cubit.currentStudentIndex = index;
                          cubit.showStudentDetails(
                              !cubit.showStudent_details, index);
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
      }
  );
}
