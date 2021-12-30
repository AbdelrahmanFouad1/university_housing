import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/model/my_orders_model.dart';
import 'package:university_housing/moduls/profile/technical_support_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class FollowGuestRoomScreen extends StatelessWidget {

 final GuestordersModel model;

 const FollowGuestRoomScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 12.0,
              title: Text(
                'التفاصيل',
                style: Theme.of(context).textTheme.headline6,
              ),
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
              child: Container(
                padding: const EdgeInsetsDirectional.all(16.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '* في حاله وجود خطأ في التفاصيل يرجى المتابعه من خلال ',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 10.0,
                                  ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            navigateTo(context, const TechnicalSupportScreen());
                          },
                          child: Text(
                            'الدعم الفني',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontWeight: FontWeight.w900,
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: separator,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    buildBoxCheckColor(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'رقم الطلب : ',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            model.idDB,
                            textAlign: TextAlign.center,
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'أسم الضيف : ',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                           model.NameofGuest,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'تاريخ الطلب : ',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            model.HostDate,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'عدد أيام الأقامة : ',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            model.DurationOfHosting.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if(model.studentId !=null)
                      if(model.studentId!.isNotEmpty)
                        Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'رقم الطالب : ',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                model.studentId!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                    if(model.relation !=null)
                      if(model.relation!.isNotEmpty)
                        Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'صلة القرابة: ',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  model.relation!,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    buildReplay(),
                    const SizedBox(
                      height: 10.0,
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

  Widget buildBoxCheckColor() => Builder(builder: (context) {
        // if (model.isreply == true) {
        //   return Container(
        //     height: 50.0,
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //       color: Colors.green,
        //       borderRadius: BorderRadiusDirectional.circular(8.0),
        //     ),
        //     alignment: AlignmentDirectional.center,
        //     child: const Text(
        //       'تمت الموافقه عليه',
        //       style: TextStyle(fontSize: 18.0, color: Colors.white),
        //       textAlign: TextAlign.center,
        //     ),
        //   );
        // } else {
          return Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color:model.reply == '' ? Colors.amber :  Colors.green ,
              borderRadius: BorderRadiusDirectional.circular(8.0),
            ),
            alignment: AlignmentDirectional.center,
            child:  Text(
              model.reply == '' ?
              'أنتظر حني يتم الموافقة علي الطلب' : 'تمت الموافقه عليه',
              style: const TextStyle(fontSize: 18.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          );
        // }
      });

  Widget buildReplay() => Builder(
      builder: (context) {
        // if(model.isreply){
        //   return Row(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Expanded(
        //         flex: 1,
        //         child: Text(
        //           'الرد علي الطلب : ',
        //           style: Theme.of(context).textTheme.headline6,
        //         ),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Text(
        //           model.reply,
        //           textAlign: TextAlign.center,
        //           style: Theme.of(context).textTheme.bodyText1,
        //         ),
        //       ),
        //     ],
        //   );
        // }else{
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'الرد علي الطلب : ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'لم يتم الرد',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          );
        // }
      }
  );
}
