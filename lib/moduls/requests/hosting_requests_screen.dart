import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'dart:ui' as ui;

class HostingRequestsScreen extends StatelessWidget {

  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection:  ui.TextDirection.rtl,
            child: Scaffold(
              backgroundColor: backGround,
              appBar: defaultAppBar(context: context),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'تقديم طلب الاستضافه',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: mainColors,
                          ),
                        ),
                        const SizedBox(height: 42.0,),
                        Text(
                          'تعليمات الاستضافه',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: mainColors,
                          ),
                        ),
                        Text(
                          'يمكن للطالب استضافه صديق له او قريب ليوم او اكثر ويدفع رسوم بمقدار 4% من ايجار الغرفه علي كل يوم استضافه ',
                          style: TextStyle(
                            fontSize: 11.0,
                            color: mainColors,
                          ),
                        ),
                        const SizedBox(height: 35.0,),
                        Row(
                          children: [
                            Text(
                              'صله الضيف بالطالب',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: mainColors,
                              ),
                            ),
                            const SizedBox(width: 10.0,),
                            SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: Radio(
                                value: true,
                                groupValue: cubit.isStudent,
                                activeColor: mainColors,
                                onChanged: (value) {
                                  cubit.changeIsStudent(true);
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0,),
                            Text(
                              'طالب',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: mainColors,
                              ),
                            ),
                            const SizedBox(width: 30.0,),
                            SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: Radio(
                                value: false,
                                groupValue: cubit.isStudent,
                                activeColor: mainColors,
                                onChanged: (value) {
                                  cubit.changeIsStudent(false);
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0,),
                            Text(
                              'قريب',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: mainColors,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 19.0,),
                        Container(
                          width: double.infinity,
                          height: 40.0,
                          margin: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'اسم الطالب',
                              contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14.0,),
                        Builder(
                          builder: (context) {
                           if(cubit.isStudent){
                             return Container(
                               width: double.infinity,
                               height: 40.0,
                               margin: const EdgeInsets.symmetric(horizontal: 14.0),
                               child: TextFormField(
                                 decoration: const InputDecoration(
                                   border: OutlineInputBorder(),
                                   hintText: 'رقم الطالب',
                                   contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                                   hintStyle: TextStyle(
                                     fontSize: 15.0,
                                     color: Colors.grey,
                                   ),
                                 ),
                               ),
                             );
                           }
                             return Container(
                               width: double.infinity,
                               height: 40.0,
                               margin: const EdgeInsets.symmetric(horizontal: 14.0),
                               child: TextFormField(
                                 decoration: const InputDecoration(
                                   border: OutlineInputBorder(),
                                   hintText: 'صله القرابه',
                                   contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                                   hintStyle: TextStyle(
                                     fontSize: 15.0,
                                     color: Colors.grey,
                                   ),
                                 ),
                               ),
                             );

                          }
                        ),
                        const SizedBox(height: 14.0,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  controller: dateController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'تاريخ الاقامه',
                                    contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  onTap:(){
                                    showDatePicker(context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2030-12-12')).then((value){
                                      dateController.text = DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 14.0,),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'عدد ايام الاقامه',
                                    contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14.0,),
                        Builder(
                          builder: (context) {
                            if(cubit.idImage != null){
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
                                            height: 180.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0,),
                                              image: DecorationImage(
                                                image:FileImage(cubit.idImage!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 188.0,
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
                                          cubit.removePikePostImage();
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
                                  width: cubit.isStudent? 0.0 : double.infinity,
                                  height:cubit.isStudent? 0.0 : 40.0,
                                  margin: const EdgeInsets.symmetric(horizontal: 14.0),
                                  child: TextFormField(
                                    onTap: (){
                                      cubit.pikeIdImage();
                                    },
                                    decoration:  InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          cubit.pikeIdImage();
                                        },
                                        icon: SvgPicture.asset(
                                          'assets/images/upload.svg',
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      hintText: 'صورة بطاقه الضيف',
                                      border: const OutlineInputBorder(),
                                      contentPadding:const EdgeInsets.symmetric(horizontal:14.0),
                                    ),
                                  ),
                                ),
                              );
                            }
                          }
                        ),
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
