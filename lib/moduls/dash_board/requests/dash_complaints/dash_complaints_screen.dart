import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/complaints_model.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_complaints/dash_complaints_details_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashComplimentsScreen extends StatelessWidget {


  final List<ComplaintsModel> complaintsItem = [
    ComplaintsModel(
      code: 'Rm520',
      name: 'حسام السيد علي',
      id: '42018553',
      buildingName: 'أسكان مميز (أ)',
      complaintDate: '20-10-2021',
      complaintType: 'complaints',
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
      complaintType: 'complaints',
      isReplied: false,
      managerReply: '',
      replyDate: '',
      room: '203',
      StudentComplaint: 'يوجد معامله سيئه من الامن',
    ),
    ComplaintsModel(
      code: 'Y423Z',
      name: 'احمد سيد عيد',
      id: '42021052',
      buildingName: 'أسكان مميز (أ)',
      complaintDate: '20-10-2021',
      complaintType: 'complaints',
      isReplied: false,
      managerReply: '',
      replyDate: '',
      room: '203',
      StudentComplaint: 'يوجد معامله سيئه من الامن',
    ),
  ];

  final List<ComplaintsModel> damagesItem = [
    ComplaintsModel(
      code: 'Rm520',
      name: 'حسام السيد علي',
      id: '42018553',
      buildingName: 'أسكان مميز (أ)',
      complaintDate: '20-10-2021',
      complaintType: 'damagedthings',
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
      complaintType: 'damagedthings',
      isReplied: false,
      managerReply: '',
      replyDate: '',
      room: '203',
      StudentComplaint: 'يوجد معامله سيئه من الامن',
    ),
    ComplaintsModel(
      code: 'Y423Z',
      name: 'احمد سيد عيد',
      id: '42021052',
      buildingName: 'أسكان مميز (أ)',
      complaintDate: '20-10-2021',
      complaintType: 'damagedthings',
      isReplied: false,
      managerReply: '',
      replyDate: '',
      room: '203',
      StudentComplaint: 'يوجد معامله سيئه من الامن',
    ),
  ];

  final List<ComplaintsModel> lostItem = [
    ComplaintsModel(
      code: '223LL',
      name: 'اميره علس السيد',
      id: '42018553',
      buildingName: 'أسكان مميز (أ)',
      complaintDate: '20-10-2021',
      complaintType: 'missingthings',
      isAccepted: true,
      isReplied: true,
      managerReply: 'يتم الان التحقق من الأمر',
      replyDate: '21-10-2021',
      room: '203',
      StudentComplaint: 'يوجد سرقه من عامل النظافة',
    ),
    ComplaintsModel(
      code: 'KIL523',
      name: 'خالد سامح الاسيوطي',
      id: '420203369',
      buildingName: 'أسكان مميز (أ)',
      complaintDate: '20-10-2021',
      complaintType: 'missingthings',
      isReplied: false,
      managerReply: '',
      replyDate: '',
      room: '203',
      StudentComplaint: 'يوجد معامله سيئه من الامن',
    ),
    ComplaintsModel(
      code: 'oop523',
      name: 'سميره احمد سعيد متولي',
      id: '42021052',
      buildingName: 'أسكان مميز (أ)',
      complaintDate: '20-10-2021',
      complaintType: 'missingthings',
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
                        itemBuilder: (context, index) => ComplaintsItem(
                            item: lostItem[index],
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
                        itemCount: lostItem.length,
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
                        itemBuilder: (context, index) => ComplaintsItem(
                            item: damagesItem[index],
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
                        itemCount: damagesItem.length,
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
  return InkWell(
    onTap: (){
      cubit.savingCurrentComplaintsModel(item);
      if(currentComplaintsModel != null){
        navigateTo(context, DashComplimentsDetailsScreen());
      }
    },
    child: Row(
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
        Container(
          width: 30.0,
          height: 30.0,
          child: IconButton(
            onPressed: () {
              cubit.savingCurrentComplaintsModel(item);
              if(currentComplaintsModel != null){
                navigateTo(context, DashComplimentsDetailsScreen());
              }
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
      ],
    ),
  );
}


