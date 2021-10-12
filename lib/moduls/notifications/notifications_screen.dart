import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
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
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder:(context,index)=> buildNotificationItem(context, cubit.isBus),
                  separatorBuilder:(context,index)=> const SizedBox(height: 12.0,),
                  itemCount: 7,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


Widget buildNotificationItem (context, isBus) => Container(
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
              'باص المعهد',
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
            'باص المعهد علي وشك وصول الي مبني الأسكان المميز (أ)',
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
            'منذ  10 دقائق',
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