import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/booking_room/payment/choose_payment_method_screen.dart';
import 'package:university_housing/moduls/profile/terms_and_conditions_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';

class BookingRoomScreen extends StatelessWidget {
  var floorController = TextEditingController();
  var roomController = TextEditingController();

  final List<SelectFloorModel> _group = [
    SelectFloorModel
      (
      text: "الدور الأول",
      index: 1,
    ),
    SelectFloorModel
      (
      text: "الدور الثانى",
      index: 2,
    ),
    SelectFloorModel
      (
      text: "الدور الثالث",
      index: 3,
    ),
    SelectFloorModel
      (
      text: "الدور الرابع",
      index: 4,
    ),
    SelectFloorModel
      (
      text: "الدور الخامس",
      index: 5,
    ),
  ];

  final List<SelectRoomModel> _groupRoom = [
    SelectRoomModel(
      text: "غرفة 201",
      index: 1,
    ),
    SelectRoomModel(
      text: "غرفة 202",
      index: 2,
    ),
    SelectRoomModel(
      text: "غرفة 203",
      index: 3,
    ),
    SelectRoomModel(
      text: "غرفة 204",
      index: 4,
    ),
    SelectRoomModel(
      text: "غرفة 205",
      index: 5,
    ),
    SelectRoomModel(
      text: "غرفة 306",
      index: 6,
    ),
    SelectRoomModel(
      text: "غرفة 307",
      index: 7,
    ),
    SelectRoomModel(
      text: "غرفة 308",
      index: 8,
    ),
    SelectRoomModel(
      text: "غرفة 409",
      index: 9,
    ),
    SelectRoomModel(
      text: "غرفة 510",
      index: 10,
    ),
    SelectRoomModel(
      text: "غرفة 511",
      index: 11,
    ),
  ];

