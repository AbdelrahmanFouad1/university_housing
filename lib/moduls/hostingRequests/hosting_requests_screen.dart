
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'dart:ui' as ui;

class HostingRequestsScreen extends StatefulWidget {
  @override
  _HostingRequestsScreenState createState() => _HostingRequestsScreenState();
}

class _HostingRequestsScreenState extends State<HostingRequestsScreen> {
  bool isStudent =true;
  var dateController = TextEditingController();
  var daysController = TextEditingController();
  String? img_path = '8986093647738392104.jpg';

  File? myImage ;
  var picker = ImagePicker();
  Future<void> getImage () async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile!= null ){
        myImage =File(pickedFile.path);
        img_path = pickedFile.path.toString();
        print(img_path);
      }else{
        print('Noooooooo');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:  ui.TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backGround,
        appBar: defaultAppBar(context: context),
        body: SingleChildScrollView(
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
                  SizedBox(height: 50.0,),
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
                  SizedBox(height: 35.0,),
                  Row(
                    children: [
                      Text(
                        'صله الضيف بالطالب',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: mainColors,
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        child: Radio(
                            value: true,
                            groupValue: isStudent,
                            activeColor: mainColors,
                            onChanged: (value) {
                              setState(() {
                                isStudent = true;
                                print(isStudent);
                              });
                            },
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      Text(
                        'طالب',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: mainColors,
                        ),
                      ),
                      SizedBox(width: 30.0,),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        child: Radio(
                          value: false,
                          groupValue: isStudent,
                          activeColor: mainColors,
                          onChanged: (value) {
                            setState(() {
                              isStudent = false;
                              print(isStudent);
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      Text(
                        'قريب',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: mainColors,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 19.0,),
                  Container(
                    width: double.infinity,
                    height: 40.0,
                    margin: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'اسم الطالب',
                        contentPadding:const EdgeInsets.symmetric(horizontal:14.0),
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.0,),
                  Container(
                    width: double.infinity,
                    height: 40.0,
                    margin: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'رقم الطالب',
                        contentPadding:const EdgeInsets.symmetric(horizontal:14.0),
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.0,),
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
                              contentPadding:const EdgeInsets.symmetric(horizontal:14.0),
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                            onTap:(){
                              showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2021-12-12')).then((value){
                                dateController.text = DateFormat.yMMMd().format(value!);
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 14.0,),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: TextFormField(
                            controller: daysController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'عدد ايام الاقامه',
                              contentPadding:const EdgeInsets.symmetric(horizontal:14.0),
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
                  SizedBox(height: 14.0,),
                  Container(
                    width: isStudent? 0.0 : double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 40.0,
                          margin: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: TextFormField(
                            onTap: (){
                                  setState(() {
                                  getImage();
                                });
                            },
                            initialValue: img_path == null? '': img_path,
                            textDirection: ui.TextDirection.ltr,
                            textAlign: TextAlign.end,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding:const EdgeInsets.symmetric(horizontal:14.0),
                            ),
                          ),
                        ),

                        Container(
                          padding:const EdgeInsets.symmetric(horizontal: 28.0),
                          height: 40.0,
                          child: SvgPicture.asset(
                            'assets/images/upload.svg',
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    width: isStudent? 0.0 : 220.0,
                    height: isStudent? 0.0 : 220.0,
                    child: myImage == null ? Text(''): Image(
                      image: FileImage(myImage!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 72.0,),
                  defaultButton(
                      function: (){},
                      text: 'تقديم الطلب',
                      width: double.infinity,
                      height: 47.0,
                      marginSize: EdgeInsets.symmetric(horizontal: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
