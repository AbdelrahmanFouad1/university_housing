import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class StudentRateDetailsScreen extends StatelessWidget {
  const StudentRateDetailsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (create)=> AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 12.0,
                title: Text(
                  'المزيد',
                  style: Theme.of(context).textTheme.headline6,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(0.0),
                      width: 34.0,
                      child: IconButton(
                        padding:EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                          'assets/images/back_arrow.svg',
                          width: 18.0,
                          height: 18.0,
                          color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 550.0,
                        decoration: BoxDecoration(
                          color: evaluation,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Builder(
                                    builder: (context){
                                      if(cubit.profileImage == null){
                                        return const CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage: NetworkImage(
                                              'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                                        );
                                      }else{
                                        return CircleAvatar(
                                          radius: 30.0,
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
                                  const SizedBox(width: 10.0,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'عبدالرحمن محمد فؤاد',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: mainColors,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '42018122',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: mainColors,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: double.infinity,
                                height: 400.0,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Text(
                                    '«إن هذا الكتاب حسن الطوية فهو ينبهك منذ البداية إني لا أستهدف من ورائه مقصداً إلا ما ينفع العام والخاص، ولم أرد به خدمتك أو إعلاء ذكرى فإن مواهبي تعجز عن تحقيق مثل هذه الغاية... لقد خصصته لمنفعة الخاصة من أهلي وأصدقائي حتى إذا ما افتقدوني استطاعوا أن يجدوا فيه صورة لطباعي وميولي، فيسترجعوا ذكراي التي خلفتها لهم حيّة كاملة ولو كان هدفي أن أظفر بإعجاب العالم لعملت على إطراء نفسي وإظهارها بطريقة منمّقة ولكني أريد أن أعرف في أبسط صوري الطبيعية العادية دون تكلف ولا تصنع لأني أنا الذي أصوّر نفسي لهذا تبرز مساوئي واضحة وسجيتي على طبيعتها ما سمح لي العرف بذلك...يتضح في مقدمة كتاب ابن الجوزي صيد الخاطر إنما كتب هذه الفصول ليسجّل فيها خواطره التي أثارتها تجاربه وعلاقاته مع الأشياء. وهذه الخواطر ليست وليدة البحث والدرس العميق وإنما هي خواطر آنية تولد وتزول سريعاً إنْ لم تُدوّن لهذا سعى إلى تدوينها في هذا الكتاب وسمّاه (صيد الخاطر) كما سمّى فيما بعد أحمد أمين أشهر كتاب في المقالة الأدبية في الأدب العربي الحديث (فيض الخاطر) وهذا يعني أنَّ مفهوم ابن الجوزي لفصول كتابه قريب من مفهوم مونتاني لفصوله فهو جسّد فيها خواطره معلّقاً على هذا القول أو ذاك ومصوراً تجارب نفسه وعيوبها وما توصل إليه من أفكار تتعلق بالدين والحياة والمجتمع. »',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: mainColors,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
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
