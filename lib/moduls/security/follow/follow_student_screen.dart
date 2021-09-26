import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_housing/moduls/security/login/enter_student_login_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

class FollowStudentScreen extends StatelessWidget {
  const FollowStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backGround,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: backGround,
          elevation: 0.0,
          titleSpacing: 20.0,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              padding: const EdgeInsets.all(0.0),
              width: 30.0,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  IconBroken.Search,
                  color: mainColors,
                ),
                onPressed: () {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              width: 30.0,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: mainColors,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              width: 6.0,
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildSecurityCard(context),
                separatorBuilder:(context, index) => const SizedBox(height: 18.0,),
                itemCount: 8,
            ),
          ),
        ),
      ),
    );
  }
  Widget buildSecurityCard(context) => Column(
    children: [
      Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          color: containerFollowStudent,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                  ),
                  const SizedBox(width: 10.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'عبدالرحمن محمد فؤاد',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: mainColors,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '42018122',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: mainColors,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 12.0, end: 18.0,),
              child: Row(
                children: [
                  Text(
                    'توقيت الخروج',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: mainColors,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '1:07 PM',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: mainColors,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12.0,),
                  Text(
                    '1/8/2021',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: mainColors,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 12.0, end: 18.0, bottom: 8,),
              child: Row(
                children: [
                  Text(
                    'ملاحظات',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: mainColors,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'لا يوجد',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: mainColors,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            defaultButton2(
              function: () {
                navigateTo(context, EnterStudentLoginScreen());
              },
              text: 'ادخال موعد الوصول الى السكن',
              width: double.infinity,
              height: 32.0,
              btnColor: mainColors,
            ),
          ],
        ),
      )
    ],
  );
}
