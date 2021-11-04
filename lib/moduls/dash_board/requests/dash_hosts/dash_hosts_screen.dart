import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/complaints_model.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_hosts/dash_hosts_details_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashHostsScreen extends StatelessWidget {


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
              title: 'الإستضافة',
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
                    smallDashBoardTitleBox(
                        svgImage: 'assets/images/follow.svg',
                        title: 'طلبات الإستضافة',
                        svg: true),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 500.0,
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
                        itemBuilder: (context, index) => ComplaintsItem(context),
                        separatorBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: 2,
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


Widget ComplaintsItem(
    context,
    ) {
  return InkWell(
    onTap: (){
      navigateTo(context, DashHostsDetailsScreen());
    },
    child: Row(
      children: [
        Expanded(
          child: Text(
            'احمد سعيد علي محمد',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
          child: Text(
            '42019006',
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 30.0,
          height: 30.0,
          child: IconButton(
            onPressed: () {
              navigateTo(context, DashHostsDetailsScreen());
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


