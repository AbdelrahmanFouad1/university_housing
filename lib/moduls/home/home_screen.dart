import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/moduls/complaints/choose_complaints_screen.dart';
import 'package:university_housing/moduls/family_report/family_report_screen.dart';
import 'package:university_housing/moduls/news_details/news_details_screen.dart';
import 'package:university_housing/moduls/queries/queries_screen.dart';
import 'package:university_housing/moduls/requests/choose_request_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/cubit.dart';
import 'package:university_housing/shard/cubit/states.dart';
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
  bool isRegister = true;
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


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: defaultAppBar(context: context, showBus: true, pop: false),
              body: WillPopScope(
                onWillPop:  () async {
                  final difference = DateTime.now().difference(timeBackPressed);
                  final isExitWarning = difference >= const Duration(seconds: 2);
                  timeBackPressed = DateTime.now();
                  if(isExitWarning){
                    showToast(message: 'اضغط مرة أخرى للخروج من البرنامج', state: ToastStates.WARNING);
                    return false;
                  }else{
                    return true;
                  }
                },
                child: OrientationBuilder(
                  builder: (BuildContext context, Orientation orientation) => orientation == Orientation.portrait ? buildPortrait() :buildLandScape() ,
                ),
              ),
            ),
          );
        },

      ),
    );
  }

  Widget buildRequestsList(MainModel model, context, index) => InkWell(
    onTap: () {
      if(index == 0){
        navigateTo(context, ChooseRequestScreen());
      }
      else if(index == 1){
        navigateTo(context, ChooseComplaintsScreen());
      }
      else if(index == 2){
        navigateTo(context, FamilyReportScreen());
      }
      else {
        navigateTo(context, QueriesScreen());
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

  Widget buildNewsItem(context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 128.0,
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          image: const DecorationImage(
            image: NetworkImage(
                'https://image.freepik.com/free-photo/swimming-pool-beach-luxury-hotel-outdoor-pools-spa-amara-dolce-vita-luxury-hotel-resort-tekirova-kemer-turkey_146671-18751.jpg'),
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
              children: [
                Text(
                  'وفرت إدارة المعهد مجموعـة من العمارات السكـنية بالإضافـة الى مبنى للإسكـا ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.0, color: mainColors),
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
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 12.0,
                          color: mainColors),
                    ),
                    onTap: () {
                      navigateTo(context, NewsDetailsScreen());
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

  Widget buildPortrait() => Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
                Builder(builder: (context) {

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
                            style: TextStyle(
                              color: mainColors,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        buildFinesBox(context),
                      ],
                    );
                  } else {
                    return defaultTiTleBoxColumn(
                        img: 'assets/images/request.svg',
                        title: 'طلب الالتحاق بالسكن',
                        height: 122.0,
                        widthImage: 50.0,
                        heightImage: 50.0);
                  }
                }),
                const SizedBox(
                  height: 16.0,
                ),
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
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildNewsItem(context),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemCount: 8,
              ),
            ),
          ],
        ),
      ),
      SvgPicture.asset(
        'assets/images/layer2.svg',
        semanticsLabel: 'layer',
        fit: BoxFit.cover,
      ),
    ],
  );

  Widget buildLandScape() =>  Builder(
    builder: (context) {
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
                        style: TextStyle(
                          color: mainColors,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildNewsItem(context),
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
              defaultTiTleBoxColumn(
                img: 'assets/images/request.svg',
                title: 'طلب الالتحاق بالسكن',
                width: 120.0,
                widthImage: 50.0,
                heightImage: 50.0,
                fontSize: 12.0,
                mainAxisAlignment: MainAxisAlignment.center,
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
                        itemBuilder: (context, index) => buildNewsItem(context),
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
  );

}
