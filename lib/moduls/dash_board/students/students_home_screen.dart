import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_complaints/dash_complaints_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_family/dash_family_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_hosts/dash_hosts_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_queries/dash_queries_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_rooms_requestes/dash_rooms_requests_screen.dart';
import 'package:university_housing/moduls/dash_board/students/students_screen.dart';
import 'package:university_housing/moduls/dash_board/students/waiting_students_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';

import 'add_student_screen.dart';
class StudentsHomeScreen extends StatelessWidget {
  const StudentsHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit,DashBoardStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = DashBoardCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: dashAppBar(title: 'إدارة الساكنين', context: context),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Builder(
                    builder: (context){
                      if(state is GetAllOrdersLoadingStates){
                        return Container(
                            width:double.infinity,
                            height: 300.0,
                            child: Center(child: CircularProgressIndicator()));
                      }else{
                        return Column(
                          children: [
                            SizedBox(height: 20.0,),
                            InkWell(
                              onTap: (){
                                cubit.getAllUsers(
                                    query: {
                                      if(cubit.termNum == 1)
                                        'firstTerm':true,
                                      if(cubit.termNum == 2)
                                        'secondTerm':true,
                                      if(cubit.termNum == 3)
                                        'thirdTerm':true,
                                      if(cubit.isStudentKind)
                                        'isStudent':true,
                                      if(cubit.isStudentKind == false)
                                        'isEmployee':true,
                                    }
                                );
                                navigateTo(context, StudentsScreen());
                              },
                              child: defaultDashBoardTitleBox(
                                  title: 'مقيدين بالسكن',
                                  svg: true,
                                  svgImage: 'assets/images/check.svg'
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            InkWell(
                              onTap: (){
                                cubit.getAllUsers(
                                    query: {
                                      'firstTerm':false,
                                      'secondTerm':false,
                                      'thirdTerm':false,
                                      if(cubit.waitingIsStudentKind)
                                        'isStudent':true,
                                      if(cubit.waitingIsStudentKind == false)
                                        'isEmployee':true,
                                    }
                                );
                                navigateTo(context, WaitingStudentsScreen());
                              },
                              child: defaultDashBoardTitleBox(
                                  title: 'غير مقيدين بالسكن',
                                  svg: true,
                                  svgImage: 'assets/images/warn.svg'
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            InkWell(
                              onTap: (){
                                navigateTo(context, AddStudent());
                              },
                              child: defaultDashBoardTitleBox(
                                svgImage:  'assets/images/follow.svg',
                                title: 'إضافة ساكن جديد',
                                svg: true,
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),

                ),
              ),
            ),
          );
        },
    );
  }
}
