import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/model/buidings_model.dart';
import 'package:university_housing/model/complaints_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashComplimentsDetailsScreen extends StatelessWidget {

  var managerController = TextEditingController();
  var now = new DateTime.now();

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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if(currentComplaintsModel!.complaintType == 'missingthings')
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/locate.svg',
                        svg: true,
                        title:  'شكوى شئ مفقود'),
                    if(currentComplaintsModel!.complaintType == 'damagedthings')
                      smallDashBoardTitleBox(
                          svgImage:'assets/images/broken-plate.svg',
                          svg: true,
                          title:  'شكوى شئ تالف'),
                    if(currentComplaintsModel!.complaintType == 'complaints')
                      smallDashBoardTitleBox(
                          svgImage:'assets/images/review.svg',
                          svg: true,
                          title:  'شكوى عامة'),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          //code
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'رقم الشكوى :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${currentComplaintsModel!.code}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),

                          // name
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'الأسم :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${currentComplaintsModel!.name}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),

                          //ID
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'رقم الطالب :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${currentComplaintsModel!.id}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),


                          //Room
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'رقم الغرفة :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${currentComplaintsModel!.room}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),


                          //Building
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'اسم المبنى :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${currentComplaintsModel!.buildingName}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),


                          //complaintDate
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'تاريخ الشكوى :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${currentComplaintsModel!.complaintDate}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),


                          //StudentComplaint
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'الشكوى',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          dashWhiteBoard(context,text:'${currentComplaintsModel!.StudentComplaint}',),


                          //managerReply
                          SizedBox(
                            height: 20.0,
                          ),
                          dashTextFormField(
                              controller: managerController,
                              type: TextInputType.text,
                              hint: 'الرد ...',
                              context: context,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: defaultButton(
                                    function: (){
                                      currentComplaintsModel!.isReplied = true;
                                      currentComplaintsModel!.isAccepted = true;
                                      currentComplaintsModel!.managerReply = managerController.text;
                                      currentComplaintsModel!.replyDate = DateFormat.yMMMd().format(now) ;
                                      showToast(message: '${currentComplaintsModel!.isAccepted}'+'${currentComplaintsModel!.replyDate}'+'${currentComplaintsModel!.managerReply}' ,state: ToastStates.SUCCESS);
                                    },
                                    text: 'اوافق',
                                    btnColor: Colors.green,
                                ),
                              ),
                              SizedBox(width: 10.0,),
                              Expanded(
                                child: defaultButton(
                                  function: (){
                                    currentComplaintsModel!.isReplied = true;
                                    currentComplaintsModel!.isAccepted = false;
                                    currentComplaintsModel!.managerReply = managerController.text;
                                    currentComplaintsModel!.replyDate = DateFormat.yMMMd().format(now) ;
                                    showToast(message: '${currentComplaintsModel!.isAccepted}'+'${currentComplaintsModel!.replyDate}'+'${currentComplaintsModel!.managerReply}' ,state: ToastStates.ERROR);
                                  },
                                  text: 'ارفض',
                                  btnColor: Colors.red,
                                ),
                              ),
                            ],
                          ),
                      ],),
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


