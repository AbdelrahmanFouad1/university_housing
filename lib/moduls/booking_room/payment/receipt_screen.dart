import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/moduls/booking_room/booking_done_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/cubit.dart';
import 'package:university_housing/shard/cubit/states.dart';
import 'package:university_housing/shard/style/color.dart';

class ReceiptScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var idController = TextEditingController();
  var typeController = TextEditingController();

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
              backgroundColor: backGround,
              appBar: defaultAppBar(context: context),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                              'assets/icon/maps.svg',
                              height: 25.0,
                              width: 25.0,
                              color: mainColors,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '. . .',
                              style: TextStyle(
                                color: mainColors,
                                fontSize: 25.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                              'assets/icon/credit_card.svg',
                              height: 25.0,
                              width: 25.0,
                              color: mainColors,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '. . .',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 25.0
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                              'assets/icon/check.svg',
                              height: 25.0,
                              width: 25.0,
                              alignment: AlignmentDirectional.center,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          '* يجب ادخال جميع البيانات التاليه',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: mainColors,
                          ),
                        ),
                      ),


                      SizedBox(height: 22.0,),
                      Container(
                        width: double.infinity,
                        height: 45.0 ,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0,),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'اسم الطالب',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                            contentPadding:EdgeInsetsDirectional.all(8.0),
                          ),
                        ),
                      ),


                      SizedBox(height: 16.0,),
                      Container(
                        width: double.infinity,
                        height: 45.0 ,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0,),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: TextFormField(
                          controller: idController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'رقم الطالب',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                            contentPadding:EdgeInsetsDirectional.all(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0,),
                      Container(
                        width: double.infinity,
                        height: 45.0 ,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0,),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: TextFormField(
                          controller: typeController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'القسم',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                            contentPadding:EdgeInsetsDirectional.all(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0,),
                      Builder(
                          builder: (context) {
                            if(cubit.receiptImage != null){
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
                                                image:FileImage(cubit.receiptImage!),
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
                                          cubit.removeReceiptImage();
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
                              return Container(
                                width: double.infinity,
                                height: 45.0,
                                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0,),
                                  border: Border.all(color: Colors.grey, width: 1),
                                ),
                                child: TextFormField(
                                  onTap: (){
                                    cubit.pikeReceiptImage();
                                  },
                                  decoration:  InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: (){
                                        cubit.pikeReceiptImage();
                                      },
                                      icon: SvgPicture.asset(
                                        'assets/images/upload.svg',
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    hintText: 'صورة ايصال الدفع',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Colors.black38,
                                    ),
                                    contentPadding:EdgeInsetsDirectional.all(8.0),
                                  ),
                                ),
                              );
                            }
                          }
                      ),
                      SizedBox(height: 16.0,),
                      defaultButton(
                        function: (){
                          if(cubit.receiptImage==null || nameController.text.isEmpty || idController.text.isEmpty || typeController.text.isEmpty){
                            showToast(message: 'ادخل باقي البيانات اولا', state: ToastStates.WARNING);
                          }else{
                            navigateTo(context, BookingDoneScreen());
                          }
                        },
                        text: 'تقديم الطلب',
                        width: double.infinity,
                        height: 47.0,
                        btnColor: mainColors,
                        marginSize: EdgeInsets.symmetric(horizontal: 10.0),

                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ) ,
    );
  }
}