import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_complaints/dash_complaints_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_family/dash_family_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_hosts/dash_hosts_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_queries/dash_queries_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_rooms_requestes/dash_rooms_requests_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
class RequestsHomeScreen extends StatelessWidget {
  const RequestsHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit,DashBoardStates>(
        listener: (context,state){},
        builder: (context,state){
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: dashAppBar(title: 'طلبات الساكنين', context: context),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Builder(
                    builder: (context){
                      if(state is GetAllOrdersLoadingStates){
                        return const SizedBox(
                            width:double.infinity,
                            height: 300.0,
                            child: Center(child: CircularProgressIndicator()));
                      }else{
                        return Column(
                          children: [
                            const SizedBox(height: 12.0,),
                            InkWell(
                              onTap: (){
                                navigateTo(context, const DashRoomsRequestsScreen());
                              },
                              child: defaultDashBoardTitleBox(
                                  img: 'assets/images/home.png',
                                  title: 'طلبات التسكين'
                              ),
                            ),
                            const SizedBox(height: 12.0,),
                            InkWell(
                              onTap: (){
                                navigateTo(context, DashComplimentsScreen());
                              },
                              child: defaultDashBoardTitleBox(
                                  title: 'الشكوى',
                                  svg: true,
                                  svgImage: 'assets/images/review.svg'
                              ),
                            ),
                            const SizedBox(height: 12.0,),
                            InkWell(
                              onTap: (){
                                navigateTo(context, const DashQueriesScreen());
                              },
                              child: defaultDashBoardTitleBox(
                                svgImage:  'assets/images/research.svg',
                                title: 'الاستعلامات',
                                svg: true,
                              ),
                            ),
                            const SizedBox(height: 12.0,),
                            InkWell(
                              onTap: (){
                                navigateTo(context, DashHostsScreen());
                              },
                              child: defaultDashBoardTitleBox(
                                  svgImage: 'assets/images/follow.svg',
                                  title: 'طلبات الإستضافة',
                                  svg: true
                              ),
                            ),
                            const SizedBox(height: 12.0,),
                            InkWell(
                              onTap: (){
                                navigateTo(context, DashFamilyScreen());
                              },
                              child: defaultDashBoardTitleBox(
                                svgImage:  'assets/images/family.svg',
                                title: 'أقرارات ولي الأمر',
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