  BookingRoomScreen({Key? key}) : super(key: key);

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
              physics: const BouncingScrollPhysics(),
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
                        const Expanded(
                          flex: 1,
                          child: Text(
                            '. . .',
                            style: TextStyle(
                              color: Colors.grey,
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
                            color: Colors.grey,
                          ),
                        ),
                        const Expanded(
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
                    const SizedBox(height: 10.0,),
                    Center(
                      child: Text(
                        'أختر غرفتك',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: mainColors,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),



                    // houses
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                cubit.changeHouseColor(1);
                                cubit.IsDouble(true);
                                cubit.ShowAllDetails(false);
                                floorController.text = '';
                                roomController.text = '';
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Container(
                                  width: 100.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: cubit.selectedHouse == 1? mainColors : Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(color: Colors.grey, width: 1),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/building1.png',
                                        width: double.infinity,
                                        height: 100.0,
                                        fit:BoxFit.fill,
                                      ),
                                      Text(
                                        'دار الضيافه',
                                        style: TextStyle(
                                          color: cubit.selectedHouse == 1? Colors.white : mainColors ,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        '(زوجي)',
                                        style: TextStyle(
                                          color: cubit.selectedHouse == 1? Colors.white : mainColors,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                cubit.changeHouseColor(2);
                                cubit.IsDouble(false);
                                cubit.ShowAllDetails(false);
                                floorController.text = '';
                                roomController.text = '';
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Container(
                                  width: 100.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: cubit.selectedHouse == 2? mainColors :Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(color: Colors.grey, width: 1),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/building2.png',
                                        width: double.infinity,
                                        height: 100.0,
                                        fit:BoxFit.fill,
                                      ),
                                      Text(
                                        'أسكان مميز (أ)',
                                        style: TextStyle(
                                          color: cubit.selectedHouse == 2? Colors.white : mainColors,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        '(فردي)',
                                        style: TextStyle(
                                          color: cubit.selectedHouse == 2? Colors.white : mainColors,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                cubit.changeHouseColor(3);
                                cubit.IsDouble(false);
                                cubit.ShowAllDetails(false);
                                floorController.text = '';
                                roomController.text = '';
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Container(
                                  width: 100.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: cubit.selectedHouse == 3? mainColors :Colors.white ,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(color: Colors.grey, width: 1),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/building3.png',
                                        width: double.infinity,
                                        height: 100.0,
                                        fit:BoxFit.fill,
                                      ),
                                      Text(
                                        'أسكان مميز (ب)',
                                        style: TextStyle(
                                          color: cubit.selectedHouse == 3? Colors.white : mainColors,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        '(فردي)',
                                        style: TextStyle(
                                          color: cubit.selectedHouse == 3? Colors.white : mainColors,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26.0,),



                    // floor
                    Container(
                      width: double.infinity,
                      height: cubit.showDetails== true ? 45.0 : 0.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0,),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextFormField(
                        controller: floorController,
                        readOnly: true,
                        onTap: (){
                          showDialog<void>(
                            context: context,
                            builder: (context) => buildDialog(
                              context: context,
                              title: 'اختر رقم الدور',
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: _group.map((e) => RadioListTile(
                                  title: Text(
                                      e.text
                                  ),
                                  groupValue: cubit.currentVal,
                                  value: e.index,
                                  onChanged: (int? val) {
                                    cubit.selectFloor(val!, e.text);
                                    floorController.text = cubit.currentText;
                                    Navigator.pop(context);
                                  },
                                )).toList(),
                              ),
                            ),
                          );
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          // suffixIcon: cubit.showDetails == true ? Icon(
                          //   Icons.keyboard_arrow_down,
                          //   color: Colors.black38,):Icon(
                          //   Icons.keyboard_arrow_down,
                          //   color: Colors.black38,),
                          hintText: 'اختر رقم الدور',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                          contentPadding:EdgeInsetsDirectional.all(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),



                    // room
                    Container(
                      width: double.infinity,
                      height:cubit.showDetails== true ? 45.0 : 0.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0,),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextFormField(
                        controller: roomController,
                        readOnly: true,
                        onTap: (){
                          if(floorController.text.isEmpty){
                            showToast(state: ToastStates.WARNING,message: 'أدخل رقم الدور أولا');
                          }else{
                            showDialog<void>(
                              context: context,
                              builder: (context) => buildDialog(
                                context: context,
                                title: 'اختر رقم الغرفه',
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: _groupRoom.map((e) => RadioListTile(
                                    title: Text(
                                        e.text
                                    ),
                                    groupValue: cubit.currentRoomVal,
                                    value: e.index,
                                    onChanged: (int? val) {
                                      cubit.selectRoom(val!, e.text);
                                      roomController.text = cubit.currentRoomText;
                                      cubit.ShowAllDetails(true);
                                      Navigator.pop(context);
                                    },
                                  )).toList(),
                                ),
                              ),
                            );
                          }
                        },

                        decoration:  const InputDecoration(
                          border: InputBorder.none,
                          // suffixIcon: Icon(
                          //   Icons.keyboard_arrow_down,
                          //   color: Colors.black38,
                          // ),
                          hintText: 'اختر رقم الغرفه',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                          contentPadding:EdgeInsetsDirectional.all(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),



                    // details box
                    Container(
                      height: cubit.showAll == true ? 320.0: 0.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            if(cubit.isDouble == true)
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'الساكن الحالي بالغرفه : ',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: mainColors
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          ' لا يوجد ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: mainColors
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16.0,),
                                Container(
                                  width: double.infinity,
                                  height:1.0,
                                  color: separator,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'سعر الغرفه : ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: mainColors
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' 2997 ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: mainColors
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0,),
                            Container(
                              width: double.infinity,
                              height:1.0,
                              color: separator,
                            ),
                            const SizedBox(height: 16.0,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'ملاحظات : ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: mainColors
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' يضاف 500 جنيه تأمينات ويتم أستردادها في حاله أخلاء السكن وعدم وجود أي غرامات ماليه ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: mainColors
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0,),
                            Container(
                              width: double.infinity,
                              height:1.0,
                              color: separator,
                            ),
                            const SizedBox(height: 16.0,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'الأجمالي : ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: mainColors
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '3497',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: mainColors
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),

                    //check box
                    Container(
                      width: double.infinity,
                      height:cubit.showAll== true ? 40.0 : 0.0,
                      child: Row(
                        children: [
                          if(cubit.showAll== true)
                          Checkbox(
                            value: cubit.agree,
                            onChanged:(s){
                              cubit.IsAgree(!cubit.agree!);
                            },
                            checkColor: Colors.white,
                            activeColor: mainColors,
                          ),
                          Text(
                              'اوافق علي جميع ',
                            style: TextStyle(
                              color: mainColors,
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(width: 4.0,),
                          InkWell(
                            onTap: (){
                              navigateTo(context, TermsAndConditionsScreen());
                            },
                            child: Text(
                                'الشروط والأحكام ',
                              style: TextStyle(
                                color: mainColors,
                                fontSize: 14.0,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0,),



                    // button
                    Container(
                      width: double.infinity,
                      height: cubit.showAll == true ? 70.0: 0.0,
                      padding: const EdgeInsets.all(10.0),
                      child: defaultButton(
                          function: (){
                            if(cubit.agree==true){
                              navigateTo(context, const ChoosePaymentMethodScreen());
                            }else{
                              showToast(message: 'برجاء الموافقه علي الشروط', state: ToastStates.WARNING);
                            }
                          },
                          text: 'متابعه الدفع',
                          btnColor: mainColors
                      ),
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


class SelectFloorModel
{
  late String text;
  late int index;

  SelectFloorModel
      ({
    required this.text,
    required this.index,
  });
}

class SelectRoomModel {
  late String text;
  late int index;

  SelectRoomModel({
    required this.text,
    required this.index,
  });
}