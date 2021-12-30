import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class AboutAppScreen extends StatelessWidget {
  var testData = [
    "	يوجد بالمدينه السكنيه ملعب لممارسة النشاط الرياضي (كرة قدم - تنس طاوله) .",
    "يوجد بالمدينه نادي إجتماعي لإستقبال الطلاب واولياء الامور  وممارسة الشطرنج ومشاهدة التلفاز . ",
    "يوجد بالمدينه خدمة انترنت لخدمة الطلاب و توفير متطلباتهم للعمليه التعليميه وتجهيز والتقارير والرسومات الهندسيه . ",
    "	يوجد بالمدينه رعاية طبيه  لخدمة الطلاب والحفاظ على سلامتهم لمواجهة الطوارئ .",
    "	يوجد بالمدينه اعمال نظافه للعمارات السكنيه على مدار الاسبوع وغسيل العمارات وتوفير ادوات النظافه للطلاب .",
    "	يوجد بالمدينه كافيتريا لتجهيز الوجبات وتوفير الأطعمه  والمشروبات للطلاب .",
    "	يوجد بالمدينه أفراد أمن على اعلى مستوى لحماية الطلاب والحفاظ على العمارات السكنيه .",
    "	يوجد بالمدينه السكنيه مسجد لكل مبنى(دار الضيافه – الاسكان) .",
  ];

  AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = testData.map((x) => "• $x\n").reduce((x, y) => "$x$y");
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 12.0,
          title: Text(
            'خدماتنا',
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
                    color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'عن التطبيق :',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    'يستخدم تطبيق الاسكان الجامعي في تسهيل الاجرائات اللازمه لتسكين الطلاب بالمعهد مع توافر كافه السبل والخدمات لراحتهم , حيث يتيح ما يلي :يستخدم تطبيق الاسكان الجامعي في تسهيل الاجرائات اللازمه لتسكين الطلاب بالمعهد مع توافر كافه السبل والخدمات لراحتهم , حيث يتيح ما يلي :',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: ThemeCubit.get(context).darkTheme? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    child: Text(
                      '• اختيار الطالب للغرفه المناسبه له (عادي - مميز)\n• تغيير الغرفه او متعلقاتها\n• سهوله التواصل مع المشرفين وشؤن الطلاب في حاله وجود شكوى\n• سهوله التقديم علي استضافه (صديق - قريب ) في حاله اتمام الاجرائات اللازمه\n• معرفه المصاريف اللازمه للسكن مع اتاحه دفعها الكترونيا عبر حسابك بالتطبيق \n• معرفه الغرامات بتفاصيلها ( في حاله وجود غرامات )\n• متابعه-من كل من ( الامن - المشرفين – شؤن الطلاب ) لضمان كافه وسائل الأمان\n• معرفه مواعيد الباصات الخاصه بالمعهد مع ظهور اشعارات بها لسهوله التنقل من والي المعهد والسكن ',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: ThemeCubit.get(context).darkTheme? Colors.white : Colors.black,
                      ),
                    )),
                const SizedBox(height: 20.0,),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'عن خدمات الاسكان الطلابي :',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child:  Text(
                    'وفرت إدارة المعهد مجموعـة من العمارات السكـنية بالإضافـة الى مبنى للإسكـان المتميز " مبنى دار الضيافة " للطلاب وكذلك عمارات خاصة بإسكان الطالبات وتم تذويدها بالاثاث اللازم وتشطيبها على اعلى مستوى كما تضم المدينه ملعبا لكرة القدم  وقاعة لتنس الطاوله وكذلك نادي إجتماعي للطلاب والطالبات لممارسة الانشطه الطلابية وبه شاشات عرض لمتابعة البرامج التليفزيونيه ومباريات كرة القدم كما يوجد كافيتريا لتقديم الوجبات الساخنة والمشروبات للطلاب كما توفر المدينه السكنية اتوبيسات لنقل الطلاب والطالبات من والى المعهد يوميا  ويشرف على المدينة السكنيه مجموعة من الاخصائيون الاجتماعيون لحل المشكلات التي تواجه الطلاب اثناء إقامتهم بالمدينة السكنية اولاً بأول.',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: ThemeCubit.get(context).darkTheme? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  child: Text(
                    '• الإسكان العادي',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child:  Text(
                    'ويتكون من مجموعة من العمارات السكنيه موزعه كالاتي :\n - عدد 10 عمارة خاصة بالطلاب كل عمارة بها عدد 10 شقق  كل شقه عدد 5 غرف بالاضافة الى مطبخ + 2 حمام  لكل طالب غرفه منفصله بمفرده . \n - عدد 1 عمارة بها عدد 10 شقق بكل شقه 3 غرف + مطبخ + حمام  عدد 1 عمارة خاصة بالساده اعضاء هيئة التدريس والهيئة المعاونة والعاملين مقيمين بها .',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: ThemeCubit.get(context).darkTheme? Colors.white : Colors.black,
                      ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  child: Text(
                    '• الإسكان المتميز  " دار الضيافة "',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    ' ويتكون من عدد 108 غرفه ملحق بكل غرفة  حمام خاص + البلكونه + اوفيس يقيم بكل غرفة عدد 2 طلاب .\n كما يوجد بالمبنى نادي إجتماعي وشاشة عرض  وخدمة انترنت بسرعة محدودة بالمبنى  وتنس طاولة لشغل اوقات فراغ الطلاب كما يوجد قاعة إنتظار للزائرين.',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: ThemeCubit.get(context).darkTheme? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  child: Text(
                    '• إسكان الطالبات ',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child:  Text(
                    ' عدد 2 عمارة   " عمارة 62  - عمارة الصفوة " \n -عدد 1 عمارة ال62 عبارة عن 5 ادوار كل دور به عدد 4 شقق بكل شقة عدد 3 غرف بالإضافة الى حمام + مطبخ   .كما يوجد به نادي إجتماعي للطالبات وقاعة إنتظار للزائرين.\n -عدد 1 عمارة الصفوة عبارة عن دورين  بكل دور به عدد 19 غرفة زوجي للطالبات بالإضافة الى عدد 2 حمام مجمع + اوفيس . ',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: ThemeCubit.get(context).darkTheme? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'الخدمات المقدمه للطلاب في الاسكان الطلابي :',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    data,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: ThemeCubit.get(context).darkTheme? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
