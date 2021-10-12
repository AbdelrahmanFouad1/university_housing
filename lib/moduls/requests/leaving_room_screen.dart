import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/fines/fines_screen.dart';
import 'package:university_housing/moduls/requests/success_leaving_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';



class LeavingRoomScreen extends StatelessWidget {
  const LeavingRoomScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => AppCubit() ,
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context , state){},
        builder: (context,state){
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 12.0,
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        children: [
                          Builder(
                            builder: (context){
                              if(cubit.profileImage == null){
                                return const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                                );
                              }else{
                                return CircleAvatar(
                                  radius: 40,
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
                          const SizedBox(width: 12.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'عبدالرحمن محمد فؤاد',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height:2.0,),
                              Text(
                                '42018122',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          roomBox(),
                          const SizedBox(height: 10.0,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/images/warning.svg',
                            width: 20.0,
                            height: 20.0,
                          ),
                          const SizedBox(width: 5.0,),
                          Text(
                            'تحذير',
                            style: TextStyle(
                              color: warning,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height:4.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        width: double.infinity,
                        height:1.0,
                        color: warning,
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SvgPicture.asset(
                              'assets/images/dot.svg',
                              width: 14.0,
                              height: 14.0,
                            ),
                          ),
                          const SizedBox(width: 6.0,),
                          Expanded(
                            child: Text(
                              'يجب مراعاه ان في حاله إخلاء السكن والرغبه في العوده اليه مره أخرى , فعليك اتمام جميع الأجرائات السكنيه من جديد',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height:20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children:[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: SvgPicture.asset(
                                  'assets/images/dot.svg',
                                  width: 14.0,
                                  height: 14.0,
                                ),
                              ),
                              const SizedBox(width: 6.0,),
                              Expanded(
                                child: Text(
                                  'في حاله وجود غرامات ماليه , يتم خصمها من التأمين ',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: InkWell(
                              onTap: (){
                                navigateTo(context, const FinesScreen());
                              },
                              child: Text(
                                'تفاصيل الغرامات',
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  height: 1.5,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height: 50.0,),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: defaultButton(
                        text: 'تأكيد اخلاء السكن',
                        btnColor: warning,
                        function: (){
                          navigateTo(context,SuccessLeavingScreen());
                        },
                        width: double.infinity
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
