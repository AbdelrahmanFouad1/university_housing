import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/models/students_model.dart';
import 'package:university_housing/moduls/dash_board/rooms/available_now.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class StudentsScreen extends StatelessWidget {
  StudentsScreen({Key? key}) : super(key: key);

  final List<AlertDialogModel> _genderList = [
    AlertDialogModel(
      text: "ذكر",
      index: 0,
    ),
    AlertDialogModel(
      text: "انثى",
      index: 1,
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
      text: "رفع إيصال",
      index: 0,
    ),
    AlertDialogModel(
      text: "بنكي",
      index: 1,
    ),
  ];

  final List<StudentsModel> list = [
    StudentsModel(
      id: '42018122',
      buildingName: 'عماره الزهراء',
      credit: false,
      job: true,
      gender: true,
      nationalID: '30002740101666',
      nationalPhoto: '',
      paymentDate: '20-02-2021',
      phone: '01119109758',
      room: '203',
      section: 'علوم حاسب',
      name: 'عبد الرحمن محمد فؤاد',
      address: 'مجاوره 28 امام مسجد علي ابن ابي طالب',
      level: true,
    ),
    StudentsModel(
      id: '42020005',
      buildingName: 'عماره الزهراء',
      credit: true,
      job: true,
      gender: true,
      nationalID: '30002740101666',
      nationalPhoto: '',
      paymentDate: '20-02-2021',
      phone: '01119109758',
      room: '203',
      section: 'هندسه عماره',
      name: 'علاء محمود خميس',
      address: 'مجاوره 28 امام مسجد علي ابن ابي طالب',
      level: true,
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
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultDashBoardTitleBox(
                      img: 'assets/images/team.png', title: 'الساكنين'),
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
                  Expanded(
                    flex: 1,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => studentItem(
                        item:  list[index],
                        allList: list,
                        cubit: cubit,
                        context: context,
                        index: index,
                        level: _levelList,
                        credit: _creditList,
                        gender: _genderList,
                        job: _jobList
                      ),
                      separatorBuilder: (context, index) => Container(
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
        );
      },
    );
  }
}

