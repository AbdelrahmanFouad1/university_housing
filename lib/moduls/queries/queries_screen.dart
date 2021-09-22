import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

class QueriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(context: context),
        backgroundColor: backGround,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                defaultTitleBox(
                  img: 'assets/images/research.svg',
                  title: 'الاستعلامات',
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'اكتب طلب الاستعلام',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  height: 140.0,
                    child: whiteBoard(),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: defaultButton(
                      function: (){},
                      text: 'تقديم الطلب',
                      radius: 8.0,
                      height: 47,
                      btnColor: mainColors,
                      width: double.infinity
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'الاستعلامات السابقة',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildEnquiry (
                      context,
                      height: 122.0,
                      body: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 122.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'سؤال ؟',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 6.0,),
                                Text(
                                  'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص.',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      state: StatusStates.ACCEPT,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(height: 10.0,),
                    itemCount: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
