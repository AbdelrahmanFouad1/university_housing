import 'package:flutter/material.dart';
import 'package:university_housing/moduls/dash_board/rooms/add_building.dart';
import 'package:university_housing/moduls/dash_board/rooms/add_room.dart';
import 'package:university_housing/moduls/dash_board/rooms/available_now.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class RoomsHomeScreen extends StatelessWidget {
 const RoomsHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: dashAppBar(title: 'إدارة الغرف', context: context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                        '30',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '12',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.0,),

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
                        '20',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '10',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.0,),

                Container(
                  width: double.infinity,
                  height:1.0,
                  color: separator,
                ),

                SizedBox(height: 30.0,),
                InkWell(
                  onTap: (){
                    navigateTo(context, AvailableNow());
                  },
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/verification.png',
                      title: 'الموجود حاليا'
                  ),
                ),
                SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){
                    navigateTo(context, AddBuilding());
                  },
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/home.png',
                      title: 'إضافة مبنى'
                  ),
                ),
                SizedBox(height: 12.0,),
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
            ),
          ),
        ),
      ),
    );
  }
}
