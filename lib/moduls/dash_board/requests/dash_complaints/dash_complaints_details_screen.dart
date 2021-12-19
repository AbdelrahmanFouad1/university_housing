import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/model/get_all_orders_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashComplimentsDetailsScreen extends StatelessWidget {

  DashComplimentsDetailsScreen({
    Key? key,
    required this.type,
    this.missingItem,
    this.damagedItem,
    this.complaintsItem,
  }): super(key: key);

  String type;
  Missing? missingItem;
  Damaged? damagedItem;
  Complaints? complaintsItem;

  var managerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {
        if(state is PutReplayMissingLoadingStates || state is PutReplayDamagedLoadingStates || state is PutReplayComplaintsLoadingStates ){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }else if(state is GetAllOrdersSuccessStates){
          Navigator.pop(context);
          showToast(message: 'تم الرد بنجاح', state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state) {

        if(type=='missing' && missingItem!.reply != 'empty' || type=='damaged' && damagedItem!.reply!= 'empty' || type=='complaints' && complaintsItem!.reply!= 'empty' ){
          managerController.text = type == 'missing'? '${missingItem!.reply}': type == 'damaged'? '${damagedItem!.reply}':'${complaintsItem!.reply}';
        }

        DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(type == 'missing'? '${missingItem!.createdAt}': type == 'damaged'? '${damagedItem!.createdAt}':'${complaintsItem!.createdAt}',);
        String date = tempDate.toString().substring(0, 10);
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
                    if(type == 'missing')
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/locate.svg',
                        svg: true,
                        title:  'شكوى شئ مفقود'),
                    if(type == 'damaged')
                      smallDashBoardTitleBox(
                          svgImage:'assets/images/broken-plate.svg',
                          svg: true,
                          title:  'شكوى شئ تالف'),
                    if(type == 'complaints')
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
                                child: SelectableText(
                                  type == 'missing'? '${missingItem!.idDB}': type == 'damaged'? '${damagedItem!.idDB}':'${complaintsItem!.idDB}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
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
                                child: SelectableText(
                                  type == 'missing'? '${missingItem!.user!.username}': type == 'damaged'? '${damagedItem!.user!.username}':'${complaintsItem!.user!.username}',
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
                                child: SelectableText(
                                  type == 'missing'? '${missingItem!.user!.id}': type == 'damaged'? '${damagedItem!.user!.id}':'${complaintsItem!.user!.id}',
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
                                child: SelectableText(
                                  type == 'missing'? '${missingItem!.user!.roomnumber }': type == 'damaged'? '${damagedItem!.user!.roomnumber}':'${complaintsItem!.user!.roomnumber}',
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
                                child: SelectableText(
                                  type == 'missing'? '${missingItem!.user!.buildingName}': type == 'damaged'? '${damagedItem!.user!.buildingName}':'${complaintsItem!.user!.buildingName}',
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
                                child: SelectableText(
                                    date,
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
                          dashWhiteBoard(
                            context,
                            text: type == 'missing'? '${missingItem!.missingthing}': type == 'damaged'? '${damagedItem!.damagedthing}':'${complaintsItem!.complaint}',
                          ),


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
                                      if(type == 'missing'){
                                        cubit.putMissing(
                                          isAccepted: missingItem!.isAccepted = true,
                                          idDB: missingItem!.idDB,
                                          reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                          isReplied: true,
                                        );
                                      } else if(type == 'damaged'){
                                        cubit.putDamaged(
                                          isAccepted:damagedItem!.isAccepted = true,
                                          idDB: damagedItem!.idDB,
                                          isReplied: true,
                                          reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                        );
                                      }else{
                                        cubit.putComplaints(
                                          idDB: complaintsItem!.idDB,
                                          isAccepted: complaintsItem!.isAccepted = true,
                                          isReplied: true,
                                          reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                        );
                                      }
                                    },
                                    text: 'اوافق',
                                    btnColor: Colors.green,
                                ),
                              ),
                              SizedBox(width: 10.0,),
                              Expanded(
                                child: defaultButton(
                                  function: (){
                                    if(type == 'missing'){
                                      cubit.putMissing(
                                        isAccepted: missingItem!.isAccepted = false,
                                        idDB: missingItem!.idDB,
                                        reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                        isReplied: true,
                                      );
                                    } else if(type == 'damaged'){
                                      cubit.putDamaged(
                                        isAccepted: damagedItem!.isAccepted = false,
                                        idDB: damagedItem!.idDB,
                                        isReplied: true,
                                        reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                      );
                                    }else{
                                      cubit.putComplaints(
                                        isAccepted: complaintsItem!.isAccepted = false,
                                        idDB: complaintsItem!.idDB,
                                        isReplied: true,
                                        reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                      );
                                    }
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


