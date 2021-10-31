import 'package:flutter/material.dart';
import 'package:university_housing/moduls/dash_board/add_news/add_news_screen.dart';
import 'package:university_housing/moduls/dash_board/rooms/rooms_home_screen.dart';
import 'package:university_housing/moduls/dash_board/students/students_screen.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
class DashHomeScreen extends StatelessWidget {
  const DashHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: dashAppBar(title: 'إدارة الإسكان الجامعى', context: context,pop: false),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){
                    navigateTo(context, RoomsHomeScreen());
                  },
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/home.png',
                      title: 'إداره الغرف'
                  ),
                ),
                SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){
                    navigateTo(context, StudentsScreen());
                  },
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/team.png',
                      title: 'الساكنين'
                  ),
                ),
                SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){},
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/security.png',
                      title: 'إداره الأمن'
                  ),
                ),
                SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){},
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/checklist.png',
                      title: 'طلبات الطلاب'
                  ),
                ),
                SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){
                    navigateTo(context, AddNewsScreen());
                  },
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/newspaper.png',
                      title: 'أخبار المعهد'
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
