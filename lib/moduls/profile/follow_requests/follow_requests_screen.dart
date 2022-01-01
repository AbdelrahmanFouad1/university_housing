import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:university_housing/model/my_orders_model.dart';
import 'package:university_housing/moduls/profile/follow_requests/follow_requests_complaint_screen.dart';
import 'package:university_housing/moduls/profile/follow_requests/follow_requests_damaged_screen.dart';
import 'package:university_housing/moduls/profile/follow_requests/follow_requests_lost_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

import 'follow_requests_book_room_screen.dart';
import 'follow_requests_change_room_screen.dart';
import 'follow_requests_endorsement_screen.dart';
import 'follow_requests_guest_screen.dart';
import 'follow_requests_left_room_screen.dart';

class FollowRequestsScreen extends StatelessWidget {
  const FollowRequestsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 12.0,
              title: Text(
                'متابعه طلباتي',
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
            body: Builder(
              builder: (context){
                if(state is GetOrderSuccessStates){
                  if(validation(context)){
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: SvgPicture.asset(
                              'assets/images/no_data.svg',
                              height: 300.0,
                            ),
                          ),
                          Text(
                            '" لا يوجد طلبات حاليا "',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 20.0,),
                        ],
                      ),
                    );
                  }else{
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '* يجب مراعاه الارشادات التاليه',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.circular(3.0),
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'تمت الموافقه علي طلبكم',
                                  style:
                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 10.0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 14.0,
                                ),
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.circular(3.0),
                                    color: Colors.amber,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'جاري الرد علي طلبكم',
                                  style:
                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 10.0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 14.0,
                                ),
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.circular(3.0),
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'تم رفض طلبكم',
                                  style:
                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              color: separator,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Conditional.single(
                              context: context,
                              conditionBuilder: (BuildContext context) => AppCubit.get(context).myOrdersModel != null ,
                              widgetBuilder: (BuildContext context) => buildOrderScreen(context),
                              fallbackBuilder: (BuildContext context) => buildOrderShimmerScreen(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            ),
          ),
        );
      },
    );
  }
}


