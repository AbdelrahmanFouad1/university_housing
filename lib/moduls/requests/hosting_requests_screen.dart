import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';


class HostingRequestsScreen extends StatelessWidget {

  var studentNameController = TextEditingController();
  var studentIdController = TextEditingController();
  var studentDateController = TextEditingController();
  var studentNumOfDayController = TextEditingController();

  var guestNameController = TextEditingController();
  var guestRelationController = TextEditingController();
  var guestDateController = TextEditingController();
  var guestNumOfDayController = TextEditingController();

  HostingRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {
        if(state is PostGuestLoadingStates){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }
        if(state is PostGuestSuccessStates) {
          Navigator.pop(context);
          studentNameController.text = '';
          studentIdController.text = '';
          studentDateController.text = '';
          studentNumOfDayController.text = '';
          guestNameController.text = '';
          guestRelationController.text = '';
          guestDateController.text = '';
          guestNumOfDayController.text = '';
          AppCubit.get(context).removePikePostImage();
        }else if(state is PostGuestErrorStates){
          Navigator.pop(context);
          showToast(message: 'لم يتم تقديم الطلب, الرجاء المحاولة في وقت لاحق', state: ToastStates.ERROR);
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection:  ui.TextDirection.rtl,
          child: Scaffold(
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
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 42.0,),
                      Text(
                        'تعليمات الاستضافه',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        'يمكن للطالب استضافه صديق له او قريب ليوم او اكثر ويدفع رسوم بمقدار 4% من ايجار الغرفه علي كل يوم استضافه ',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 10.0,
                        ),
                      ),
                      const SizedBox(height: 35.0,),
                      Row(
                        children: [
                          Text(
                            'صله الضيف بالطالب',
                              style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(width: 10.0,),
                          SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: Radio(
                              value: true,
                              groupValue: cubit.isStudent,
                              activeColor: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                              focusColor: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                              onChanged: (value) {
                                cubit.changeIsStudent(true);
                              },
                            ),
                          ),
                          const SizedBox(width: 8.0,),
                          Text(
                            'طالب',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(width: 30.0,),
                          SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: Radio(
                              value: false,
                              groupValue: cubit.isStudent,
                              activeColor: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                              focusColor: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                              hoverColor: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                              onChanged: (value) {
                                cubit.changeIsStudent(false);
                              },
                            ),
                          ),
                          const SizedBox(width: 8.0,),
                          Text(
                            'قريب',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0,),
                      Builder(
                        builder: (context) {
                         if(cubit.isStudent){
                           return Column(
                             children: [
                               Container(
                                 width: double.infinity,
                                 height: 40.0,
                                 margin: const EdgeInsets.symmetric(horizontal: 14.0),
                                 child: TextFormField(
                                   controller: studentNameController,
                                   decoration: const InputDecoration(
                                     border: OutlineInputBorder(),
                                     hintText: 'اسم الطالب',
                                     contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                                     hintStyle: TextStyle(
                                       fontSize: 15.0,
                                       color: Colors.grey,
                                     ),
                                     enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(
                                         color: Colors.grey,
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               const SizedBox(height: 14.0,),
                               Container(
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
                                     enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(
                                         color: Colors.grey,
                                       ),
                                     ),
                                   ),
                                   controller: studentIdController,
                                   keyboardType: TextInputType.number,
                                 ),
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
                                         readOnly: true,
                                         keyboardType: TextInputType.datetime,
                                         controller: studentDateController,
                                         decoration: const InputDecoration(
                                           border: OutlineInputBorder(),
                                           hintText: 'تاريخ الاقامه',
                                           contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                                           hintStyle: TextStyle(
                                             fontSize: 15.0,
                                             color: Colors.grey,
                                           ),
                                           enabledBorder: OutlineInputBorder(
                                             borderSide: BorderSide(
                                               color: Colors.grey,
                                             ),
                                           ),
                                         ),
                                         onTap:(){
                                           showDatePicker(context: context,
                                               initialDate: DateTime.now(),
                                               firstDate: DateTime.now(),
                                               lastDate: DateTime.parse('2030-12-12')).then((value){
                                             studentDateController.text = DateFormat.yMMMd().format(value!);
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
                                         controller: studentNumOfDayController,
                                         keyboardType: TextInputType.number,
                                         decoration: const InputDecoration(
                                           border: OutlineInputBorder(),
                                           hintText: 'عدد ايام الاقامه',
                                           contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                                           hintStyle: TextStyle(
                                             fontSize: 15.0,
                                             color: Colors.grey,
                                           ),
                                           enabledBorder: OutlineInputBorder(
                                             borderSide: BorderSide(
                                               color: Colors.grey,
                                             ),
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
                                         padding: const EdgeInsets.only(bottom: 42.0),
                                         child: Container(
                                           width: double.infinity,
                                           height: 40.0,
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
                                                   color: Colors.grey,
                                                 ),
                                               ),
                                               hintText: 'صورة بطاقه الضيف',
                                               hintStyle: const TextStyle(
                                                 color: Colors.grey,
                                               ),
                                               border: const OutlineInputBorder(),
                                               contentPadding:const EdgeInsets.symmetric(horizontal:14.0),
                                               enabledBorder: const OutlineInputBorder(
                                                 borderSide: BorderSide(
                                                   color: Colors.grey,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ),
                                       );
                                     }
                                   }
                               ),
                             ],
                           );
                         }else{
                           return Column(
                             children: [
                               Container(
                                 width: double.infinity,
                                 height: 40.0,
                                 margin: const EdgeInsets.symmetric(horizontal: 14.0),
                                 child: TextFormField(
                                   controller: guestNameController,
                                   decoration: const InputDecoration(
                                     border: OutlineInputBorder(),
                                     hintText: 'اسم الضيف',
                                     contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                                     hintStyle: TextStyle(
                                       fontSize: 15.0,
                                       color: Colors.grey,
                                     ),
                                     enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(
                                         color: Colors.grey,
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               const SizedBox(height: 14.0,),
                               Container(
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
                                     enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(
                                         color: Colors.grey,
                                       ),
                                     ),
                                   ),
                                   controller: guestRelationController,
                                 ),
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
                                         controller: guestDateController,
                                         readOnly: true,
                                         decoration: const InputDecoration(
                                           border: OutlineInputBorder(),
                                           hintText: 'تاريخ الاقامه',
                                           contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                                           hintStyle: TextStyle(
                                             fontSize: 15.0,
                                             color: Colors.grey,
                                           ),
                                           enabledBorder: OutlineInputBorder(
                                             borderSide: BorderSide(
                                               color: Colors.grey,
                                             ),
                                           ),
                                         ),
                                         onTap:(){
                                           showDatePicker(context: context,
                                               initialDate: DateTime.now(),
                                               firstDate: DateTime.now(),
                                               lastDate: DateTime.parse('2030-12-12')).then((value){
                                             guestDateController.text = DateFormat.yMMMd().format(value!);
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
                                         controller: guestNumOfDayController,
                                         keyboardType: TextInputType.number,
                                         decoration: const InputDecoration(
                                           border: OutlineInputBorder(),
                                           hintText: 'عدد ايام الاقامه',
                                           contentPadding:EdgeInsets.symmetric(horizontal:14.0),
                                           hintStyle: TextStyle(
                                             fontSize: 15.0,
                                             color: Colors.grey,
                                           ),
                                           enabledBorder: OutlineInputBorder(
                                             borderSide: BorderSide(
                                               color: Colors.grey,
                                             ),
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
                                         padding: const EdgeInsets.only(bottom: 42.0),
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
                                                   color: Colors.grey,
                                                 ),
                                               ),
                                               hintText: 'صورة بطاقه الضيف',
                                               hintStyle: const TextStyle(
                                                 color: Colors.grey,
                                               ),
                                               border: const OutlineInputBorder(),
                                               contentPadding:const EdgeInsets.symmetric(horizontal:14.0),
                                               enabledBorder: const OutlineInputBorder(
                                                 borderSide: BorderSide(
                                                   color: Colors.grey,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ),
                                       );
                                     }
                                   }
                               ),
                             ],
                           );
                         }
                        }
                      ),


                      defaultButton(
                        function: (){
                          if(cubit.isStudent){
                            validationStudent(
                                context: context,
                                name: studentNameController.text,
                                id: studentIdController.text,
                                date: studentDateController.text,
                                numOfDay: studentNumOfDayController.text,
                                nationalIdImage: AppCubit.get(context).idImage.toString()
                            );
                          }else{
                            validationGuest(
                                context: context,
                                name: guestNameController.text,
                                relation:  guestRelationController.text,
                                date: guestDateController.text,
                                numOfDay: guestNumOfDayController.text,
                                nationalIdImage: AppCubit.get(context).idImage.toString()
                            );
                          }
                        },
                        text: 'تقديم الطلب',
                        width: double.infinity,
                        height: 47.0,
                        btnColor: mainColors,
                        marginSize: const EdgeInsets.symmetric(horizontal: 14.0),
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
    );
  }

  void validationStudent({
    required context,
    required String name,
    required String id,
    required String date,
    required String numOfDay,
    required String nationalIdImage,
  }){
    if(name.isEmpty){
      showToast(message: 'أدخل اسم الطالب', state: ToastStates.ERROR);
    }else if(id.isEmpty){
      showToast(message: 'أدخل رقم الطالب', state: ToastStates.ERROR);
    }else if(date.isEmpty){
      showToast(message: 'أدخل تاريخ الأقامة', state: ToastStates.ERROR);
    }else if(numOfDay.isEmpty){
      showToast(message: 'أدخل عدد ايام الأقامة', state: ToastStates.ERROR);
    }else if(nationalIdImage.isEmpty){
      showToast(message: 'أدخل صوره بطاقة الضيف', state: ToastStates.ERROR);
    }else{
      AppCubit.get(context).postStudentGuest(
        name: studentNameController.text,
        isStudent:AppCubit.get(context).isStudent,
        date: studentDateController.text,
        durationOfHosting: studentNumOfDayController.text,
        studentIdCard: AppCubit.get(context).idImage!,
        guestID: studentIdController.text,
        relation: ''
      );
    }
  }

  void validationGuest({
    required context,
    required String name,
    required String relation,
    required String date,
    required String numOfDay,
    required String nationalIdImage,
  }){
    if(name.isEmpty){
      showToast(message: 'أدخل اسم الضيف', state: ToastStates.ERROR);
    }else if(relation.isEmpty){
      showToast(message: 'أدخل صلة القرابة', state: ToastStates.ERROR);
    }else if(date.isEmpty){
      showToast(message: 'أدخل تاريخ الأقام', state: ToastStates.ERROR);
    }else if(numOfDay.isEmpty){
      showToast(message: 'أدخل عدد ايام الأقامة', state: ToastStates.ERROR);
    }else if(nationalIdImage.isEmpty){
      showToast(message: 'أدخل صوره بطاقة الضيف', state: ToastStates.ERROR);
    } else{
      AppCubit.get(context).postStudentGuest(
        name: guestNameController.text,
        relation: guestRelationController.text,
        date: guestDateController.text,
        durationOfHosting: guestNumOfDayController.text,
        studentIdCard:AppCubit.get(context).idImage!,
        guestID: '',
        isStudent: AppCubit.get(context).isStudent,
      );
    }
  }

}
