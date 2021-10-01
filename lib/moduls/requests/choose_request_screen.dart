import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/fines/fines_screen.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/moduls/requests/change_room/change_room_screen.dart';
import 'package:university_housing/moduls/requests/hosting_requests_screen.dart';
import 'package:university_housing/moduls/requests/leaving_room_screen.dart';
import 'package:university_housing/moduls/requests/total_cost_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class ChooseRequestScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(context: context),
        backgroundColor: backGround,
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) =>
              orientation == Orientation.portrait
                  ? buildPortrait(context)
                  : buildLandScape(context),
        ),
      ),
    );
  }

  Widget buildPortrait(context) => Padding(
    padding: const EdgeInsets.all(19.0),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            child: defaultTiTleBoxColumn(
              img: 'assets/images/talk.svg',
              title: 'طلب تغيير الغرفه',
              height: 160.0,
              width: double.infinity,
            ),
            onTap: (){
              navigateTo(context,  ChangeRoomScreen());
            },
          ),
          const SizedBox(
            height: 32.0,
          ),
          InkWell(
            child: defaultTiTleBoxColumn(
              img: 'assets/images/follow.svg',
              title: 'طلبات الاستضافه',
              height: 160.0,
              width: double.infinity,
            ),
            onTap: (){
              navigateTo(context, HostingRequestsScreen());
            },
          ),
          const SizedBox(
            height: 32.0,
          ),
          InkWell(
            child: defaultTiTleBoxColumn(
              img: 'assets/images/leave.svg',
              title: 'طلب إخلاء السكن',
              height: 160.0,
              width: double.infinity,
            ),
            onTap: (){
              navigateTo(context, LeavingRoomScreen());
            },
          ),
          const SizedBox(
            height: 32.0,
          ),
          InkWell(
            child: defaultTiTleBoxColumn(
              img: 'assets/images/ticket.svg',
              title: 'المصاريف السكنية',
              height: 160.0,
              width: double.infinity,
            ),
            onTap: (){
              navigateTo(context, TotalCostScreen());
            },
          ),
        ],
      ),
    ),
  );

  Widget buildLandScape(context) => Padding(
    padding: const EdgeInsets.all(19.0),
    child: Center(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: defaultTiTleBoxColumn(
              img: 'assets/images/talk.svg',
              title: 'طلب تغيير الغرفه',
              height: 160.0,
            ),
          ),
          const SizedBox(width:  32.0,),
          Flexible(
            flex: 1,
            child: InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/follow.svg',
                title: 'طلبات الاستضافه',
                height: 160.0,
              ),
              onTap: (){
                navigateTo(context, HostingRequestsScreen());
              },
            ),
          ),
          const SizedBox(width:  32.0,),
          Flexible(
            flex: 1,
            child: InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/leave.svg',
                title: 'طلب إخلاء السكن',
                height: 160.0,
              ),
              onTap: (){
                navigateTo(context, LeavingRoomScreen());
              },
            ),
          ),
          const SizedBox(width:  32.0,),
          Flexible(
            flex: 1,
            child: InkWell(
              child: defaultTiTleBoxColumn(
                img: 'assets/images/ticket.svg',
                title: 'المصاريف السكنية',
                height: 160.0,
                  fontSize: 18.0,
              ),
              onTap: (){
                navigateTo(context, TotalCostScreen());
              },
            ),
          ),

        ],
      ),
    ),
  );
}