Widget buildOrderScreen(context) => Column(
      children: [
        //complaints
        Builder(builder: (context) {
          if(AppCubit.get(context).myOrdersModel!.Complaintsorders.isEmpty){
            return const SizedBox(height: 2.0,);
          } else{
            return Column(
              children: [
                smallDashBoardTitleBox(
                    svgImage: 'assets/images/review.svg',
                    svg: true,
                    title: 'شكوى عامة'),
                const SizedBox(height: 15.0),
                SizedBox(
                  height:AppCubit.get(context).myOrdersModel!.Complaintsorders.length == 1 ? 105 : 210,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        buildComplaintsItem(context, AppCubit.get(context).myOrdersModel!.Complaintsorders[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                    itemCount: AppCubit.get(context).myOrdersModel!.Complaintsorders.length,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          }
        }),

        //Damagedthingsorders
        Builder(builder: (context) {
          if(AppCubit.get(context).myOrdersModel!.Damagedthingsorders.isEmpty){
            return const SizedBox(height: 2.0,);
          }else{
            return Column(
              children: [
                smallDashBoardTitleBox(
                    svgImage: 'assets/images/broken-plate.svg',
                    svg: true,
                    title: 'تبديل التالف'),
                const SizedBox(height: 15.0),
                SizedBox(
                  height:AppCubit.get(context).myOrdersModel!.Damagedthingsorders.length == 1 ? 105 : 210,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        buildDamagedItem(context, AppCubit.get(context).myOrdersModel!.Damagedthingsorders[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                    itemCount: AppCubit.get(context).myOrdersModel!.Damagedthingsorders.length,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          }
        }),

        //Missingthingsorders
        Builder(builder: (context) {
          if(AppCubit.get(context).myOrdersModel!.Missingthingsorders.isEmpty){
            return const SizedBox(height: 2.0,);
          }else{
            return Column(
              children: [
                smallDashBoardTitleBox(
                    svgImage: 'assets/images/locate.svg',
                    svg: true,
                    title: 'المفقودات'),
                const SizedBox(height: 15.0),
                SizedBox(
                  height:AppCubit.get(context).myOrdersModel!.Missingthingsorders.length == 1 ? 105 : 210,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        buildMissingItem(context, AppCubit.get(context).myOrdersModel!.Missingthingsorders[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                    itemCount: AppCubit.get(context).myOrdersModel!.Missingthingsorders.length,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          }
        }),

        //RequestsTochangeRoomorders
        Builder(builder: (context) {
          if(AppCubit.get(context).myOrdersModel!.RequestsTochangeRoomorders.isEmpty){
            return const SizedBox(height: 2.0,);
          }else{
            return Column(
              children: [
                smallDashBoardTitleBox(
                    svgImage: 'assets/images/talk.svg',
                    svg: true,
                    title: 'طلب تغير الغرفة'),
                const SizedBox(height: 15.0),
                SizedBox(
                  height:AppCubit.get(context).myOrdersModel!.RequestsTochangeRoomorders.length == 1 ? 105 : 210,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        buildRequestChangeRoomItem(context, AppCubit.get(context).myOrdersModel!.RequestsTochangeRoomorders[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                    itemCount: AppCubit.get(context).myOrdersModel!.RequestsTochangeRoomorders.length,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          }
        }),

        //Endorsementorders
        Builder(builder: (context) {
          if(AppCubit.get(context).myOrdersModel!.Endorsementorders.isEmpty){
            return const SizedBox(height: 2.0,);
          }else{
            return Column(
              children: [
                smallDashBoardTitleBox(
                    svgImage: 'assets/images/family.svg',
                    svg: true,
                    title: 'أقرارات ولى الأمر'),
                const SizedBox(height: 15.0),
                SizedBox(
                  height:AppCubit.get(context).myOrdersModel!.Endorsementorders.length == 1 ? 105 : 210,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        buildEndorsementItem(context, AppCubit.get(context).myOrdersModel!.Endorsementorders[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                    itemCount: AppCubit.get(context).myOrdersModel!.Endorsementorders.length,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          }
        }),

        //Guestorders
        Builder(builder: (context) {
          if(AppCubit.get(context).myOrdersModel!.Guestorders.isEmpty){
            return const SizedBox(height: 2.0,);
          }else{
            return Column(
              children: [
                smallDashBoardTitleBox(
                    svgImage: 'assets/images/follow.svg',
                    svg: true,
                    title: 'طلبات الاستضافة'),
                const SizedBox(height: 15.0),
                SizedBox(
                  height:AppCubit.get(context).myOrdersModel!.Guestorders.length == 1 ? 105 : 210,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        buildGuestItem(context, AppCubit.get(context).myOrdersModel!.Guestorders[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                    itemCount: AppCubit.get(context).myOrdersModel!.Guestorders.length,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          }

        }),

        //leftRequestsorders
        Builder(builder: (context) {
          if(AppCubit.get(context).myOrdersModel!.leftRequestsorders.isEmpty){
            return const SizedBox(height: 2.0,);
          }else{
            return Column(
              children: [
                smallDashBoardTitleBox(
                    svgImage: 'assets/images/leave.svg',
                    svg: true,
                    title: 'طلب إخلاء السكن'),
                const SizedBox(height: 15.0),
                SizedBox(
                  height: AppCubit.get(context).myOrdersModel!.leftRequestsorders.length == 1 ? 105 : 210,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        buildLeftRoomItem(context, AppCubit.get(context).myOrdersModel!.leftRequestsorders[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                    itemCount: AppCubit.get(context).myOrdersModel!.leftRequestsorders.length,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          }
        }),

        //Bookingsorders
        Builder(builder: (context) {
          if(AppCubit.get(context).myOrdersModel!.Bookingsorders.isEmpty){
            return const SizedBox(height: 2.0,);
          }else{
            return Column(
              children: [
                smallDashBoardTitleBox(
                    svgImage: 'assets/images/request.svg',
                    svg: true,
                    title: 'طلب الألتحاق بالسكن'),
                const SizedBox(height: 15.0),
                SizedBox(
                  height: AppCubit.get(context).myOrdersModel!.Bookingsorders.length == 1 ? 105 : 210,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => buildBookingsRoomItem(context, AppCubit.get(context).myOrdersModel!.Bookingsorders[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                    itemCount: AppCubit.get(context).myOrdersModel!.Bookingsorders.length,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          }
        }),
      ],
    );

Widget buildComplaintsItem(context, ComplaintsordersModel model) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: buildEnquiry(
        context,
        height: 100.0,
        state: model.isReplied ? model.isAccepted? StatusStates.ACCEPT : StatusStates.REJECT :StatusStates.WAITING,
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child:  Text(
                        model.complaint ,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  navigateTo(
                      context,
                      FollowRequestsComplaintScreen(model: model,),
                  );
                },
                child: Text(
                  'عرض التفاصيل',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration:TextDecoration.underline,
                  ),

                ),
              ),
            ],
          ),

        ),
      ),
  ),
);

Widget buildDamagedItem(context, DamagedthingsordersModel model) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: buildEnquiry(
        context,
        height: 100.0,
        state: model.isReplied ? model.isAccepted? StatusStates.ACCEPT : StatusStates.REJECT :StatusStates.WAITING,
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child:  Text(
                        model.damagedthing,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  navigateTo(
                      context,
                      FollowRequestsDamagedScreen(model: model,),
                  );
                },
                child: Text(
                  'عرض التفاصيل',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration:TextDecoration.underline,
                  ),

                ),
              ),
            ],
          ),

        ),
      ),
  ),
);

Widget buildMissingItem(context, MissingthingsordersModel model) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: buildEnquiry(
        context,
        height: 100.0,
        state: model.isReplied ? model.isAccepted? StatusStates.ACCEPT : StatusStates.REJECT :StatusStates.WAITING,
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child:  Text(
                        model.missingthing,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  navigateTo(
                      context,
                      FollowRequestsLostScreen(model: model),
                  );
                },
                child: Text(
                  'عرض التفاصيل',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration:TextDecoration.underline,
                  ),

                ),
              ),
            ],
          ),

        ),
      ),
  ),
);

Widget buildRequestChangeRoomItem(context,RequestsTochangeRoomordersModel  model) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: buildEnquiry(
        context,
        height: 100.0,
        state: model.isReplied ? model.isAccepted? StatusStates.ACCEPT : StatusStates.REJECT :StatusStates.WAITING,
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child:  Text(
                       'رقم الغرفة: ${model.numofnextroom}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child:  Text(
                       'رقم الدور: ${model.floornumberofnextroom}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  navigateTo(
                      context,
                    FollowRequestsChangeRoomScreen(model: model,),
                  );
                },
                child: Text(
                  'عرض التفاصيل',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration:TextDecoration.underline,
                  ),

                ),
              ),
            ],
          ),

        ),
      ),
  ),
);

Widget buildEndorsementItem(context,EndorsementordersModel  model) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: buildEnquiry(
        context,
        height: 100.0,
        state: model.isReplied ? model.isAccepted? StatusStates.ACCEPT : StatusStates.REJECT :StatusStates.WAITING,
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child:  Text(
                        model.reason,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  navigateTo(
                      context,
                    FollowRequestsEndorsementScreen(model: model,),
                  );
                },
                child: Text(
                  'عرض التفاصيل',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration:TextDecoration.underline,
                  ),

                ),
              ),
            ],
          ),

        ),
      ),
  ),
);

Widget buildGuestItem(context,GuestordersModel  model) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: buildEnquiry(
        context,
        height: 100.0,
        state: model.isReplied ? model.isAccepted? StatusStates.ACCEPT : StatusStates.REJECT :StatusStates.WAITING,
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child:  Text(
                        'الأسم: ${model.NameofGuest}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child:  Text(
                        'تاريخ الأقامة: ${model.HostDate}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  navigateTo(
                      context,
                    FollowGuestRoomScreen(model: model,),
                  );
                },
                child: Text(
                  'عرض التفاصيل',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration:TextDecoration.underline,
                  ),

                ),
              ),
            ],
          ),

        ),
      ),
  ),
);

