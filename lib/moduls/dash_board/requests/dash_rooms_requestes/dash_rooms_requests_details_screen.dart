import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/model/get_all_orders_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashRoomsRequestsDetailsScreen extends StatelessWidget {

  DashRoomsRequestsDetailsScreen({
    Key? key,
    required this.type,
    this.bookingItem,
    this.changeItem,
    this.leftItem,
}): super(key: key);

  String type;
  BookingOrders? bookingItem;
  ChangeRoom? changeItem;
  LeftOrders? leftItem;

  var managerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {
        if(state is PutReplayRoomLoadingStates || state is PutReplayChangeLoadingStates || state is PutReplayExitLoadingStates ){
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

        if(type=='book' && bookingItem!.reply != 'empty' || type=='change' && changeItem!.reply!= 'empty' || type=='exit' && leftItem!.reply!= 'empty' ){
          managerController.text = type == 'book'? bookingItem!.reply: type == 'change'? changeItem!.reply:leftItem!.reply;
        }
        DateTime tempDate = DateFormat("yyyy-MM-dd").parse(type == 'book'? bookingItem!.createdAt: type == 'change'? changeItem!.createdAt:leftItem!.createdAt,);
        String date = tempDate.toString().substring(0, 10);

        managerController.text = type=='book'? bookingItem!.reply : type=='change'? changeItem!.reply :leftItem!.reply ;
        var cubit = DashBoardCubit.get(context);

        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'طلبات التسكين',
              context: context,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if(type == 'book')
                      smallDashBoardTitleBox(
                          img: 'assets/images/room.png',
                          title: 'حجز الغرف'),
                    if(type == 'change')
                      smallDashBoardTitleBox(
                          img: 'assets/images/replace.png',
                          title: 'تبديل الغرف'),
                    if(type == 'exit')
                      smallDashBoardTitleBox(
                          svgImage:'assets/images/leave.svg',
                          svg: true,
                          title: 'أخلاء السكن'),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          //code
                          const SizedBox(
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
                                child: SelectableText(
                                type == 'book'? bookingItem!.idDB: type == 'change'? changeItem!.idDB:leftItem!.idDB,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
                                ),
                              ),
                            ],
                          ),


                          //Date
                          const SizedBox(
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
                                child: SelectableText(
                                    date,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),

                          // name
                          const SizedBox(
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
                                  type == 'book'? bookingItem!.user!.username: type == 'change'? changeItem!.user!.username:leftItem!.user!.username,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          //ID
                          const SizedBox(
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
                                  type == 'book'? '${bookingItem!.user!.id}': type == 'change'? '${changeItem!.user!.id}':'${leftItem!.user!.id}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),


                          //Room
                          const SizedBox(
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
                                  type == 'book'? '${bookingItem!.roomnumber}': type == 'change'? '${changeItem!.user!.roomnumber}':'${leftItem!.user!.roomnumber}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),


                          //Building
                          const SizedBox(
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
                                  type == 'book'? bookingItem!.buildingName: type == 'change'? changeItem!.user!.buildingName:leftItem!.user!.buildingName,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),





                          // if student want change
                          if(type == 'change')
                          Column(
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'تبديل الي الغرفه التاليه ',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0),
                              ),
                              const SizedBox(
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
                                      // next room num
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
                                              changeItem!.numofnextroom.toString(),
                                              style: Theme.of(context).textTheme.bodyText1,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      // next floor num
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
                                            child: SelectableText(
                                              changeItem!.floornumberofnextroom.toString(),
                                              style: Theme.of(context).textTheme.bodyText1,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),




                          // if student want book
                          if(type == 'book')
                            Column(
                            children: [
                              //floor
                              const SizedBox(
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
                                    child: SelectableText(
                                      bookingItem!.floor.toString(),
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),

                              // building type
                              const SizedBox(
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
                                    child: SelectableText(
                                      bookingItem!.buildingType ? 'مميز':'عادي',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),

                              // section
                              const SizedBox(
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
                                    child: SelectableText(
                                      bookingItem!.Section,
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),


                              // term
                              const SizedBox(
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
                                    child: SelectableText(
                                      bookingItem!.firstTerm ? 'الأول': bookingItem!.secondTerm? 'الثاني' :'الثالث',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),



                              // gender
                              const SizedBox(
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
                                    child: SelectableText(
                                      bookingItem!.gender ? 'ذكر':'أنثى',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                              // phone
                              const SizedBox(
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
                                    child: SelectableText(
                                      bookingItem!.phone,
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),


                              // address
                              const SizedBox(
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
                                    child: SelectableText(
                                      bookingItem!.address,
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),

                              // nationalID
                              const SizedBox(
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
                                    child: SelectableText(
                                      '${bookingItem!.NationalID}',
                                      style: Theme.of(context).textTheme.bodyText1,
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                ],
                              ),


                              // nationalPhoto
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'صوره البطاقة',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 20.0),
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
                                      borderRadius: BorderRadius.circular(8.0,),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: bookingItem!.cardPhoto,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>  Container(
                                        alignment: Alignment.center,
                                        height: 80.0,
                                        child: Icon(Icons.error,
                                          color: ThemeCubit.get(context).darkTheme
                                              ? mainTextColor
                                              : mainColors,),
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


                          // if student want exit
                          if(type == 'exit')
                            Column(
                              children: [
                                //reason
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'سبب الإخلاء :',
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SelectableText(
                                        leftItem!.reason.isNotEmpty? leftItem!.reason : 'لا يوجد سبب',
                                        style: Theme.of(context).textTheme.bodyText1,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),




                          //managerReply
                          const SizedBox(
                            height: 20.0,
                          ),
                          dashTextFormField(
                              controller: managerController,
                              type: TextInputType.text,
                              hint: 'الرد ...',
                              context: context,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: defaultButton(
                                    function: (){
                                      if(type == 'book'){
                                        cubit.putReplayBookRoom(
                                          idDB: bookingItem!.idDB,
                                          isReplied: true,
                                          isAccepted: true,
                                          isWaiting: false,
                                          reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                        );
                                        cubit.ifAcceptedBooking(bookingItem: bookingItem!);
                                      } else if(type == 'change'){
                                        cubit.putReplayChange(
                                          idDB: changeItem!.idDB,
                                            isAccepted: true,
                                            reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                          isReplied: true
                                        );
                                      }else{
                                        cubit.ifAcceptedExit(leftItem: leftItem!);
                                        if(state is PutStudentSuccessStates ){
                                          cubit.putReplayExit(
                                              isAccepted: true,
                                              idDB: leftItem!.idDB,
                                              reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                              isReplied: true
                                          );
                                        }
                                      }
                                    },
                                    text: 'اوافق',
                                    btnColor: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 10.0,),
                              Expanded(
                                child: defaultButton(
                                  function: (){
                                    if(type == 'book'){
                                      cubit.putReplayBookRoom(
                                          idDB: bookingItem!.idDB,
                                          isReplied: true,
                                          isAccepted: false,
                                          isWaiting: true,
                                        reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                      );
                                    } else if(type == 'change'){
                                      cubit.putReplayChange(
                                          isAccepted: false,
                                          idDB: changeItem!.idDB,
                                          reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                          isReplied: true
                                      );
                                    }else{
                                      cubit.putReplayExit(
                                          isAccepted: false,
                                          idDB: leftItem!.idDB,
                                          reply: managerController.text.isEmpty? 'لا يوجد' : managerController.text,
                                          isReplied: true
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


