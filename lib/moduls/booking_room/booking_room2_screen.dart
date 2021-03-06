import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/booking_room/payment/choose_payment_method_screen.dart';
import 'package:university_housing/moduls/profile/terms_and_conditions_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class BookingRoom2Screen extends StatelessWidget {
  var floorController = TextEditingController();
  var roomController = TextEditingController();
  int currentIndex = 0;

  BookingRoom2Screen({
    Key? key,
    required this.section,
    required this. phone,
    required this. address,
    required this. nationalID,
    required this. cardPhoto,
    required this. firstTerm,
    required this. secondTerm,
    required this. thirdTerm,
    required this. gender,
  }): super(key: key);

  String section;
  String phone;
  String address;
  String nationalID;
  File cardPhoto;
  bool firstTerm;
  bool secondTerm;
  bool thirdTerm;
  bool gender;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

        if(state is PostBookingSuccessStates ){
          navigateTo(context, const ChoosePaymentMethodScreen());
        }
        if(state is PostBookingLoadingStates ){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }
        if (state is PostBookingErrorStates ){
          Navigator.pop(context);
        }
      },
      builder: (context,state){
        var cubit = AppCubit.get(context);
        String cost = '${buildings!.Buildings[currentIndex].cost + 500}';
        totalCost = cost;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
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
                            color:ThemeCubit.get(context).darkTheme? Colors.white : mainColors,
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
                        '???????? ??????????',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(height: 16.0,),


                    // houses
                    SizedBox(
                      height: 150.0,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            currentIndex = index;
                          return houseItem(
                              index: index,
                              context: context,
                              cubit: cubit,
                              floorController: floorController,
                              roomController: roomController
                          );
                          },
                          separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                          itemCount: buildings!.Buildings.length,
                      ),
                    ),
                    const SizedBox(height: 26.0,),



                    // floor
                    Container(
                      width: double.infinity,
                      height: cubit.showDetails== true ? 45.0 : 0.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color:ThemeCubit.get(context).darkTheme? finesColorDark : Colors.white,
                        borderRadius: BorderRadius.circular(8.0,),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextFormField(
                        controller: floorController,
                        readOnly: true,
                        onTap: (){
                          cubit.currentFloorVal = -1;
                          showDialog<void>(
                            context: context,
                            builder: (context) => buildDialog(
                              context: context,
                              title: '???????? ?????? ??????????',
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: cubit.groupFloor.map((e) => RadioListTile(
                                  title: Text(
                                      e.text,
                                    style: Theme.of(context).textTheme.bodyText1!,
                                  ),
                                  groupValue: cubit.currentFloorVal,
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
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: '???????? ?????? ??????????',
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          contentPadding:const EdgeInsetsDirectional.all(8.0),
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
                        color:ThemeCubit.get(context).darkTheme? finesColorDark : Colors.white,
                        borderRadius: BorderRadius.circular(8.0,),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextFormField(
                        controller: roomController,
                        readOnly: true,
                        onTap: (){
                          cubit.currentRoomVal = -1;
                          if(floorController.text.isEmpty){
                            showToast(state: ToastStates.WARNING,message: '???????? ?????? ?????????? ????????');
                          }else{
                            showDialog<void>(
                              context: context,
                              builder: (context) => buildDialog(
                                context: context,
                                title: '???????? ?????? ????????????',
                                child: Builder(
                                  builder: (context){
                                    if(cubit.roomsList.isEmpty){
                                      return Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                              '"?????? ???????? ?????? ???? ?????? ?????????? ?????????? !!"',
                                            style: Theme.of(context).textTheme.bodyText2,
                                          ),
                                        ),
                                      );
                                    }else{
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: cubit.roomsList.map((e) => RadioListTile(
                                          title: Text(
                                            e.roomNum.toString(),
                                            style: Theme.of(context).textTheme.bodyText1!,
                                          ),
                                          groupValue: cubit.currentRoomVal,
                                          value: e.index,
                                          onChanged: (int? val) {
                                            cubit.selectRoom(val!, e.roomNum.toString() ,e.idDB);
                                            roomController.text = cubit.currentRoomText;
                                            cubit.showAllDetails(true);
                                            Navigator.pop(context);
                                          },
                                        )).toList(),
                                      );
                                    }
                                  },
                                ),
                              ),
                            );
                          }
                        },

                        decoration:   InputDecoration(
                          border: InputBorder.none,
                          hintText: '???????? ?????? ????????????',
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          contentPadding:const EdgeInsetsDirectional.all(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),



                    // details box
                    Container(
                      height: cubit.showAll == true ? 320.0: 0.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color:ThemeCubit.get(context).darkTheme? finesColorDark : Colors.white,
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
                                          '???????????? ???????????? ?????????????? : ',
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                              fontSize: 14.0,
                                            ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          ' ???? ???????? ',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            fontSize: 14.0,
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
                                      '?????? ???????????? : ',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${buildings!.Buildings[currentIndex].cost}',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 14.0,
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
                                      '?????????????? : ',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' ???????? 500 ???????? ?????????????? ???????? ?????????????????? ???? ???????? ?????????? ?????????? ???????? ???????? ???? ???????????? ?????????? ',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 14.0,
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
                                      '???????????????? : ',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      cost,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 14.0,
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
                    SizedBox(
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
                              '?????????? ?????? ???????? ',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(width: 4.0,),
                          InkWell(
                            onTap: (){
                              navigateTo(context, const TermsAndConditionsScreen());
                            },
                            child: Text(
                                '???????????? ???????????????? ',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                              cubit.postBookingRoom(
                                  firstTerm: firstTerm,
                                  secondTerm: secondTerm,
                                  thirdTerm: thirdTerm,
                                  gender: gender,
                                  buildingType: buildings!.Buildings[currentIndex].buildingLevels,
                                  Section: section,
                                  phone: phone,
                                  address: address,
                                  NationalID: nationalID,
                                  cardPhoto: cardPhoto,
                                  buildingName: buildings!.Buildings[currentIndex].buildingName,
                                  roomnumber: int.parse(roomController.text),
                                  context: context,
                                  floor: floorController.text == '??????????' ? 1 : floorController.text == '????????????' ? 2 :floorController.text == '????????????' ? 3 : 4 ,
                              );

                            }else{
                              showToast(message: '?????????? ???????????????? ?????? ????????????', state: ToastStates.WARNING);
                            }
                          },
                          text: '???????????? ??????????',
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

class SelectRoomModel
{
  late String text;
  late int index;

  SelectRoomModel({
    required this.text,
    required this.index,
  });
}


Widget houseItem ({
 required AppCubit cubit,
 required context,
 required floorController,
 required roomController,
 required index,
})=> InkWell(
  onTap: (){
    cubit.changeHouseColor(index);
    cubit.IsDouble(buildings!.Buildings[index].buildingLevels == true ? false : true);
    cubit.showAllDetails(false);
    floorController.text = '';
    roomController.text = '';
    cubit.selectedBuildingItem = index;
  },
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Container(
      width: 100.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: ThemeCubit.get(context).darkTheme? (cubit.selectedHouse == index? mainTextColor : backGroundDark) : (cubit.selectedHouse == index? mainColors : Colors.white),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        children: [
          Container(
            width: 90.0,
            height: 90.0,
            margin: const EdgeInsetsDirectional.all(5.0),
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(5.0),
             border: Border.all(color: Colors.grey, width: 1),
           ),
            child: CachedNetworkImage(
              imageUrl: 'https://graduation-projec.herokuapp.com${buildings!.Buildings[index].image}',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Container(
                alignment: Alignment.center,
                height: 80.0,
                child: Icon(
                  Icons.error,
                  color: ThemeCubit.get(context).darkTheme
                      ? mainTextColor
                      : mainColors,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              buildings!.Buildings[index].buildingName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: ThemeCubit.get(context).darkTheme? (cubit.selectedHouse == index? mainColors : mainTextColor) : (cubit.selectedHouse == index? Colors.white : mainColors) ,
                fontSize: 12.0,
              ),
            ),
          ),
          Text(
            buildings!.Buildings[index].buildingLevels == true ? '(????????)':'(????????)',
            style: TextStyle(
              color: ThemeCubit.get(context).darkTheme? (cubit.selectedHouse == index? mainColors : mainTextColor) : ( cubit.selectedHouse == index? Colors.white : mainColors),
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    ),
  ),
);