Widget buildLeftRoomItem(context, LeftRequestsordersModel model) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: buildEnquiry(
        context,
        height: 100.0,
        state: model.isReplied ? model.isAccepted? StatusStates.ACCEPT : StatusStates.REJECT :StatusStates.WAITING,
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child:  Text(
                      'سبب الأخلاء: ${model.reason}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: (){
                  navigateTo(
                      context,
                    FollowRequestsLeftRoomScreen(model: model,),
                  );
                },
                child: Text(
                  'عرض التفاصيل',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration:TextDecoration.underline,
                  ),

                ),
              ),
            ],
          ),

        ),
      ),
  ),
);

Widget buildBookingsRoomItem(context, BookingsordersModel model) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: buildEnquiry(
        context,
        height: 100.0,
        //todo isreplay not exist
        state: model.isReplied ? model.isAccepted? StatusStates.ACCEPT
            : StatusStates.REJECT
            :StatusStates.WAITING,
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child:  Text(
                      'رقم الغرفة: ${model.roomnumber}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: (){
                  navigateTo(
                      context,
                    FollowRequestsDetailsScreen(model:model),
                  );
                },
                child: Text(
                  'عرض التفاصيل',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration:TextDecoration.underline,
                  ),

                ),
              ),
            ],
          ),

        ),
      ),
  ),
);

