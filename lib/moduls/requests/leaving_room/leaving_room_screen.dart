import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:university_housing/moduls/fines/fines_screen.dart';
import 'package:university_housing/moduls/requests/leaving_room/success_leaving_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';



class LeavingRoomScreen extends StatelessWidget {
  var reasonController = TextEditingController();
   LeavingRoomScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is PostLeavingSuccessStates) {
          navigateTo(context, const SuccessLeavingScreen());
        }else if(state is PostLeavingErrorStates){
          showToast(message: 'لم يتم تأكيد لطلب الأخلاء, الرجاء المحاولة في وقت لاحق', state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 12.0,
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(0.0),
                    width: 34.0,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(
                        'assets/images/back_arrow.svg',
                        width: 18.0,
                        height: 18.0,
                        color: ThemeCubit.get(context).darkTheme
                            ? mainTextColor
                            : mainColors,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Conditional.single(
                      context: context,
                      conditionBuilder: (BuildContext context) => AppCubit.get(context).profileModel != null,
                      widgetBuilder: (BuildContext context) => buildProfileItem(context),
                      fallbackBuilder: (BuildContext context) => buildProfileShimmerItem(context),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        roomBox(
                          roomNumber:
                              AppCubit.get(context).profileModel!.roomnumber,
                          floor: AppCubit.get(context).profileModel!.floor,
                          buildingName:
                              AppCubit.get(context).profileModel!.buildingName,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/warning.svg',
                          width: 20.0,
                          height: 20.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'تحذير',
                          style: TextStyle(
                            color: warning,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: double.infinity,
                      height: 1.0,
                      color: warning,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SvgPicture.asset(
                            'assets/images/dot.svg',
                            width: 14.0,
                            height: 14.0,
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Expanded(
                          child: Text(
                            'يجب مراعاه ان في حاله إخلاء السكن والرغبه في العوده اليه مره أخرى , فعليك اتمام جميع الأجرائات السكنيه من جديد',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      height: 1.5,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Stack(alignment: Alignment.bottomLeft, children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SvgPicture.asset(
                              'assets/images/dot.svg',
                              width: 14.0,
                              height: 14.0,
                            ),
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Expanded(
                            child: Text(
                              'في حاله وجود غرامات ماليه , يتم خصمها من التأمين ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    height: 1.5,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, const FinesScreen());
                          },
                          child: Text(
                            'تفاصيل الغرامات',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      height: 1.5,
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                      ),
                    ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                    child: Row(
                      children: [
                        Text(
                          'سبب الأخلاء',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(width: 10.0,),
                        SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: Radio(
                            value: true,
                            groupValue: cubit.isReason,
                            activeColor: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                            focusColor: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                            onChanged: (value) {
                              cubit.changeIsReason(true);
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0,),
                        Text(
                          'لايوجد',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(width: 30.0,),
                        SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: Radio(
                            value: false,
                            groupValue: cubit.isReason,
                            activeColor: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                            focusColor: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                            hoverColor: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                            onChanged: (value) {
                              cubit.changeIsReason(false);
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0,),
                        Text(
                          'يوجد',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  Builder(
                      builder: (context) {
                        if(cubit.isReason){
                          return const SizedBox(height: 1.0,);
                        }else{
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              margin: const EdgeInsets.symmetric(horizontal: 14.0),
                              child: TextFormField(
                                controller: reasonController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'برجاء احخال سبب المغادرة',
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
                          );
                        }
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0,),
                    child: defaultButton(
                        text: 'تأكيد اخلاء السكن',
                        btnColor: warning,
                        function: () {
                          if(cubit.isReason){
                            reasonController.text = 'لا يوجد سبب';
                            AppCubit.get(context).postLeavingRoom(reason: reasonController.text);
                          }else{
                            AppCubit.get(context).postLeavingRoom(reason: reasonController.text);
                          }
                        },
                        width: double.infinity),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget buildProfileItem(context) => Row(
    children: [
      CircleAvatar(
        radius: 40.0,
        backgroundImage: NetworkImage(
          AppCubit.get(context).profileModel!.image,
        ),
      ),
      const SizedBox(
        width: 12.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppCubit.get(context).profileModel!.username,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            '${AppCubit.get(context).profileModel!.id}',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    ],
  );

  Widget buildProfileShimmerItem(context) => Row(
    children: [
      Shimmer.fromColors(
        highlightColor: highlightColor,
        baseColor: baseColor,
        child: CircleAvatar(
          radius: 40.0,
          backgroundColor: baseColor,
        ),
      ),
      const SizedBox(
        width: 12.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            child: Container(
              height: 14.0,
              width: 80.0,
              color: baseColor,
            ),
            baseColor: baseColor,
            highlightColor:highlightColor,
          ),
          const SizedBox(
            height: 2.0,
          ),
          Shimmer.fromColors(
            child: Container(
              height: 14.0,
              width: 40.0,
              color: baseColor,
            ),
            baseColor: baseColor,
            highlightColor:highlightColor,
          ),
        ],
      ),
    ],
  );

}
