import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

import 'booking_room2_screen.dart';

class BookingRoom1Screen extends StatelessWidget {
  BookingRoom1Screen({Key? key}) : super(key: key);
  var sectionController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var nationalIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
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
                            color: ThemeCubit.get(context).darkTheme
                                ? Colors.white
                                : mainColors,
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
                            style:
                                TextStyle(color: Colors.grey, fontSize: 25.0),
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
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        'أدخل بياناتك',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),




                    // section
                    Container(
                      width: double.infinity,
                      height: 45.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: ThemeCubit.get(context).darkTheme
                            ? finesColorDark
                            : Colors.white,
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextFormField(
                        controller: sectionController,
                        keyboardType: TextInputType.text,
                        onTap: () {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'القسم',
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          contentPadding:
                              const EdgeInsetsDirectional.all(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    // phone
                    Container(
                      width: double.infinity,
                      height: 45.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: ThemeCubit.get(context).darkTheme
                            ? finesColorDark
                            : Colors.white,
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        onTap: () {},
                        onFieldSubmitted: (s) {
                          if (s.length < 11 || s.length > 11) {
                            showToast(
                                message: 'يجب أدخال الرقم الموبيل بطرقه صحيحه',
                                state: ToastStates.WARNING);
                          }
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'رقم الموبيل',
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          contentPadding:
                              const EdgeInsetsDirectional.all(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    // address
                    Container(
                      width: double.infinity,
                      height: 45.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: ThemeCubit.get(context).darkTheme
                            ? finesColorDark
                            : Colors.white,
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextFormField(
                        controller: addressController,
                        keyboardType: TextInputType.text,
                        onTap: () {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'العنوان',
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          contentPadding:
                              const EdgeInsetsDirectional.all(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    // national Id
                    Container(
                      width: double.infinity,
                      height: 45.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: ThemeCubit.get(context).darkTheme
                            ? finesColorDark
                            : Colors.white,
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextFormField(
                        controller: nationalIDController,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (s) {
                          if (s.length < 14 || s.length > 14) {
                            showToast(
                                message: 'يجب أدخال الرقم القومي بطرقه صحيحه',
                                state: ToastStates.WARNING);
                          }
                        },
                        onTap: () {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'الرقم القومي',
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          contentPadding:
                              const EdgeInsetsDirectional.all(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    // term
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'الترم :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Radio(
                                    value: 1,
                                    groupValue: cubit.term,
                                    activeColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    focusColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    onChanged: (value) {
                                      cubit.changeTerm(1);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'الأول',
                                  style:
                                      Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Radio(
                                    value: 2,
                                    groupValue: cubit.term,
                                    activeColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    focusColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    hoverColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    onChanged: (value) {
                                      cubit.changeTerm(2);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'الثاني',
                                  style:
                                      Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Radio(
                                    value: 3,
                                    groupValue: cubit.term,
                                    activeColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    focusColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    hoverColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    onChanged: (value) {
                                      cubit.changeTerm(3);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'الثالث',
                                  style:
                                      Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    // kind
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'النوع :',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Radio(
                                    value: true,
                                    groupValue: cubit.isBoy,
                                    activeColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    focusColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    onChanged: (value) {
                                      cubit.changeIsBoy(true);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'ذكر',
                                  style:
                                      Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Radio(
                                    value: false,
                                    groupValue: cubit.isBoy,
                                    activeColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    focusColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    hoverColor:
                                        ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                    onChanged: (value) {
                                      cubit.changeIsBoy(false);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'أنثى',
                                  style:
                                      Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    // nationalId photo
                    Builder(builder: (context) {
                      if (cubit.nationalIdImage != null) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 42.0),
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 180.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        image: DecorationImage(
                                          image: FileImage(cubit.nationalIdImage!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 188.0,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(8.0),
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 3.0),
                                child: IconButton(
                                  onPressed: () {
                                    cubit.removeNationalIdImage();
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
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 72.0),
                          child: Container(
                            width:  double.infinity,
                            height:  45.0,
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: ThemeCubit.get(context).darkTheme
                                  ? finesColorDark
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: TextFormField(
                              readOnly: true,
                              onTap: () {
                                cubit.pikeNationalIdImage();
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    cubit.pikeNationalIdImage();
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/images/upload.svg',
                                    alignment: Alignment.center,
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: 'صورة البطاقة',
                                hintStyle: Theme.of(context).textTheme.bodyText1,
                                contentPadding:
                                const EdgeInsetsDirectional.all(10.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        );
                      }
                    }),


                    // button
                    Container(
                      width: double.infinity,
                      height: 70.0 ,
                      padding: const EdgeInsets.all(10.0),
                      child: defaultButton(
                          function: () {
                            validation(
                              cubit: cubit,
                                phone: phoneController.text,
                              address: addressController.text,
                              nationalId: nationalIDController.text,
                              section: sectionController.text,
                              nationalImage: cubit.nationalIdImage,
                              context: context,
                            );
                          },
                          text: 'التالي',
                          btnColor: mainColors),
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

  void validation({
    required AppCubit cubit,
    required context,
    required String section,
    required String phone,
    required String address,
    required String nationalId,
    required nationalImage,
  }){
    if(section.isEmpty){
      showToast(message: 'أدخل القسم', state: ToastStates.ERROR);
    }else if(phone.isEmpty){
      showToast(message: 'أدخل رقم الموبيل', state: ToastStates.ERROR);
    }else if(address.isEmpty){
      showToast(message: 'أدخل العنوان', state: ToastStates.ERROR);
    }else if(nationalId.isEmpty){
      showToast(message: 'أدخل الرقم القومي', state: ToastStates.ERROR);
    }else if(nationalImage == null){
      showToast(message: 'أدخل صورة البطاقه', state: ToastStates.ERROR);
    }else if(phone.length != 11){
      showToast(message: 'رقم الموبيل غير صحيح', state: ToastStates.ERROR);
    }else if(nationalId.length != 14){
      showToast(message: 'رقم البطاقه غير صحيح', state: ToastStates.ERROR);
    }else{

      navigateTo(context, BookingRoom2Screen(
        section: sectionController.text,
        phone: phoneController.text,
        address: addressController.text,
        NationalID: nationalIDController.text,
        gender: cubit.isBoy,
        firstTerm: cubit.term == 1? true:false,
        secondTerm: cubit.term == 2? true:false,
        thirdTerm: cubit.term == 3? true:false,
        cardPhoto: nationalImage,
      ));
    }
  }
}