Widget buildOrderShimmerScreen(context) => Column(
  children: [
    Shimmer.fromColors(
      child: Container(
        height: 50.0,
        width: double.infinity,
        color: baseColor,
      ),
      baseColor: baseColor,
      highlightColor: highlightColor,
    ),
    const SizedBox(height: 15.0),
    SizedBox(
      height: 215,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) =>
            buildRequestShimmerItem(context),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8.0,
        ),
        itemCount: 10,
      ),
    ),
    const SizedBox(
      height: 20.0,
    ),
    Shimmer.fromColors(
      child: Container(
        height: 50.0,
        width: double.infinity,
        color: baseColor,
      ),
      baseColor: baseColor,
      highlightColor: highlightColor,
    ),
    const SizedBox(height: 15.0),
    SizedBox(
      height: 215,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) =>
            buildRequestShimmerItem(context),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8.0,
        ),
        itemCount: 10,
      ),
    ),
    const SizedBox(
      height: 20.0,
    ),
  ],
);

Widget buildRequestShimmerItem(context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child:  Shimmer.fromColors(
        child: Container(
          height: 100.0,
          width: double.infinity,
          color: baseColor,
        ),
        baseColor: baseColor,
        highlightColor: highlightColor,
      ),
);

validation (context) {
  if(AppCubit.get(context).myOrdersModel!.Bookingsorders.isEmpty &&
      AppCubit.get(context).myOrdersModel!.Complaintsorders.isEmpty&&
      AppCubit.get(context).myOrdersModel!.Damagedthingsorders.isEmpty&&
      AppCubit.get(context).myOrdersModel!.Endorsementorders.isEmpty&&
      AppCubit.get(context).myOrdersModel!.leftRequestsorders.isEmpty&&
      AppCubit.get(context).myOrdersModel!.Missingthingsorders.isEmpty&&
      AppCubit.get(context).myOrdersModel!.RequestsTochangeRoomorders.isEmpty&&
      AppCubit.get(context).myOrdersModel!.Guestorders.isEmpty){
    return true;
  }
  return false;
}