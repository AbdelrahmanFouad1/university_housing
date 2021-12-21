import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
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

class DashHostsDetailsScreen extends StatelessWidget {

  DashHostsDetailsScreen({
    Key? key,
    required this.guestItem,
  }): super(key: key);

  GuestOrders? guestItem;

  var managerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {
        if(state is PutReplayHostingLoadingStates){
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
        if(guestItem!.reply != 'empty' && guestItem!.reply.isEmpty != true){
          managerController.text = guestItem!.reply;
        }
        DateTime tempDate = DateFormat("yyyy-MM-dd").parse(guestItem!.createdAt);
        String date = tempDate.toString().substring(0, 10);
        var cubit = DashBoardCubit.get(context);

        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'الإستضافة',
              context: context,
              action: Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
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
              physics: const BouncingScrollPhysics(),
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
                                  guestItem!.idDB.toString(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
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
                                    guestItem!.user!.username,
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
                                  guestItem!.user!.id.toString(),
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
                                  guestItem!.user!.roomnumber.toString(),
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
                                    guestItem!.user!.buildingName,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          //requestDate
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

                          //request
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'الطلب',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),

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
                                        child: SelectableText(
                                            guestItem!.NameofGuest,
                                          style: Theme.of(context).textTheme.bodyText1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),

                                  // relation
                                  if(guestItem!.isStudent == false)
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
                                        child: SelectableText(
                                            guestItem!.relation,
                                          style: Theme.of(context).textTheme.bodyText1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),

                                  if(guestItem!.isStudent)
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
                                            guestItem!.guestId,
                                            style: Theme.of(context).textTheme.bodyText1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),


                                  const SizedBox(
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
                                        child: SelectableText(
                                            guestItem!.HostDate,
                                          style: Theme.of(context).textTheme.bodyText1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
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
                                        child: SelectableText(
                                          guestItem!.DurationOfHosting.toString(),
                                          style: Theme.of(context).textTheme.bodyText1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),

                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 180.0,
                                        padding: const EdgeInsetsDirectional.all(4.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0,),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: guestItem!.guestIsIDCard,
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) => const Center(child: const CircularProgressIndicator()),
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
                            ),
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
                                  function: () {
                                    cubit.putHosting(
                                      idDB: guestItem!.idDB,
                                      isReplied: true,
                                      isAccepted: true,
                                      reply: managerController.text.isEmpty ? 'لا يوجد' : managerController.text,
                                    );
                                  },
                                  text: 'اوافق',
                                  btnColor: Colors.green,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: defaultButton(
                                  function: () {
                                    cubit.putHosting(
                                      idDB: guestItem!.idDB,
                                      isReplied: true,
                                      isAccepted: false,
                                      reply: managerController.text.isEmpty ? 'لا يوجد' : managerController.text,
                                    );
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
