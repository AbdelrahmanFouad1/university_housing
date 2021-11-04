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

class DashHostsDetailsScreen extends StatelessWidget {
  var managerController = TextEditingController();
  var now = new DateTime.now();
  bool isStudent =  false ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        var replyDate = DateFormat.yMMMd().format(now);
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'الإستضافة',
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
                        svgImage: 'assets/images/follow.svg',
                        title: 'طلبات الإستضافة',
                        svg: true
                    ),
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
                                  'TTM52',
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
                                  'احمد سعيد علي محمد',
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
                                  '42019006',
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
                                  '19',
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
                                  'عماره الزهراء',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          //requestDate
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
                                  'Nov 12, 2021',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          //Student
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'الطلب',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          if (isStudent == true)
                            Container(
                              width: double.infinity,
                              height: 200.0,
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
                                            'اسم الطالب :',
                                            style: Theme.of(context).textTheme.bodyText1,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'علي محمود سعيد',
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
                                            'رقم الطالب :',
                                            style: Theme.of(context).textTheme.bodyText1,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '42020369',
                                            style: Theme.of(context).textTheme.bodyText1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),

                                    //HostDate
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            'تاريخ الأقامة :',
                                            style: Theme.of(context).textTheme.bodyText1,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Feb 2, 2021',
                                            style: Theme.of(context).textTheme.bodyText1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),

                                    //DurationOfHosting
                                    Row(
                                      children: [
                                        Text(
                                          'عدد أيام الأقامة :',
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '3',
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
                          if (isStudent == false)
                            Container(
                            width: double.infinity,
                            height: 400.0,
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
                                  // guest name
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'اسم الضيف :',
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'علي محمود سعيد',
                                          style: Theme.of(context).textTheme.bodyText1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),

                                  // relation
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'صلة القرابة :',
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'اخي',
                                          style: Theme.of(context).textTheme.bodyText1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),

                                  //HostDate
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'تاريخ الأقامة :',
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Feb 2, 2021',
                                          style: Theme.of(context).textTheme.bodyText1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),

                                  //DurationOfHosting
                                  Row(
                                    children: [
                                      Text(
                                        'عدد أيام الأقامة :',
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      Expanded(
                                        child: Text(
                                          '3',
                                          style: Theme.of(context).textTheme.bodyText1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.0,
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
                            ),
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
                                  function: () {
                                    showToast(
                                        message: '${replyDate}',
                                        state: ToastStates.SUCCESS);
                                  },
                                  text: 'اوافق',
                                  btnColor: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: defaultButton(
                                  function: () {
                                    showToast(
                                        message: '${replyDate}',
                                        state: ToastStates.ERROR);
                                  },
                                  text: 'ارفض',
                                  btnColor: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
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
