import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
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
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: backGround,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 120.0,
              child: Directionality(
                textDirection:  TextDirection.rtl,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildRequestsList(requests[index]),
                    separatorBuilder:(context, index) => const SizedBox(width: 12,),
                    itemCount: requests.length,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                'غرامات الطالب',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: mainColors,
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
                color: finesColor,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/hand.svg',
                    semanticsLabel: 'fine',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRequestsList(MainModel model) => Container(
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
          textDirection: TextDirection.rtl,
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
  );
}
