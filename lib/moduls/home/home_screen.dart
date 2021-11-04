import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:university_housing/model/news_model.dart';
import 'package:university_housing/moduls/booking_room/booking_room1_screen.dart';
import 'package:university_housing/moduls/complaints/choose_complaints_screen.dart';
import 'package:university_housing/moduls/family_report/family_report_screen.dart';
import 'package:university_housing/moduls/news_details/news_details_screen.dart';
import 'package:university_housing/moduls/queries/queries_screen.dart';
import 'package:university_housing/moduls/requests/choose_request_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';

class MainModel {
  late String image;
  late String title;

  MainModel({
    required this.image,
    required this.title,
  });
}

class HomeScreen extends StatelessWidget {

  DateTime timeBackPressed = DateTime.now();
  final bool? isRegister;

  List<MainModel> requests = [
    MainModel(
      image: 'assets/images/request.svg',
      title: 'الطلبات',
    ),
    MainModel(
      image: 'assets/images/review.svg',
      title: 'شكاوى وبلاغات',
    ),
    MainModel(
      image: 'assets/images/family.svg',
      title: 'اقرارات ولى الامر',
    ),
    MainModel(
      image: 'assets/images/research.svg',
      title: 'استعلامات',
    ),
  ];

  HomeScreen({Key? key, this.isRegister}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {
        if(state is GetProfileSuccessStates){
          AppCubit.get(context).getNews();
        }
      },
      builder: (BuildContext context, Object? state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: defaultAppBar(context: context, showBus: true, pop: false, state: state),
            body: WillPopScope(
              onWillPop:  () async {
                final difference = DateTime.now().difference(timeBackPressed);
                final isExitWarning = difference >= const Duration(seconds: 2);
                timeBackPressed = DateTime.now();
                if(isExitWarning){
                  showToast(
                      message: 'اضغط مرة أخرى للخروج من البرنامج',
                      state: ToastStates.WARNING);
                  return false;
                } else {
                  return true;
                }
              },
              child: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) => orientation == Orientation.portrait
                        ? buildPortrait(context, AppCubit.get(context).profileModel != null? AppCubit.get(context).profileModel!.isresident : null, state)
                        : buildLandScape(context, AppCubit.get(context).profileModel != null? AppCubit.get(context).profileModel!.isresident : null, state),
              ),
            ),
          ),
        );
      },

    );
  }

  Widget buildRequestsList(MainModel model, context, index) => InkWell(
    onTap: () {
      if(index == 0){
        navigateTo(context, const ChooseRequestScreen());
        // AppCubit.get(context).getProfileData();
      }
      else if(index == 1){
        navigateTo(context, ChooseComplaintsScreen());
      }
      else if(index == 2){
        navigateTo(context,  FamilyReportScreen());
      }
      else {
        navigateTo(context,  QueriesScreen());
        AppCubit.get(context).getQueriesData();
      }
    },
    child: Container(
      width: 120.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                model.image,
                semanticsLabel: 'request',
                width: 45.0,
                height: 45.0,
              ),
              Text(
                model.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            color: boxColor,
          ),
        ),
  );

  Widget buildNewsItem(context, News model) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 128.0,
        height: 80.0,
        // child: FadeInImage(
        //   image: NetworkImage(
        //     '${model.image}',
        //   ),
        //   fit: BoxFit.cover,
        //   placeholder: const AssetImage('assets/images/room.png'),
        // ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          image: DecorationImage(
            image: NetworkImage(
              '${model.image}',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            height: 70.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.title}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: double.infinity,
                  child: InkWell(
                    child: Text(
                      'عرض المزيد',
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      navigateTo(context,  NewsDetailsScreen(model: model,));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );

  Widget buildNewsShimmerItem(context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Shimmer.fromColors(
        child: Container(
          height: 80.0,
          width: 128.0,
          color: baseColor,
        ),
        baseColor: baseColor,
        highlightColor:highlightColor,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            height: 70.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    child: Container(
                      height: 14.0,
                      color: baseColor,
                    ),
                    baseColor: baseColor,
                    highlightColor:highlightColor,
                  ),
                  Spacer(),
                  Shimmer.fromColors(
                    child: Container(
                      height: 14.0,
                      color: baseColor,
                    ),
                    baseColor: baseColor,
                    highlightColor:highlightColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );

  Widget buildPortrait(context, isRegister, state) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      children: [
            Builder(builder: (context) {
              if(isRegister == null){
                return Column(
                  children: [
                    Shimmer.fromColors(
                      child: Container(
                        height: 120.0,
                        width: double.infinity,
                        color: baseColor,
                      ),
                      baseColor: baseColor,
                      highlightColor:highlightColor,
                    ),
                    const SizedBox(height: 4.0,),
                    buildFinesBox(context),
                  ],
                );
              }else{
                if (isRegister) {
                  return Column(
                    children: [
                      Container(
                        height: 120.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              buildRequestsList(requests[index], context, index),
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            width: 12,
                          ),
                          itemCount: requests.length,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          'غرامات الطالب',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      buildFinesBox(context),
                    ],
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      navigateTo(context, BookingRoom1Screen());
                      // AppCubit.get(context).getProfileData();
                    },
                    child: defaultTiTleBoxColumn(
                        img: 'assets/images/request.svg',
                        title: 'طلب الالتحاق بالسكن',
                        height: 122.0,
                        widthImage: 50.0,
                        heightImage: 50.0),
                  );
                }
              }
            }),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'اخبار عن السكن',
                style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => AppCubit.get(context).newsModel != null? buildNewsItem(context, AppCubit.get(context).newsModel!.news[index]) : buildNewsShimmerItem(context),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            itemCount: AppCubit.get(context).newsModel != null? AppCubit.get(context).newsModel!.news.length : 8,
          ),
        ),
      ],
    ),
  );

  Widget buildLandScape(context, isRegister, state) =>  Builder(
    builder: (context) {
      if(isRegister == null){
        return Row(
          children: [
            Shimmer.fromColors(
              child: Container(
                width: 140.0,
                height: double.infinity,
                color: baseColor,
              ),
              baseColor: baseColor,
              highlightColor:highlightColor,
            ),
            const SizedBox(width: 5.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    child: Container(
                      height: 87.0,
                      width: double.infinity,
                      color: baseColor,
                    ),
                    baseColor: baseColor,
                    highlightColor:highlightColor,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Shimmer.fromColors(
                    child: Container(
                      height: 14.0,
                      width: double.infinity,
                      color: baseColor,
                    ),
                    baseColor: baseColor,
                    highlightColor:highlightColor,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Expanded(
                    child:  Shimmer.fromColors(
                      child: Container(
                        height: 87.0,
                        width: double.infinity,
                        color: baseColor,
                      ),
                      baseColor: baseColor,
                      highlightColor:highlightColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }else{
        if (isRegister) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  width: 140.0,
                  height: double.infinity,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildRequestsList(requests[index], context, index),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12.0,
                    ),
                    itemCount: requests.length,
                  ),
                ),
                const SizedBox(width: 5.0,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildFinesBox(context),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          'اخبار عن السكن',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => buildNewsItem(context, AppCubit.get(context).newsModel!.news[index]),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          itemCount: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }else{
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    navigateTo(context, BookingRoom1Screen());
                  },
                  child: defaultTiTleBoxColumn(
                    img: 'assets/images/request.svg',
                    title: 'طلب الالتحاق بالسكن',
                    width: 120.0,
                    widthImage: 50.0,
                    heightImage: 50.0,
                    fontSize: 12.0,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          'اخبار عن السكن',
                          style: TextStyle(
                            color: mainColors,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => buildNewsItem(context, AppCubit.get(context).newsModel!.news[index]),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          itemCount: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }
    }
  );

}
