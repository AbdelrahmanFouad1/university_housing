import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/shard/components/components.dart';
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

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(showBus: true),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) => orientation == Orientation.portrait ? buildPortrait() :buildLandScape() ,
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

  Widget buildNewsItem() => Row(
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
                  child: Text(
                    'عرض المزيد',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12.0,
                        color: mainColors),
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
                                buildRequestsList(requests[index]),
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
                        Container(
                          width: double.infinity,
                          height: 87.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            color: finesColor,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 6.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'لديك غرامة بقيمة',
                                      style: TextStyle(
                                        color: mainColors,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      '120 جنيه مصرى',
                                      style: TextStyle(
                                          color: mainColors,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 60.0, bottom: 10.0),
                                    child: defaultButton(
                                      function: () {},
                                      text: 'عرض التفاصيل',
                                      fontSize: 12.0,
                                      height: 30.0,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/hand.svg',
                                    semanticsLabel: 'fine',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
                itemBuilder: (context, index) => buildNewsItem(),
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
                      buildRequestsList(requests[index]),
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
                    Container(
                      width: double.infinity,
                      height: 87.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        color: finesColor,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 6.0),
                            child: Column(
                              children: [
                                Text(
                                  'لديك غرامة بقيمة',
                                  style: TextStyle(
                                    color: mainColors,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  '120 جنيه مصرى',
                                  style: TextStyle(
                                      color: mainColors,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 60.0, bottom: 10.0),
                                child: defaultButton(
                                  function: () {},
                                  text: 'عرض التفاصيل',
                                  fontSize: 12.0,
                                  height: 30.0,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images/hand.svg',
                                semanticsLabel: 'fine',
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                        itemBuilder: (context, index) => buildNewsItem(),
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
                        itemBuilder: (context, index) => buildNewsItem(),
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
