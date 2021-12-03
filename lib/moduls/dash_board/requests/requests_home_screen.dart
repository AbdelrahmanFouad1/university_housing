import 'package:flutter/material.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_complaints/dash_complaints_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_family/dash_family_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_hosts/dash_hosts_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_queries/dash_queries_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_rooms_requestes/dash_rooms_requests_screen.dart';
import 'package:university_housing/moduls/dash_board/rooms/rooms_home_screen.dart';
import 'package:university_housing/moduls/dash_board/security/security_screen.dart';
import 'package:university_housing/moduls/dash_board/students/students_screen.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
class RequestsHomeScreen extends StatelessWidget {
  const RequestsHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: dashAppBar(title: 'طلبات الساكنين', context: context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){
                    navigateTo(context, DashRoomsRequestsScreen());
                  },
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/home.png',
                      title: 'طلبات التسكين'
                  ),
                ),
                SizedBox(height: 12.0,),
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
                SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){
                    navigateTo(context, DashQueriesScreen());
                  },
                  child: defaultDashBoardTitleBox(
                      svgImage:  'assets/images/research.svg',
                      title: 'الاستعلامات',
                    svg: true,
                  ),
                ),
                SizedBox(height: 12.0,),
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
                SizedBox(height: 12.0,),
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
            ),
          ),
        ),
      ),
    );
  }
}
