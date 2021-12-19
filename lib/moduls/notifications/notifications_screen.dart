import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/model/get_notifications_model.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              titleSpacing: 20.0,
              automaticallyImplyLeading: false,
              actions: [
                Container(
                  padding: const EdgeInsets.all(0.0),
                  width: 30.0,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon:  Icon(
                      IconBroken.Arrow___Left_2,
                      color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 6.0,),
              ],
              title: Text(
                'الأشعارات',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Builder(
                builder: (context){
                  if(cubit.notifications!.notificationsList.length == 0){
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            child: SvgPicture.asset(
                              'assets/images/no_data.svg',
                              height: 300.0,
                            ),
                          ),
                          Text(
                              '" لا يوجد إشعارات حاليا "',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(height: 20.0,),
                        ],
                      ),
                    );
                  }else{
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder:(context,index)=> buildNotificationItem(context, cubit.isBus,cubit.notifications!.notificationsList[index]),
                      separatorBuilder:(context,index)=> const SizedBox(height: 12.0,),
                      itemCount: cubit.notifications!.notificationsList.length,
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}


Widget buildNotificationItem (context, isBus, NotificationsModel notifications) {

  DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(notifications.updatedAt);
  String date = tempDate.toString().substring(0, 10);

  return Container(
    width: double.infinity,
    height: 140.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: ThemeCubit.get(context).darkTheme? finesColorDark : finesColor,
    ),
    child: Column(
      children: [
        const SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Builder(
                builder: (context){
                  if(isBus == true){
                    return SvgPicture.asset(
                      'assets/icon/bus.svg',
                      width: 24.0,
                      height: 24.0,
                    );
                  }else{
                    return Image.asset(
                      'assets/images/logo.png',
                      width: 26.0,
                      height: 26.0,
                    );
                  }
                },
              ),
              const SizedBox(width: 12.0,),
              Text(
                '${notifications.title}',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: Text(
              '${notifications.body}',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            child: Text(
              date,
              style: TextStyle(
                color: separator,
                fontSize: 10.0,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}