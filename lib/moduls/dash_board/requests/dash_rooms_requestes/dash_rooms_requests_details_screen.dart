import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashRoomsRequestsDetailsScreen extends StatelessWidget {

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
              title: 'طلبات التسكين',
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
                    if(currentComplaintsModel!.complaintType == 'book')
                      smallDashBoardTitleBox(
                          img: 'assets/images/room.png',
                          title: 'حجز الغرف'),
                    if(currentComplaintsModel!.complaintType == 'change')
                      smallDashBoardTitleBox(
                          img: 'assets/images/replace.png',
                          title: 'تبديل الغرف'),
                    if(currentComplaintsModel!.complaintType == 'exit')
                      smallDashBoardTitleBox(
                          svgImage:'assets/images/leave.svg',
                          svg: true,
                          title: 'أخلاء السكن'),

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
                                  'رقم الطلب :',
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


                          //Date
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'تاريخ الطلب :',
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





                          // if student want change
                          if(currentComplaintsModel!.complaintType == 'change')
                          Column(
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'تبديل الي الغرفه التاليه ',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: double.infinity,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color:
                                  ThemeCubit.get(context).darkTheme ? finesColorDark : Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: Colors.grey, width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ThemeCubit.get(context).darkTheme
                                          ? Colors.black.withOpacity(0.5)
                                          : Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // student name
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
                                              '19',
                                              style: Theme.of(context).textTheme.bodyText1,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),

                                      // student id
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              'رقم الدور :',
                                              style: Theme.of(context).textTheme.bodyText1,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              '2',
                                              style: Theme.of(context).textTheme.bodyText1,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),




                          // if student want book
                          if(currentComplaintsModel!.complaintType == 'book')
                            Column(
                            children: [

                              //floor
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'رقم الدور :',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '3',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),

                              // building type
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'نوع السكن :',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'مميز',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),

                              // section
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'القسم :',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'علوم حاسب',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),


                              // term
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'الترم :',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'الأول',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),



                              // gender
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'النوع :',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'ذكر',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),


                              // phone
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'الموبيل :',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '01119109808',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),


                              // address
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'العنوان :',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'شارع  احمد خطاب مدينه نصر محافظه القاهره',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),

                              // nationalID
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'الرقم القومي :',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '30002740101958',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),


                              // nationalPhoto
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'صوره البطاقة',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 20.0),
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
                                      image: DecorationImage(
                                        image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/New_Norwegian_ID_Card_%282021%29_%28Front%29.png/640px-New_Norwegian_ID_Card_%282021%29_%28Front%29.png'),
                                        fit: BoxFit.fitWidth,
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

                            ],
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


