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
                                child: Text(
                                  type == 'missing'? '${missingItem!.idDB}': type == 'damaged'? '${damagedItem!.idDB}':'${complaintsItem!.idDB}',

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
                                  type == 'missing'? '${missingItem!.user.username}': type == 'damaged'? '${damagedItem!.user.username}':'${complaintsItem!.user.username}',

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
                                  type == 'missing'? '${missingItem!.user.id}': type == 'damaged'? '${damagedItem!.user.id}':'${complaintsItem!.user.id}',
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
                                  type == 'missing'? '${missingItem!.user.roomnumber}': type == 'damaged'? '${damagedItem!.user.roomnumber}':'${complaintsItem!.user.roomnumber}',
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
                                  type == 'missing'? '${missingItem!.user.buildingName}': type == 'damaged'? '${damagedItem!.user.buildingName}':'${complaintsItem!.user.buildingName}',
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
                                  type == 'missing'? '${missingItem!.createdAt}': type == 'damaged'? '${damagedItem!.createdAt}':'${complaintsItem!.createdAt}',
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
                                        missingItem!.isReplied = true;
                                        // todo isAccepted not found in api
                                        // missingItem!.isAccepted = true;
                                        missingItem!.reply = managerController.text;
                                        missingItem!.updatedAt = DateFormat.yMMMd().format(now) ;
                                        showToast(message:'${missingItem!.updatedAt}' ,state: ToastStates.SUCCESS);
                                      } else if(type == 'damaged'){
                                        damagedItem!.isReplied = true;
                                        // todo isAccepted not found in api
                                        // damagedItem!.isAccepted = true;
                                        damagedItem!.reply = managerController.text;
                                        damagedItem!.updatedAt = DateFormat.yMMMd().format(now) ;
                                        showToast(message:'${damagedItem!.updatedAt}' ,state: ToastStates.SUCCESS);
                                      }else{
                                        complaintsItem!.isReplied = true;
                                        // todo isAccepted not found in api
                                        // complaintsItem!.isAccepted = true;
                                        complaintsItem!.reply = managerController.text;
                                        complaintsItem!.updatedAt = DateFormat.yMMMd().format(now) ;
                                        showToast(message:'${complaintsItem!.updatedAt}' ,state: ToastStates.SUCCESS);
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
                                      missingItem!.isReplied = true;
                                      // todo isAccepted not found in api
                                      // missingItem!.isAccepted = false;
                                      missingItem!.reply = managerController.text;
                                      missingItem!.updatedAt = DateFormat.yMMMd().format(now) ;
                                      showToast(message:'${missingItem!.updatedAt}' ,state: ToastStates.SUCCESS);
                                    } else if(type == 'damaged'){
                                      damagedItem!.isReplied = true;
                                      // todo isAccepted not found in api
                                      // damagedItem!.isAccepted = false;
                                      damagedItem!.reply = managerController.text;
                                      damagedItem!.updatedAt = DateFormat.yMMMd().format(now) ;
                                      showToast(message:'${damagedItem!.updatedAt}' ,state: ToastStates.SUCCESS);
                                    }else{
                                      complaintsItem!.isReplied = true;
                                      // todo isAccepted not found in api
                                      // complaintsItem!.isAccepted = false;
                                      complaintsItem!.reply = managerController.text;
                                      complaintsItem!.updatedAt = DateFormat.yMMMd().format(now) ;
                                      showToast(message:'${complaintsItem!.updatedAt}' ,state: ToastStates.SUCCESS);
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


