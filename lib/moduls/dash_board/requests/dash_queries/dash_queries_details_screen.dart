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

class DashQueriesDetailsScreen extends StatelessWidget {

  var managerController = TextEditingController();
  var now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        managerController.text = currentQueriesModel!.managerReply! ;
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'الأستعلامات',
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
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/research.svg',
                        svg: true,
                        title: 'الاستعلامات'),

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
                                  'رقم الأستعلام :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${currentQueriesModel!.code}',
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
                                  '${currentQueriesModel!.name}',
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
                                  '${currentQueriesModel!.id}',
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
                                  '${currentQueriesModel!.room}',
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
                                  '${currentQueriesModel!.buildingName}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),


                          //queriesDate
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'تاريخ الأستعلام :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${currentQueriesModel!.queriesDate}',
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
                            'السؤال',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          dashWhiteBoard(context,text:'${currentQueriesModel!.StudentQueries}',),


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
                          defaultButton(
                            function: (){
                              if(managerController.text.isEmpty){
                                showToast(message:'يجب الرد علي الأستعلام أولا' ,state: ToastStates.ERROR);
                              }else{
                                currentQueriesModel!.isReplied = true;
                                currentQueriesModel!.managerReply = managerController.text;
                                currentQueriesModel!.replyDate = DateFormat.yMMMd().format(now) ;
                                showToast(message:'${currentQueriesModel!.replyDate}'+'\n'+'${currentQueriesModel!.managerReply}' ,state: ToastStates.SUCCESS);
                              }
                            },
                            text: 'تأكيد الرد',
                            btnColor: mainColors,
                            width: double.infinity,
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


