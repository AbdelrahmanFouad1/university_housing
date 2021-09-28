import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/profile/student_rate/student_rate_details_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/cubit.dart';
import 'package:university_housing/shard/cubit/states.dart';
import 'package:university_housing/shard/style/color.dart';

class StudentRateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: backGround,
                  statusBarIconBrightness: Brightness.dark,
                ),
                automaticallyImplyLeading: false,
                backgroundColor: backGround,
                elevation: 0.0,
                titleSpacing: 12.0,
                title: Text(
                  'تقييم الطلاب',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: mainColors,
                  ),
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body:SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          'اضف تقييمك',
                          style: TextStyle(
                            color: mainColors,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          whiteBoard(
                            height: 130.0,
                            maxLine: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: defaultButton(
                                btnColor: mainColors,
                                text: 'أضف',
                                fontSize: 16.0,
                                width: 80.0,
                                height: 30.0,
                                function: (){}
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50.0,),
                      Container(
                        height: 200.0,
                        color: backGround,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder:(context,index)=>buildEvaluationItem(cubit,context),
                          separatorBuilder:(context,index)=>SizedBox(width: 8.0,),
                          itemCount: 10 ,
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


Widget buildEvaluationItem(var cubit,context)=>Stack(
  children: [
    Container(
      width: 300.0,
      height: 180.0,
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
              ],
            ),
          ),
          Container(
            width: 280.0,
            child: Text(
              '«إن هذا الكتاب حسن الطوية فهو ينبهك منذ البداية إني لا أستهدف من ورائه مقصداً إلا ما ينفع العام والخاص، ولم أرد به خدمتك أو إعلاء ذكرى فإن مواهبي تعجز عن تحقيق مثل هذه الغاية... لقد خصصته لمنفعة الخاصة من أهلي وأصدقائي حتى إذا ما افتقدوني استطاعوا أن يجدوا فيه صورة لطباعي وميولي، فيسترجعوا ذكراي التي خلفتها لهم حيّة كاملة ولو كان هدفي أن أظفر بإعجاب العالم لعملت على إطراء نفسي وإظهارها بطريقة منمّقة ولكني أريد أن أعرف في أبسط صوري الطبيعية العادية دون تكلف ولا تصنع لأني أنا الذي أصوّر نفسي لهذا تبرز مساوئي واضحة وسجيتي على طبيعتها ما سمح لي العرف بذلك...»',
              style: TextStyle(
                fontSize: 12.0,
                color: mainColors,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              navigateTo(context, StudentRateDetailsScreen());
            },
            child: Container(
              width: 280.0,
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
);