Widget studentItem({
  required context,
  required DashBoardCubit cubit,
  required StudentsModel item,
  required int index,
  required List<AlertDialogModel> gender,
  required List<AlertDialogModel> level,
  required List<AlertDialogModel> job,
  required List<AlertDialogModel> credit,
  required List<StudentsModel> allList,
}) {
  var idController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var sectionController = TextEditingController();
  var nationalIDController = TextEditingController();
  var genderController = TextEditingController();
  var nationalPhotoController = TextEditingController();
  var phoneController = TextEditingController();
  var levelController = TextEditingController();
  var jobController = TextEditingController();
  var roomController = TextEditingController();
  var creditController = TextEditingController();
  var paymentDateController = TextEditingController();
  var buildingController = TextEditingController();
  idController.text = item.id!;
  nameController.text = item.name!;
  addressController.text = item.address!;
  sectionController.text = item.section!;
  nationalIDController.text = item.nationalID!;
  paymentDateController.text = item.paymentDate!;
  roomController.text = item.room!;
  buildingController.text = item.buildingName!;
  genderController.text = item.gender! == true ? 'ذكر' : 'انثى';
  nationalPhotoController.text = item.nationalPhoto!;
  phoneController.text = item.phone!;
  levelController.text = item.level! == true ? 'مميز' : 'عادي';
  jobController.text = item.job! == true ? 'طلاب' : 'عاملين';
  creditController.text = item.credit! == true ? 'إيصال' : 'بنكى';
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
                        item.name!,
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item.id!,
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
                                  item.id = idController.text;
                                  item.name = nameController.text;
                                  item.address = addressController.text;
                                  item.section = sectionController.text;
                                  item.gender = genderController.text == 'ذكر'? true : false;
                                  item.job = jobController.text == 'طلاب'? true : false;
                                  item.phone = phoneController.text;
                                  item.buildingName = buildingController.text;
                                  item.room = roomController.text;
                                  item.level = levelController.text == 'مميز' ? true :false;
                                  item.credit = creditController.text == 'رفع إيصال' ? true :false;
                                  item.paymentDate = paymentDateController.text;
                                  item.nationalID = nationalIDController.text;
                                  item.nationalPhoto = nationalPhotoController.text;
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

                          // gender
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
                                            title: 'اختر النوع',
                                            child:Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: gender.map((e) => RadioListTile(
                                                activeColor:ThemeCubit.get(context).darkTheme? mainTextColor: backGroundDark,
                                                tileColor: backGroundDark,
                                                title: Text(
                                                  e.text,
                                                ),
                                                groupValue: cubit.currentStudentGenderVal,
                                                value: e.index,
                                                onChanged: (int? val) {
                                                  cubit.selectStudentGender(val ?? e.index);
                                                  genderController.text = cubit.currentStudentGenderText;
                                                  if(val == 0){
                                                    item.gender = true;
                                                  }else{
                                                    item.gender = false;
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
                                                    item.job = true;
                                                  }else{
                                                    item.job = false;
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
                                                    item.level = true;
                                                  }else{
                                                    item.level = false;
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
                                                    item.credit = true;
                                                  } else {
                                                    item.credit = false;
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

                          //nationalPhoto
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- صورة البطاقه :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              switchedTextFormField(
                                context: context,
                                cubit: cubit,
                                controller: nationalPhotoController,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          //requests
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- الطلابات :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              switchedTextFormField(
                                context: context,
                                cubit: cubit,
                                controller: nationalPhotoController,
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
                              switchedTextFormField(
                                context: context,
                                cubit: cubit,
                                controller: nationalPhotoController,
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
        }else{
          return Dismissible(
            direction: DismissDirection.startToEnd,
            resizeDuration: Duration(milliseconds: 200),
            onDismissed: (direction) {
              cubit.deleteStudent(allList,index);
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
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item.id!,
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
                              // if (cubit.showStudentEdit == true) {
                              //   item.id = idController.text;
                              //   item.name = nameController.text;
                              //   item.phone = phoneController.text;
                              //   item.nationalPhoto = nationalPhotoController.text;
                              //   item.nationalID = nationalIDController.text;
                              //   item.section = sectionController.text;
                              //   item.address = addressController.text;
                              //   item.room = roomController.text;
                              //   item.paymentDate = paymentDateController.text;
                              //   item.level =
                              //   statueController.text == 'معطل' ? false : true;
                              //   item.credit =
                              //   statueController.text == 'بنكي' ? true : false;
                              //   item.gender =
                              //   genderController.text == 'ذكر' ? true : false;
                              //   item.job = jobController.text == 'طلاب' ? true : false;
                              // }
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

                            // gender
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '- النوع :',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: genderController,
                                ),
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
                                    readOnly:
                                    cubit.showStudentEdit == true ? false : true,
                                    enableInteractiveSelection:
                                    cubit.showStudentEdit == true ? true : false,
                                    style: Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
                                    // onTap: () {
                                    //   showDialog<void>(
                                    //     barrierColor:ThemeCubit.get(context).darkTheme? backGroundDark : Colors.white,
                                    //     context: context,
                                    //     builder: (context) => buildDialog(
                                    //       context: context,
                                    //       title: 'اختر رقم الدور',
                                    //       child: Column(
                                    //         mainAxisSize: MainAxisSize.min,
                                    //         children: stateList.map((e) => RadioListTile(
                                    //           activeColor:ThemeCubit.get(context).darkTheme? mainTextColor: backGroundDark,
                                    //           tileColor: backGroundDark,
                                    //           title: Text(
                                    //             e.text,
                                    //             style: Theme.of(context).textTheme.bodyText1!,
                                    //           ),
                                    //           groupValue: cubit.currentJobVal,
                                    //           value: e.index,
                                    //           onChanged: (int? val) {
                                    //             cubit.selectState(val!, e.text);
                                    //             statueController.text = cubit.currentStateText;
                                    //             Navigator.pop(context);
                                    //           },
                                    //         )).toList(),
                                    //       ),
                                    //     ),
                                    //   );
                                    // },
                                  ),
                                ),
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
                                    readOnly:
                                    cubit.showStudentEdit == true ? false : true,
                                    enableInteractiveSelection:
                                    cubit.showStudentEdit == true ? true : false,
                                    style: Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
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
                                      hintStyle: Theme.of(context).textTheme.bodyText1,
                                    ),
                                    readOnly:
                                    cubit.showStudentEdit == true ? false : true,
                                    enableInteractiveSelection:
                                    cubit.showStudentEdit == true ? true : false,
                                    style: Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
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

                            //nationalPhoto
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '- صورة البطاقه :',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: nationalPhotoController,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),

                            //requests
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '- الطلابات :',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: nationalPhotoController,
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
                                switchedTextFormField(
                                  context: context,
                                  cubit: cubit,
                                  controller: nationalPhotoController,
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
            ),
          );
        }
      }
  );
}
