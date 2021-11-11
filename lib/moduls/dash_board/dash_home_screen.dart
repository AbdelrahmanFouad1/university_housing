import 'package:flutter/material.dart';
import 'package:university_housing/moduls/dash_board/add_news/add_news_screen.dart';
import 'package:university_housing/moduls/dash_board/change_password/change_password_screen.dart';
import 'package:university_housing/moduls/dash_board/requests/requests_home_screen.dart';
import 'package:university_housing/moduls/dash_board/rooms/rooms_home_screen.dart';
import 'package:university_housing/moduls/dash_board/security/security_screen.dart';
import 'package:university_housing/moduls/dash_board/students/students_screen.dart';
import 'package:university_housing/moduls/login/login_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
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
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 80.0,
                        height: 80.0,
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'احمد سيد علي',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          '202076',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){
                    navigateTo(context, ChangePasswordScreen());
                  },
                  child: Text(
                    'تغيير كلمه المرور',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 12.0, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){
                    CacheHelper.removeData(key: 'token');
                    CacheHelper.removeData(key: 'isStudent');
                    CacheHelper.removeData(key: 'isSecurity');
                    CacheHelper.removeData(key: 'isHousingManager');
                    CacheHelper.removeData(key: 'isStudentAffairs');
                    CacheHelper.removeData(key: 'isresident');
                    navigateAndFinish(context, LoginScreen());
                  },
                  child: Text(
                    'تسجيل خروج',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.bold , color: Colors.red),
                  ),
                ),

                const SizedBox(
                  height: 22.0,
                ),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: separator,
                ),
                const SizedBox(
                  height: 22.0,
                ),

                InkWell(
                  onTap: (){
                    navigateTo(context, const RoomsHomeScreen());
                  },
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/home.png',
                      title: 'إداره الغرف'
                  ),
                ),
                const SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){
                    navigateTo(context, StudentsScreen());
                  },
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/team.png',
                      title: 'الساكنين'
                  ),
                ),
                const SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){
                    navigateTo(context, SecurityScreen());
                  },
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/security.png',
                      title: 'إداره الأمن'
                  ),
                ),
                const SizedBox(height: 12.0,),
                InkWell(
                  onTap: (){
                    navigateTo(context, const RequestsHomeScreen());
                  },
                  child: defaultDashBoardTitleBox(
                      img: 'assets/images/checklist.png',
                      title: 'طلبات الساكنين'
                  ),
                ),
                const SizedBox(height: 12.0,),
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
