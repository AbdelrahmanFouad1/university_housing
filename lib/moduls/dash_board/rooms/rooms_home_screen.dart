import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/moduls/dash_board/rooms/add_building.dart';
import 'package:university_housing/moduls/dash_board/rooms/add_room.dart';
import 'package:university_housing/moduls/dash_board/rooms/available_now.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';

class RoomsHomeScreen extends StatelessWidget {
 const RoomsHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit,DashBoardStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit =DashBoardCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(title: 'إدارة الغرف', context: context),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Builder(
                  builder: (context){
                    if (cubit.allRooms == null){
                      return const SizedBox(
                          width:double.infinity,
                          height: 500.0,
                          child: Center(child: CircularProgressIndicator()));
                    }else{
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'عدد الغرف المتاحة',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'عدد الغرف الغير متاحة',
                                  textAlign: TextAlign.center,
                                  style:Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${cubit.allRooms!.available}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${cubit.allRooms!.notAvailable}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20.0,),

                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'عدد غرف الطلبة',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'عدد غرف العاملين',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${cubit.allRooms!.numStudent}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${cubit.allRooms!.numEmployee}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30.0,),

                          Container(
                            width: double.infinity,
                            height:1.0,
                            color: separator,
                          ),

                          const SizedBox(height: 30.0,),
                          InkWell(
                            onTap: (){
                              cubit.getAvailableNowData();
                              navigateTo(context, AvailableNow());
                            },
                            child: defaultDashBoardTitleBox(
                                img: 'assets/images/verification.png',
                                title: 'الموجود حاليا'
                            ),
                          ),
                          const SizedBox(height: 12.0,),
                          InkWell(
                            onTap: (){
                              navigateTo(context, AddBuilding());
                            },
                            child: defaultDashBoardTitleBox(
                                img: 'assets/images/home.png',
                                title: 'إضافة مبنى'
                            ),
                          ),
                          const SizedBox(height: 12.0,),
                          InkWell(
                            onTap: (){
                              navigateTo(context, AddRoom());
                            },
                            child: defaultDashBoardTitleBox(
                                img: 'assets/images/room.png',
                                title: 'إضافة غرفة'
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
