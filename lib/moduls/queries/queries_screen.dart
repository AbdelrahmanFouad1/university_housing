import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/main.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/moduls/queries/queries_details_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/cubit.dart';
import 'package:university_housing/shard/cubit/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

class QueriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (create)=> AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder:  (context,state){
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: defaultAppBar(context: context),
              backgroundColor: backGround,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      defaultTitleBox(
                        img: 'assets/images/research.svg',
                        title: 'الاستعلامات',
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          'اكتب طلب الاستعلام',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: mainColors,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Container(
                        height: 140.0,
                        child: whiteBoard(),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: defaultButton(
                            function: (){},
                            text: 'تقديم الطلب',
                            radius: 8.0,
                            height: 47,
                            btnColor: mainColors,
                            width: double.infinity
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          'الاستعلامات السابقة',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: mainColors,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(3,3), // changes position of shadow
                                  ),
                                ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Builder(
                                        builder: (context){
                                          if(cubit.profileImage == null){
                                            return CircleAvatar(
                                              radius: 25.0,
                                              backgroundImage: NetworkImage(
                                                  'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                                            );
                                          }else{
                                            return CircleAvatar(
                                              radius: 25.0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                    150.0,
                                                  ),
                                                  image: DecorationImage(
                                                    image:
                                                    FileImage(cubit.profileImage!),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      SizedBox(width: 10.0,),
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
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsetsDirectional.all(8.0),
                                        child: Icon(
                                          Icons.check_circle,
                                          color: mainColors,
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0,),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsetsDirectional.only(start: 8.0,end: 8.0),
                                    child: Text(
                                      '«إن هذا الكتاب حسن الطوية فهو ينبهك منذ البداية إني لا أستهدف من ورائه مقصداً إلا ما ينفع العام والخاص، ولم أرد به خدمتك أو إعلاء ذكرى فإن مواهبي تعجز عن تحقيق مثل هذه الغاية... لقد خصصته لمنفعة الخاصة من أهلي وأصدقائي حتى إذا ما افتقدوني استطاعوا أن يجدوا فيه صورة لطباعي وميولي، فيسترجعوا ذكراي التي خلفتها لهم حيّة كاملة ولو كان هدفي أن أظفر بإعجاب العالم لعملت على إطراء نفسي وإظهارها بطريقة منمّقة ولكني أريد أن أعرف في أبسط صوري الطبيعية العادية دون تكلف ولا تصنع لأني أنا الذي أصوّر نفسي لهذا تبرز مساوئي واضحة وسجيتي على طبيعتها ما سمح لي العرف بذلك...»',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: mainColors,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(
                                    onTap: (){
                                      navigateTo(context, QueriesDetailsScreen());
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsetsDirectional.only(end: 5.0),
                                      child: Text(
                                        'المزيد',
                                        style: TextStyle(
                                          color: mainColors,
                                          fontSize: 14.0,
                                          decoration:TextDecoration.underline,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(height: 10.0,),
                        itemCount: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}









// buildEnquiry (
// context,
// height: 122.0,
// body: Expanded(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// height: 122.0,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Text(
// 'سؤال ؟',
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.w800,
// ),
// ),
// const SizedBox(height: 6.0,),
// Text(
// 'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص.',
// maxLines: 3,
// overflow: TextOverflow.ellipsis,
// style: Theme.of(context).textTheme.caption!.copyWith(
// height: 1.4,
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// state: StatusStates.ACCEPT,
// ),