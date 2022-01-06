import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/get_all_users_model.dart';
import 'package:university_housing/moduls/dash_board/rooms/available_now.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class WaitingStudentsScreen extends StatelessWidget {
  WaitingStudentsScreen({Key? key}) : super(key: key);

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
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultDashBoardTitleBox(
                        svgImage:  'assets/images/warn.svg',
                        svg: true,
                        title: 'غير مقيدين بالسكن'),
                    const SizedBox(
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
                                    groupValue: cubit.waitingIsStudentKind,
                                    activeColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    focusColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    onChanged: (value) {
                                      cubit.changeWaitingPeopleType(true);
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
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Radio(
                                    value: false,
                                    groupValue: cubit.waitingIsStudentKind,
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
                                      cubit.changeWaitingPeopleType(false);
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: separator,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    Builder(
                        builder: (context){
                          if(state is GetAllUsersLoadingStates){
                            return const SizedBox(
                                width:double.infinity,
                                height: 300.0,
                                child: Center(child: CircularProgressIndicator()));
                          }else if (cubit.allUsers!.users.isEmpty){
                            return Text(
                              'لا يوجد بيانات حاليا !!',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            );
                          }else{
                            return ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => studentItem(
                                  item:  cubit.allUsers!.users[index],
                                  level: _levelList,
                                  credit: _creditList,
                                  term: _termList,
                                  job: _jobList,
                                  index: index,
                                context: context,
                                cubit: cubit,
                              ),
                              separatorBuilder: (context, index) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 10.0),
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
  var termController = TextEditingController();
  var levelController = TextEditingController();
  var jobController = TextEditingController();
  var creditController = TextEditingController();
  termController.text = item.firstTerm == true ? 'الأول' : item.secondTerm == true ?'الثاني' :item.thirdTerm == true ?'الثالث':'فارغ';
  levelController.text = item.buildingType == true ?'مميز':'عادي';
  jobController.text = item.isStudent == true ? 'طلاب' : 'عاملين';
  creditController.text = item.isPaid == true ? 'تم الدفع' : 'لم يتم الدفع';
  return Builder(
      builder: (context){
        if(cubit.showWaitingStudent_details==true){
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
                    if (cubit.showWaitingStudent_details == false ||
                        cubit.currentWaitingStudentIndex != index)
                      SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: IconButton(
                          onPressed: () {
                            cubit.currentWaitingStudentIndex = index;
                            cubit.showWaitingStudentDetails(
                                !cubit.showWaitingStudent_details, index);
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: ThemeCubit.get(context).darkTheme
                                ? mainTextColor
                                : mainColors,
                          ),
                        ),
                      ),
                    if (cubit.showWaitingStudent_details == true &&
                        cubit.currentWaitingStudentIndex == index)
                      SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: IconButton(
                          onPressed: () {
                            cubit.showWaitingStudentDetails(!cubit.showWaitingStudent_details, index);
                            if(cubit.showWaitingStudentEdit) {
                              cubit.changeWaitingStudentEditIcon(!cubit.showWaitingStudentEdit);
                            }
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
                    if (cubit.showWaitingStudent_details == true &&
                        cubit.currentWaitingStudentIndex == index)
                      SizedBox(
                        width: 50.0,
                        height: 30.0,
                        child: IconButton(
                          onPressed: () {
                            if (cubit.showWaitingStudentEdit == true) {
                              if (cubit.phoneController.text.length == 11 && cubit.nationalIDController.text.length==14) {
                                //todo null error :(
                                cubit.putStudent(
                                  idDB: item.idDB,
                                  id: int.parse(cubit.idController.text),
                                  roomnumber: int.parse(cubit.roomController.text),
                                  buildingName: cubit.buildingController.text,
                                  address: cubit.addressController.text,
                                  username: cubit.nameController.text,
                                  section: cubit.sectionController.text,
                                  NationalID: int.parse(cubit.nationalIDController.text),
                                  buildingType: levelController.text == 'مميز' ? true :false,
                                  isEmployee: jobController.text == 'طلاب'? false : true,
                                  isStudent: jobController.text == 'طلاب'? true : false,
                                  isPaid: creditController.text == 'تم الدفع' ? true :false,
                                  paidAt: cubit.paymentDateController.text,
                                  firstTerm: termController.text == 'الأول'? true : false,
                                  secondTerm:termController.text == 'الثاني'? true : false,
                                  thirdTerm: termController.text == 'الثالث'? true : false,
                                  phone: cubit.phoneController.text,
                                  floor: int.parse(cubit.floorController.text),
                                  isresident: true,
                                  iswaiting: true,
                                  fromWaiting: true,
                                  cardPhoto: '',
                                );
                              } else {
                                if(cubit.phoneController.text.length != 11){
                                  showToast(
                                      message: 'رقم الموبيل غير صحيح',
                                      state: ToastStates.ERROR);
                                  cubit.changeWaitingStudentEditIcon(!cubit.showWaitingStudentEdit);
                                }else{
                                  showToast(
                                      message: 'الرقم القومي غير صحيح',
                                      state: ToastStates.ERROR);
                                  cubit.changeWaitingStudentEditIcon(!cubit.showWaitingStudentEdit);
                                }
                              }
                            }
                            cubit.changeWaitingStudentEditIcon(!cubit.showWaitingStudentEdit);
                          },
                          icon: Icon(
                            cubit.showWaitingStudentEdit == false ? Icons.edit : Icons.done,
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
                if (cubit.showWaitingStudent_details == true &&
                    cubit.currentWaitingStudentIndex == index)
                  const SizedBox(
                    height: 10.0,
                  ),
                if (cubit.showWaitingStudent_details == true &&
                    cubit.currentWaitingStudentIndex == index)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    height: cubit.animatedWaitingStudentHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: cubit.showWaitingStudentEdit == true
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
                                controller: cubit.idController,
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                controller: cubit.nameController,
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                controller: cubit.addressController,
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                controller:cubit. sectionController,
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                  enableInteractiveSelection: cubit.showWaitingStudentEdit == true ? true : false ,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                  onTap: () {
                                    if(cubit.showWaitingStudentEdit == true ){
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
                                                    item.secondTerm = false;
                                                    item.thirdTerm = false;
                                                  }else if(val == 1){
                                                    item.firstTerm = false;
                                                    item.secondTerm = true;
                                                    item.thirdTerm = false;
                                                  }else{
                                                    item.firstTerm = false;
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
                          const SizedBox(
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
                                  controller:jobController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    hintStyle: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  readOnly: true,
                                  enableInteractiveSelection: cubit.showWaitingStudentEdit == true ? true : false ,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                  onTap: () {
                                    if(cubit.showWaitingStudentEdit == true ){
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
                          const SizedBox(
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
                                controller: cubit.phoneController,
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                controller: cubit.buildingController,
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                controller: cubit.roomController,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),

                          // floor
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- الدور :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              switchedTextFormField(
                                context: context,
                                cubit: cubit,
                                controller: cubit.floorController,
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                  enableInteractiveSelection: cubit.showWaitingStudentEdit == true ? true : false ,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                  onTap: () {
                                    if(cubit.showWaitingStudentEdit == true ){
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
                                                  levelController.text = e.text;
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
                          const SizedBox(
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
                                  cubit.showWaitingStudentEdit == true ? true : false,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                  onTap: () {
                                    if (cubit.showWaitingStudentEdit == true) {
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
                          const SizedBox(
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
                                controller: cubit.paymentDateController,
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                controller:cubit. nationalIDController,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),

                          //nationalPhoto
                          Text(
                            'صورة البطاقه',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
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
                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
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
                          const SizedBox(
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
              cubit.currentWaitingStudentIndex = index;
              cubit.showWaitingStudentDetails(
                  !cubit.showWaitingStudent_details, index);
              cubit.inputData(item);
            },
            child: Dismissible(
              direction: DismissDirection.startToEnd,
              resizeDuration: const Duration(milliseconds: 200),
              onDismissed: (direction) {
                cubit.deleteStudent(item.idDB,true);
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
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: IconButton(
                      onPressed: () {
                        cubit.currentWaitingStudentIndex = index;
                        cubit.showWaitingStudentDetails(
                            !cubit.showWaitingStudent_details, index);
                        cubit.inputData(item);
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
