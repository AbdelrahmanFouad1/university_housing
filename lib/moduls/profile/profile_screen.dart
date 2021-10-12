import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/moduls/profile/edit_profile_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);


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
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    width: 34.0,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        navigateTo(context, const EditProfileScreen());
                      },
                      icon: Icon(
                        Icons.settings,
                          color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                      ),
                    ),
                  ),
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
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Builder(
                            builder: (context){
                              if(cubit.profileImage == null){
                                return const CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                                );
                              }else{
                                return CircleAvatar(
                                  radius: 60,
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
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height:2.0,),
                              Text(
                                '42018122',
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          roomBox(),
                          const SizedBox(height: 20.0,),
                          Container(
                            width: double.infinity,
                            child: Text(
                              'الغرامات',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          buildFinesBox(context,fontsize1: 14.0, fontsize2: 18.0),
                        ],
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
