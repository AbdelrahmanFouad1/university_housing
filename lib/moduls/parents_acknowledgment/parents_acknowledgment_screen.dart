import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/cubit.dart';
import 'package:university_housing/shard/cubit/states.dart';
import 'package:university_housing/shard/style/color.dart';

class ParentsAcknowledgmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (create)=>AppCubit(),
     child: BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: backGround,
            appBar: defaultAppBar(context: context),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 550.0,
                  child: Column(
                    children: [
                      defaultTitleBox(img: 'assets/images/family.svg',title: 'أقرارات ولى الأمر'),
                      const SizedBox(height: 30.0,),
                      Container(
                        width: double.infinity,
                        height: 40.0,
                        margin: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'سبب الأقرار',
                            contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14.0,),
                      Builder(
                          builder: (context) {
                            if(cubit.familyImage != null){
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 42.0),
                                child: Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 280.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0,),
                                              image: DecorationImage(
                                                image:FileImage(cubit.familyImage!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 288.0,
                                          margin: const EdgeInsets.symmetric(horizontal: 14.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.0),
                                            border: Border.all(color: Colors.grey, width: 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 3.0),
                                      child: IconButton(
                                        onPressed: () {
                                          cubit.removePikeImage();
                                        },
                                        icon: const CircleAvatar(
                                          radius: 20.0,
                                          child: Icon(
                                            Icons.close,
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }else{
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 72.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  margin: const EdgeInsets.symmetric(horizontal: 14.0),
                                  child: TextFormField(
                                    onTap: (){
                                      cubit.pikeFamilyImage();
                                    },
                                    decoration:  InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          cubit.pikeFamilyImage();
                                        },
                                        icon: SvgPicture.asset(
                                          'assets/images/upload.svg',
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      hintText: 'صورة الأقرار',
                                      border: const OutlineInputBorder(),
                                      contentPadding:const EdgeInsets.symmetric(horizontal:14.0),
                                    ),
                                  ),
                                ),
                              );
                            }
                          }
                      ),
                      Spacer(),
                      defaultButton(
                        function: (){},
                        text: 'تقديم الطلب',
                        width: double.infinity,
                        height: 47.0,
                        btnColor: mainColors,
                        marginSize: EdgeInsets.symmetric(horizontal: 14.0),
                        //
                      ),
                    ],
                  ),
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