import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/get_all_users_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';

class AddFinesScreen extends StatelessWidget {

  AddFinesScreen({Key? key, required this.item}) : super(key: key);
  Users item;

  var reasonController = TextEditingController();
  var costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {
        if(state is postFinesLoadingStates ){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }else if(state is GetAllUsersSuccessStates ){
          Navigator.pop(context);
          showToast(message: 'تمت الأضافة بنجاح', state: ToastStates.SUCCESS);
        }else if(state is postFinesErrorStates){
          Navigator.pop(context);
        }

      },
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'إضافة غرامه',
              context: context,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                      smallDashBoardTitleBox(
                          svgImage:  'assets/images/ticket.svg',
                          svg: true,
                          title: 'إضافة غرامه'),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [

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
                                child: Text(
                                  item.username,
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
                                child: Text(
                                  item.id.toString(),
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
                                child: Text(
                                  item.buildingName,
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
                                child: Text(
                                  item.roomnumber.toString(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),


                          //cost
                          const SizedBox(
                            height: 20.0,
                          ),
                          dashTextFormField(
                              controller: costController,
                              type: TextInputType.number,
                              hint: 'المبلغ ...',
                              context: context,
                          ),

                          // reason
                          const SizedBox(
                            height: 20.0,
                          ),
                          whiteBoard(
                              context,
                              height: 200.0,
                              hint: 'سبب الغرامة ...',
                            controller: reasonController,
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),
                          defaultButton(
                              function: (){
                                if(costController.text.isEmpty){
                                  showToast(message: 'أدخل المبلغ', state: ToastStates.ERROR);
                                }else if (reasonController.text.isEmpty){
                                  showToast(message: 'أدخل سبب الغرامة', state: ToastStates.ERROR);
                                }else{
                                  cubit.postFines(
                                    isFine: true,
                                    fineValue: int.parse(costController.text),
                                    fineReason: reasonController.text,
                                    idDB: item.idDB,
                                  );
                                }
                              },
                              text: 'تأكيد الغرامة',
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


