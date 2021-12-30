import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/get_all_orders_model.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_rooms_requestes/dash_rooms_requests_details_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashRoomsRequestsScreen extends StatelessWidget {
  const DashRoomsRequestsScreen({Key? key}) : super(key: key);


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
              title: 'طلبات التسكين',
              context: context,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    // book
                    smallDashBoardTitleBox(
                        img: 'assets/images/room.png',
                        title: 'حجز الغرف'),
                    const SizedBox(
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
                        padding: const EdgeInsetsDirectional.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => BookingItem(
                            item: cubit.allOrders!.bookingOrders[index],
                            cubit: cubit,
                            context: context,
                        ),
                        separatorBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: cubit.allOrders!.bookingOrders.length,
                      ),
                    ),


                    const SizedBox(
                      height: 20.0,
                    ),

                    // change
                    smallDashBoardTitleBox(
                        img: 'assets/images/replace.png',
                        title: 'تبديل الغرف'),
                    const SizedBox(
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
                        padding: const EdgeInsetsDirectional.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => ChangeItem(
                            item: cubit.allOrders!.changeRoom[index],
                            cubit: cubit,
                            context: context,
                            ),
                        separatorBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: cubit.allOrders!.changeRoom.length,
                      ),
                    ),


                    const SizedBox(
                      height: 20.0,
                    ),


                    //exit
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/leave.svg',
                        svg: true,
                        title: 'أخلاء السكن'),
                    const SizedBox(
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
                        padding: const EdgeInsetsDirectional.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => LeavingItem(
                            item: cubit.allOrders!.leftOrders[index],
                            cubit: cubit,
                            context: context,
                        ),
                        separatorBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: cubit.allOrders!.leftOrders.length,
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


Widget BookingItem({
  required BuildContext context,
  required DashBoardCubit cubit,
  required BookingOrders item,
}) {
  return InkWell(
    onTap: (){
        navigateTo(context, DashRoomsRequestsDetailsScreen(
          type: 'book',
          bookingItem: item,
        ));
    },
    child: Row(
      children: [
        Expanded(
          child: Text(
            item.user == null ? 'فارغ' : item.user!.username,
            style: item.isReplied ? Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.green) : Theme.of(context).textTheme.bodyText1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Text(
            item.user == null ? 'فارغ' : item.user!.id.toString(),
            style: item.isReplied ? Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.green) : Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 30.0,
          height: 30.0,
          child: IconButton(
            onPressed: () {
                navigateTo(context, DashRoomsRequestsDetailsScreen(
                  type: 'book',
                  bookingItem: item,
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



Widget ChangeItem({
  required BuildContext context,
  required DashBoardCubit cubit,
  required ChangeRoom item,
}) {
  return InkWell(
    onTap: (){
      navigateTo(context, DashRoomsRequestsDetailsScreen(
        type: 'change',
        changeItem: item,
      ));
    },
    child: Row(
      children: [
        Expanded(
          child: Text(
            item.user!.username,
            style: item.isReplied ? Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.green) : Theme.of(context).textTheme.bodyText1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Text(
            item.user!.id.toString(),
            style: item.isReplied ? Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.green) : Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 30.0,
          height: 30.0,
          child: IconButton(
            onPressed: () {
              navigateTo(context, DashRoomsRequestsDetailsScreen(
                type: 'change',
                changeItem: item,
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


Widget LeavingItem({
  required BuildContext context,
  required DashBoardCubit cubit,
  required LeftOrders item,
}) {
  return InkWell(
    onTap: (){
      navigateTo(context, DashRoomsRequestsDetailsScreen(
        type: 'exit',
        leftItem: item,
      ));
    },
    child: Row(
      children: [
        Expanded(
          child: Text(
            item.user!.username,
            style: item.isReplied ? Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.green) : Theme.of(context).textTheme.bodyText1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Text(
            item.user!.id.toString(),
            style: item.isReplied ? Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.green) : Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 30.0,
          height: 30.0,
          child: IconButton(
            onPressed: () {
              navigateTo(context, DashRoomsRequestsDetailsScreen(
                type: 'exit',
                leftItem: item,
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


