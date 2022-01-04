import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/get_all_users_model.dart';
import 'package:university_housing/moduls/dash_board/rooms/available_now.dart';
import 'package:university_housing/moduls/dash_board/students/students_screen.dart';
import 'package:university_housing/moduls/dash_board/students/widget/student_item.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class WaitingStudentsScreen extends StatelessWidget {
  WaitingStudentsScreen({Key? key}) : super(key: key);

  final List<AlertDialogModel> _termList = [
    AlertDialogModel(
      text: "الأول",
      index: 0,
    ),
    AlertDialogModel(
      text: "الثاني",
      index: 1,
    ),
    AlertDialogModel(
      text: "الثالث",
      index: 2,
    ),
  ];

  final List<AlertDialogModel> _levelList = [
    AlertDialogModel(
      text: "مميز",
      index: 0,
    ),
    AlertDialogModel(
      text: "عادي",
      index: 1,
    ),
  ];

  final List<AlertDialogModel> _jobList = [
    AlertDialogModel(
      text: "طلاب",
      index: 0,
    ),
    AlertDialogModel(
      text: "عاملين",
      index: 1,
    ),
  ];


  final List<AlertDialogModel> _creditList = [
    AlertDialogModel(
      text: "تم الدفع",
      index: 0,
    ),
    AlertDialogModel(
      text: "لم يتم الدفع",
      index: 1,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {
        if(state is PutStudentLoadingStates || state is DeleteStudentLoadingStates){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }else if(state is PutStudentSuccessStates ){
          Navigator.pop(context);
          showToast(message: 'تم التعديل بنجاح', state: ToastStates.SUCCESS);
        }else if(state is DeleteStudentSuccess){
          Navigator.pop(context);
          showToast(message: 'تم الحذف بنجاح', state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'الساكنين',
              context: context,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultDashBoardTitleBox(
                        svgImage:  'assets/images/warn.svg',
                        svg: true,
                        title: 'غير مقيدين بالسكن'),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'النوع :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Radio(
                                    value: true,
                                    groupValue: cubit.waitingIsStudentKind,
                                    activeColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    focusColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    onChanged: (value) {
                                      cubit.changeWaitingPeopleType(true);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'طلاب',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Radio(
                                    value: false,
                                    groupValue: cubit.waitingIsStudentKind,
                                    activeColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    focusColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    hoverColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    onChanged: (value) {
                                      cubit.changeWaitingPeopleType(false);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'عاملين',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: separator,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    Builder(
                        builder: (context){
                          if(state is GetAllUsersLoadingStates){
                            return const SizedBox(
                                width:double.infinity,
                                height: 300.0,
                                child: Center(child: CircularProgressIndicator()));
                          }else if (cubit.allUsers!.users.isEmpty){
                            return Text(
                              'لا يوجد بيانات حاليا !!',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            );
                          }else{
                            return ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => StudentWaitingItem(
                                  item:  cubit.allUsers!.users[index],
                                  level: _levelList,
                                  credit: _creditList,
                                  term: _termList,
                                  job: _jobList,
                                  index: index
                              ),
                              separatorBuilder: (context, index) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 10.0),
                                width: double.infinity,
                                height: 1.0,
                                color: separator,
                              ),
                              itemCount: cubit.allUsers!.users.length,
                            );
                          }
                        }),

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

