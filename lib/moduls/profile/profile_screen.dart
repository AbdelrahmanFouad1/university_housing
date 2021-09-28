import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/moduls/profile/edit_profile_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/cubit.dart';
import 'package:university_housing/shard/cubit/states.dart';
import 'package:university_housing/shard/style/color.dart';

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
              backgroundColor: backGround,
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: backGround,
                  statusBarIconBrightness: Brightness.dark,
                ),
                automaticallyImplyLeading: false,
                backgroundColor: backGround,
                elevation: 0.0,
                titleSpacing: 12.0,
                actions: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    width: 34.0,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        navigateTo(context, EditProfileScreen());
                      },
                      icon: Icon(
                        Icons.settings,
                        color: mainColors,
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
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: mainColors,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height:2.0,),
                              Text(
                                '42018122',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: mainColors,
                                  fontWeight: FontWeight.bold,
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
                          Container(
                            width: double.infinity,
                            height: 140.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: mainColors,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 140.0,
                                  child: SvgPicture.asset(
                                    'assets/images/layer1.svg',
                                    alignment: AlignmentDirectional.centerEnd,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          SizedBox(height: 6.0,),
                                          Text(
                                            'انت الان مقيم في ',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white,

                                            ),
                                          ),
                                          Text(
                                            'غرفه  B',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            'الدور  الخامس',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            'عماره  الزهراء',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                        'assets/images/layer22.svg',
                                      width: 100.0,
                                      height: 92.0,
                                    ),
                                    const SizedBox(width: 22.0,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0,),
                          Container(
                            width: double.infinity,
                            child: Text(
                              'الغرامات',
                              style: TextStyle(
                                color: mainColors,
                                fontSize: 20.0,
                              ),
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
