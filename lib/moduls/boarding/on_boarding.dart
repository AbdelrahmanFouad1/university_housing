import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:university_housing/moduls/login/login_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';


class BoardingModel {
  late String image;
  late String title;
  late String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/boarding1.png',
      title: 'إختيار السكن',
      body: 'يمكنك إختيار الغرفه بمفردك او مع صديقك المفضل في السكن المناسب لك بكل سهوله.',
    ),
    BoardingModel(
      image: 'assets/images/boarding2.png',
      title: 'الأمن والحماية',
      body: 'السكن الجامعي مجهز بجميع وسائل الامان من افراض الأمن للحمايه والخدمات الطبية والخدمات الأخرى.',
    ),
    BoardingModel(
      image: 'assets/images/boarding3.png',
      title: 'وسائل النقل',
      body: 'التنقل متاح من وإلي المعهد في جميع الأوقات مع مراعاه توفير الراحه والهدوء اثناء التنقل.',
    ),
    BoardingModel(
      image: 'assets/images/boarding4.png',
      title: 'الحياه السكنيه',
      body: 'توفير بيئه مناسبه لمتابعه جميع النشاطات الدراسيه اليوميه الخاصه باليوم الدراسي الجامعي.',
    ),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      navigateAndFinish(
        context,
         LoginScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        backgroundColor: backGround,
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: Text(
              'تخطى',
              style: TextStyle(
                color: mainColors
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: mainColors,
                    dotHeight: 8,
                    expansionFactor: 2.5,
                    dotWidth: 8,
                    spacing: 3.0,
                  ),
                ),
                const Spacer(),
                if(isLast == false)
                  FloatingActionButton(
                  backgroundColor: mainColors,
                  onPressed: () {
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                  },
                  child: const Icon(
                    IconBroken.Arrow___Right_2,
                  ),
                )
                else
                  Container(
                    height: 52.0,
                    child: MaterialButton(
                        onPressed:() {
                          submit();
                        },
                        child: const Text(
                          'أبدء',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo_semiBold',
                          ),
                        ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        28.0,
                      ),
                      color: mainColors,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 3,
        child: Image(
          image: AssetImage(model.image),
        ),
      ),
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                model.title,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: mainColors,
                ),
              ),
              width: double.infinity,
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              child: Text(
                model.body,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'cairo_semiBold',
                ),
              ),
              width: double.infinity,
            ),
          ],
        ),
      ),
    ],
  );
}
