import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/complaints_model.dart';
import 'package:university_housing/model/get_all_orders_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

import 'dash_complaints_details_screen.dart';

class DashComplimentsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'الشكوى',
              context: context,
              action: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                width: 30.0,
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: ThemeCubit.get(context).darkTheme
                        ? mainTextColor
                        : mainColors,
                  ),
                  onPressed: () {
                    ThemeCubit.get(context).changeTheme();
                  },
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    //lost
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/locate.svg',
                        svg: true,
                        title: 'المفقودات'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: ListView.separated(
                        padding: EdgeInsetsDirectional.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => MissingItem(
                            item: cubit.allOrders!.missing[index],
                            cubit: cubit,
                            context: context,
                            index: index,
                        ),
                        separatorBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: cubit.allOrders!.missing.length,
                      ),
                    ),


                    SizedBox(
                      height: 20.0,
                    ),

                    // broken
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/broken-plate.svg',
                        svg: true,
                        title: 'تبديل التالف'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: ListView.separated(
                        padding: EdgeInsetsDirectional.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => DamagedItem(
                            item: cubit.allOrders!.damaged[index],
                            cubit: cubit,
                            context: context,
                            index: index,
                            ),
                        separatorBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: cubit.allOrders!.damaged.length,
                      ),
                    ),


                    SizedBox(
                      height: 20.0,
                    ),


                    //complaints
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/review.svg',
                        svg: true,
                        title: 'شكوى عامة'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: ListView.separated(
                        padding: EdgeInsetsDirectional.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => ComplaintsItem(
                            item: cubit.allOrders!.complaints[index],
                            cubit: cubit,
                            context: context,
                            index: index,
                        ),
                        separatorBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: cubit.allOrders!.complaints.length,
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


Widget MissingItem({
  required BuildContext context,
  required DashBoardCubit cubit,
  required Missing item,
  required int index,
}) {
  return InkWell(
    onTap: (){
      navigateTo(context, DashComplimentsDetailsScreen(
        type: 'missing',
        missingItem: item,
      ));
    },
    child: Row(
      children: [
        Expanded(
          child: Text(
            item.user.username,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
          child: Text(
            item.user.id.toString(),
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 30.0,
          height: 30.0,
          child: IconButton(
            onPressed: () {
              navigateTo(context, DashComplimentsDetailsScreen(
                type: 'missing',
                missingItem: item,
              ));
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: ThemeCubit
                  .get(context)
                  .darkTheme
                  ? mainTextColor
                  : mainColors,
            ),
          ),
        ),
      ],
    ),
  );
}


Widget DamagedItem({
  required BuildContext context,
  required DashBoardCubit cubit,
  required Damaged item,
  required int index,
}) {
  return InkWell(
    onTap: (){
      navigateTo(context, DashComplimentsDetailsScreen(
        type: 'damaged',
        damagedItem: item,
      ));
    },
    child: Row(
      children: [
        Expanded(
          child: Text(
            item.user.username,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
          child: Text(
            item.user.id.toString(),
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 30.0,
          height: 30.0,
          child: IconButton(
            onPressed: () {
              navigateTo(context, DashComplimentsDetailsScreen(
                type: 'damaged',
                damagedItem: item,
              ));
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: ThemeCubit
                  .get(context)
                  .darkTheme
                  ? mainTextColor
                  : mainColors,
            ),
          ),
        ),
      ],
    ),
  );
}



Widget ComplaintsItem({
  required BuildContext context,
  required DashBoardCubit cubit,
  required Complaints item,
  required int index,
}) {
  return InkWell(
    onTap: (){
      navigateTo(context, DashComplimentsDetailsScreen(
        type: 'complaints',
        complaintsItem: item,
      ));
    },
    child: Row(
      children: [
        Expanded(
          child: Text(
            item.user.username,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
          child: Text(
            item.user.id.toString(),
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 30.0,
          height: 30.0,
          child: IconButton(
            onPressed: () {
              navigateTo(context, DashComplimentsDetailsScreen(
                type: 'complaints',
                complaintsItem: item,
              ));
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: ThemeCubit
                  .get(context)
                  .darkTheme
                  ? mainTextColor
                  : mainColors,
            ),
          ),
        ),
      ],
    ),
  );
}


