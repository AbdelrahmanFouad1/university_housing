import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/buidings_model.dart';
import 'package:university_housing/model/complaints_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashComplimentsScreen extends StatelessWidget {

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
  ];

  final List<ComplaintsModel> complaintsItem = [
    ComplaintsModel(
      code: 'Rm520',
      name: 'حسام السيد علي',
      id: '42018553',
      buildingName: 'أسكان مميز (أ)',
      complaintDate: '20-10-2021',
      complaintType: 'شكوى عامة',
      isAccepted: true,
      isReplied: true,
      managerReply: 'يتم الان التحقق من الأمر',
      replyDate: '21-10-2021',
      room: '203',
      StudentComplaint: 'يوجد سرقه من عامل النظافة',
    ),
    ComplaintsModel(
      code: 'Y423Z',
      name: 'احمد سيد عيد',
      id: '42021052',
      buildingName: 'أسكان مميز (أ)',
      complaintDate: '20-10-2021',
      complaintType: 'شكوى عامة',
      isReplied: false,
      managerReply: '',
      replyDate: '',
      room: '203',
      StudentComplaint: 'يوجد معامله سيئه من الامن',
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
              title: 'الشكوى',
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

                    //lost
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/locate.svg',
                        svg: true,
                        title: 'المفقودات'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: ListView.separated(
                        padding: EdgeInsetsDirectional.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => buildingItem(
                            item: item[index],
                            cubit: cubit,
                            context: context,
                            index: index,
                            allList: item),
                        separatorBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: item.length,
                      ),
                    ),


                    SizedBox(
                      height: 20.0,
                    ),

                    // broken
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/broken-plate.svg',
                        svg: true,
                        title: 'تبديل التالف'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: ListView.separated(
                        padding: EdgeInsetsDirectional.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => buildingItem(
                            item: item[index],
                            cubit: cubit,
                            context: context,
                            index: index,
                            allList: item),
                        separatorBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: item.length,
                      ),
                    ),


                    SizedBox(
                      height: 20.0,
                    ),


                    //complaints
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/review.svg',
                        svg: true,
                        title: 'شكوى عامة'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: ListView.separated(
                        padding: EdgeInsetsDirectional.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => ComplaintsItem(
                            item: complaintsItem[index],
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
                        itemCount: complaintsItem.length,
                      ),
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

                ],
              ),
            ),
          )
      ],
    ),
  );
}



Widget ComplaintsItem({
  required BuildContext context,
  required DashBoardCubit cubit,
  required ComplaintsModel item,
  required int index,
}) {
  var codeController = TextEditingController();
  var nameController = TextEditingController();
  codeController.text = item.code!;
  nameController.text = item.name!;
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
            Expanded(
              child: Text(
                item.code!,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


