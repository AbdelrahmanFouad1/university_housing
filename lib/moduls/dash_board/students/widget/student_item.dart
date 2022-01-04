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

class StudentWaitingItem extends StatefulWidget {
  final Users item;
  final int index;
  final List<AlertDialogModel> term;
  final List<AlertDialogModel> level;
  final List<AlertDialogModel> job;
  final List<AlertDialogModel> credit;
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

  StudentWaitingItem({
    Key? key,
    required this.item,
    required this.index,
    required this.term,
    required this.level,
    required this.job,
    required this.credit,
  }) : super(key: key);

  @override
  State<StudentWaitingItem> createState() => _StudentWaitingItemState();
}

class _StudentWaitingItemState extends State<StudentWaitingItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.idController.text = widget.item.id.toString();
    widget.nameController.text = widget.item.username;
    widget.addressController.text = widget.item.address.isEmpty ? 'فارغ':widget.item.address;
    widget.sectionController.text = widget.item.section;
    widget.nationalIDController.text = widget.item.NationalID.toString();
    widget.paymentDateController.text = 'فارغ';
    widget.roomController.text = widget.item.roomnumber.toString();
    widget.buildingController.text = widget.item.buildingName.isEmpty ? 'فارغ':widget.item.buildingName;
    widget.termController.text = widget.item.firstTerm == true ? 'الأول' : widget.item.secondTerm == true ?'الثاني' :widget.item.thirdTerm == true ?'الثالث':'فارغ';
    widget.nationalPhotoController.text = widget.item.cardPhoto;
    widget.phoneController.text = widget.item.phone;
    widget.levelController.text = widget.item.buildingType == true ?'مميز':'عادي';
    widget.jobController.text = widget.item.isStudent == true ? 'طلاب' : 'عاملين';
    widget.creditController.text = widget.item.isPaid == true ? 'تم الدفع' : 'لم يتم الدفع';
    return BlocBuilder<DashBoardCubit, DashBoardStates>(
      builder: (context, state) {
        return Builder(builder: (context) {
          var cubit = DashBoardCubit.get(context);
          if (cubit.showWaitingStudent_details == true) {
            return Card(
              color: ThemeCubit.get(context).darkTheme
                  ? backGroundDark
                  : backGround,
              elevation: 0.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.item.username,
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.item.id.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (cubit.showWaitingStudent_details == false ||
                          cubit.currentWaitingStudentIndex !=  widget.index)
                        SizedBox(
                          width: 30.0,
                          height: 30.0,
                          child: IconButton(
                            onPressed: () {
                              cubit.currentWaitingStudentIndex =  widget.index;
                              cubit.showWaitingStudentDetails(
                                  !cubit.showWaitingStudent_details,  widget.index);
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
                          cubit.currentWaitingStudentIndex ==  widget.index)
                        SizedBox(
                          width: 30.0,
                          height: 30.0,
                          child: IconButton(
                            onPressed: () {
                              cubit.showWaitingStudentDetails(
                                  !cubit.showWaitingStudent_details,  widget.index);
                              if (cubit.showWaitingStudentEdit) {
                                cubit.changeWaitingStudentEditIcon(
                                    !cubit.showWaitingStudentEdit);
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
                          cubit.currentWaitingStudentIndex ==  widget.index)
                        SizedBox(
                          width: 50.0,
                          height: 30.0,
                          child: IconButton(
                            onPressed: () {
                              if (cubit.showWaitingStudentEdit == true) {
                                if (widget.phoneController.text.length == 11 &&
                                    widget.nationalIDController.text.length ==
                                        14) {
                                  cubit.putStudent(
                                    idDB:  widget.item.idDB,
                                    id: int.parse(widget.idController.text),
                                    roomnumber:
                                        int.parse(widget.roomController.text),
                                    buildingName: widget.buildingController.text,
                                    address: widget.addressController.text,
                                    username: widget.nameController.text,
                                    section: widget.sectionController.text,
                                    NationalID: int.parse(
                                        widget.nationalIDController.text),
                                    buildingType:
                                        widget.levelController.text == 'مميز'
                                            ? true
                                            : false,
                                    isEmployee:
                                        widget.jobController.text == 'طلاب'
                                            ? false
                                            : true,
                                    isStudent:
                                        widget.jobController.text == 'طلاب'
                                            ? true
                                            : false,
                                    isPaid: widget.creditController.text ==
                                            'تم الدفع'
                                        ? true
                                        : false,
                                    paidAt: widget.paymentDateController.text,
                                    firstTerm:
                                        widget.termController.text == 'الأول'
                                            ? true
                                            : false,
                                    secondTerm:
                                        widget.termController.text == 'الثاني'
                                            ? true
                                            : false,
                                    thirdTerm:
                                        widget.termController.text == 'الثالث'
                                            ? true
                                            : false,
                                    cardPhoto:  widget.item.cardPhoto,
                                    phone:  widget.item.phone,
                                    floor:  widget.item.floor,
                                  );
                                } else {
                                  if (widget.phoneController.text.length != 11) {
                                    showToast(
                                        message: 'رقم الموبيل غير صحيح',
                                        state: ToastStates.ERROR);
                                    cubit.changeWaitingStudentEditIcon(
                                        !cubit.showWaitingStudentEdit);
                                  } else {
                                    showToast(
                                        message: 'الرقم القومي غير صحيح',
                                        state: ToastStates.ERROR);
                                    cubit.changeWaitingStudentEditIcon(
                                        !cubit.showWaitingStudentEdit);
                                  }
                                }
                              }
                              cubit.changeWaitingStudentEditIcon(
                                  !cubit.showWaitingStudentEdit);
                            },
                            icon: Icon(
                              cubit.showWaitingStudentEdit == false
                                  ? Icons.edit
                                  : Icons.done,
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
                      cubit.currentWaitingStudentIndex ==  widget.index)
                    const SizedBox(
                      height: 10.0,
                    ),
                  if (cubit.showWaitingStudent_details == true &&
                      cubit.currentWaitingStudentIndex ==  widget.index)
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
                        child: Column(
                          children: [
                            //Id
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '- رقم الطالب :',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: widget.idController,
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: widget.nameController,
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: widget.addressController,
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: widget.sectionController,
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: widget.termController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    readOnly: true,
                                    enableInteractiveSelection:
                                    cubit.showWaitingStudentEdit == true
                                            ? true
                                            : false,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
                                    onTap: () {
                                      if (cubit.showWaitingStudentEdit ==
                                          true) {
                                        showDialog<void>(
                                          context: context,
                                          builder: (context) => buildDialog(
                                              context: context,
                                              title: 'اختر الترم',
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children:  widget.term
                                                    .map((e) => RadioListTile(
                                                          activeColor: ThemeCubit
                                                                      .get(
                                                                          context)
                                                                  .darkTheme
                                                              ? mainTextColor
                                                              : backGroundDark,
                                                          tileColor:
                                                              backGroundDark,
                                                          title: Text(
                                                            e.text,
                                                          ),
                                                          groupValue: cubit
                                                              .currentStudentTermVal,
                                                          value: e.index,
                                                          onChanged:
                                                              (int? val) {
                                                                cubit.selectStudentTerm(
                                                                val ?? e.index);
                                                            widget.termController
                                                                    .text =
                                                                cubit
                                                                    .currentStudentTermText;
                                                            if (val == 0) {
                                                              widget.item.firstTerm =
                                                                  true;
                                                            } else if (val ==
                                                                1) {
                                                              widget.item.firstTerm =
                                                                  false;
                                                              widget.item.secondTerm =
                                                                  true;
                                                            } else {
                                                              widget.item.secondTerm =
                                                                  false;
                                                              widget.item.thirdTerm =
                                                                  true;
                                                            }
                                                            Navigator.pop(
                                                                context);
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

                            // job
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '- الوظيفة :',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: widget.jobController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    readOnly: true,
                                    enableInteractiveSelection:
                                    cubit.showWaitingStudentEdit == true
                                            ? true
                                            : false,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
                                    onTap: () {
                                      if (cubit.showWaitingStudentEdit ==
                                          true) {
                                        showDialog<void>(
                                          context: context,
                                          builder: (context) => buildDialog(
                                              context: context,
                                              title: 'اختر الوظية',
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children:  widget.job
                                                    .map((e) => RadioListTile(
                                                          activeColor: ThemeCubit
                                                                      .get(
                                                                          context)
                                                                  .darkTheme
                                                              ? mainTextColor
                                                              : backGroundDark,
                                                          tileColor:
                                                              backGroundDark,
                                                          title: Text(
                                                            e.text,
                                                          ),
                                                          groupValue: cubit
                                                              .currentStudentJobVal,
                                                          value: e.index,
                                                          onChanged:
                                                              (int? val) {
                                                                cubit.selectStudentJob(
                                                                val ?? e.index);
                                                            widget.jobController
                                                                    .text =
                                                                cubit
                                                                    .currentStudentJobText;
                                                            if (val == 0) {
                                                              widget.item.isStudent =
                                                                  true;
                                                            } else {
                                                              widget.item.isStudent =
                                                                  false;
                                                            }
                                                            Navigator.pop(
                                                                context);
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

                            //phone
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '- الموبيل :',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: widget.phoneController,
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: widget.buildingController,
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: widget.roomController,
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: widget.levelController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    readOnly: true,
                                    enableInteractiveSelection:
                                    cubit.showWaitingStudentEdit == true
                                            ? true
                                            : false,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
                                    onTap: () {
                                      if (cubit.showWaitingStudentEdit ==
                                          true) {
                                        showDialog<void>(
                                          context: context,
                                          builder: (context) => buildDialog(
                                              context: context,
                                              title: 'اختر نوع السكن',
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children:  widget.level
                                                    .map((e) => RadioListTile(
                                                          activeColor: ThemeCubit
                                                                      .get(
                                                                          context)
                                                                  .darkTheme
                                                              ? mainTextColor
                                                              : backGroundDark,
                                                          tileColor:
                                                              backGroundDark,
                                                          title: Text(
                                                            e.text,
                                                          ),
                                                          groupValue: cubit
                                                              .currentStudentLevelVal,
                                                          value: e.index,
                                                          onChanged:
                                                              (int? val) {
                                                                cubit.selectStudentLevel(
                                                                val ?? e.index);
                                                            widget.levelController
                                                                .text = e.text;
                                                            if (val == 0) {
                                                              widget.item.buildingType =
                                                                  true;
                                                            } else {
                                                              widget.item.buildingType =
                                                                  false;
                                                            }
                                                            Navigator.pop(
                                                                context);
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

                            // credit
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '- نوع الدفع :',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: widget.creditController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      hintStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    readOnly: true,
                                    enableInteractiveSelection:
                                    cubit.showWaitingStudentEdit == true
                                            ? true
                                            : false,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
                                    onTap: () {
                                      if (cubit.showWaitingStudentEdit ==
                                          true) {
                                        showDialog<void>(
                                          context: context,
                                          builder: (context) => buildDialog(
                                              context: context,
                                              title: 'اختر طريقة الدفع',
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children:  widget.credit
                                                    .map((e) => RadioListTile(
                                                          activeColor: ThemeCubit
                                                                      .get(
                                                                          context)
                                                                  .darkTheme
                                                              ? mainTextColor
                                                              : backGroundDark,
                                                          tileColor:
                                                              backGroundDark,
                                                          title: Text(
                                                            e.text,
                                                          ),
                                                          groupValue: cubit
                                                              .currentStudentCreditVal,
                                                          value: e.index,
                                                          onChanged:
                                                              (int? val) {
                                                                cubit.selectStudentCredit(
                                                                val ?? e.index);
                                                            widget.creditController
                                                                    .text =
                                                                cubit
                                                                    .currentStudentCreditText;
                                                            if (val == 0) {
                                                              widget.item.isPaid =
                                                                  true;
                                                            } else {
                                                              widget.item.isPaid =
                                                                  false;
                                                            }
                                                            Navigator.pop(
                                                                context);
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: widget.paymentDateController,
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: widget.nationalIDController,
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
                                    borderRadius: BorderRadius.circular(
                                      8.0,
                                    ),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:  widget.item.cardPhoto,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      alignment: Alignment.center,
                                      height: 50.0,
                                      child: Icon(
                                        Icons.error,
                                        color: ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 188.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
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
          } else {
            return InkWell(
              onTap: () {
                cubit.currentWaitingStudentIndex =  widget.index;
                cubit.showWaitingStudentDetails(
                    !cubit.showWaitingStudent_details,  widget.index);
                // widget.inputData(widget.waitingItem!);
              },
              child: Dismissible(
                direction: DismissDirection.startToEnd,
                resizeDuration: const Duration(milliseconds: 200),
                onDismissed: (direction) {
                  cubit.deleteStudent( widget.item.idDB, true);
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
                        widget.item.username,
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.item.id.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                      height: 30.0,
                      child: IconButton(
                        onPressed: () {
                          cubit.currentWaitingStudentIndex =  widget.index;
                          cubit.showWaitingStudentDetails(
                              !cubit.showWaitingStudent_details,  widget.index);
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
      },
    );
  }
}
