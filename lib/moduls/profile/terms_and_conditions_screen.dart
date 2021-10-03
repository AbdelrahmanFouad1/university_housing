import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/shard/style/color.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backGround,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backGround,
            statusBarIconBrightness: Brightness.dark,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: backGround,
          elevation: 0.0,
          titleSpacing: 12.0,
          title: Text(
            'الشروط و الاحكام',
            style: TextStyle(
              fontSize: 20.0,
              color: mainColors,
            ),
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
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                      'شروط قبول الطلاب بالسكن الجامعي',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: mainColors
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    '1- ان يكون الطالب مقيدا منتظما بإحدى كليات المعهد سواء هندسه أو علوم حاسب أو أداره أعمال ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    '2- ألا يكون الطاب أو الطالبة من سكان مدينة العاشر من رمضان أو المراكزالقريبه منها و التي يرى مجلس أداره السكن الجامعي سهولة المواصلات منها وإليها ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    '3- ألا يكون قد صدر ضد الطالب أو الطالبة عقوبه تأديبية من المعهد في العام الجامعي السابق',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    '4- عدم التدخين نهائيا داخل أسوار المدينة الجامعية و جميع مرافقها , ومن يخالف ذلك يفصل فورا ويعرض للمسائله التأديبية ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    '5- ألا يكون مستحقا عليه مبالغ للمدينه الجامعيه في العام السابق أو أي مستحقات أخرى ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    '6- ألا يكون متزوجا أو موظفا في الحكومة او القطاع العام وفي حاله مخالفة ذلك يفصل فورا يعرض للمسائله القانونية والعقوبات التأديبية',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    ' 7- يعتبر الطالب متنازلا عن حقه في الأقامة بالمدينه إذ لم يسدد الرسوم المطلوبه خلال 3 أسابيع من تاريخ أعلان نتيجه قبوله في المدينة وفي خلاف ذلك يدفع غرامه 3% عن كل أسبوع تأخير بحد أقصى 25% ويتم حسابها من بعد الاسبوع الثالث من الدراسه لكل فصل دراسي',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    '8- تنتهي أقامه الطالب بالمدينه بإنتهاء أمتحانات العام الدراسي ويجوز أن يستمر في الأقامه خلال العطله الصيفيه إذا كانت ظروف دراسته تقتضي ذلك',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),


                SizedBox(height: 50.0,),
                Container(
                  width: double.infinity,
                  child: Text(
                    'النظام التأديبي للطلاب',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: mainColors
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    'يخضع الطلاب المقيمون بالمديمه الجامعية للنظامم التأديبي في حاله القيام بكلا من (التأخير خارج المدينة بعد المواعيد المقرره - أحداث ضوضاء في المدينه ومرافقيها - الظهور بملابس غير لائقة - تخطي الدور بالمطعم وعدم الألتزام بالنظام - العبث بأساس المبنى أو أساءه أستعماله) ويتم علي المراحل التالية',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    'المرحله الأولى : التنبيه كتابة مع أبلاغ ولى الأمر',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    'المرحله الثانيه : الأنذار بالحرمان من الأقامه مع أبلاغ ولى الأمر',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    'المرحله الثالثه : الحرمان المؤقت مدة تتراوح ما بين أبسوع او شهر مع أبلاغ ولى الأمر ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    'المرحله الرابعه: الحرمان النهائي مع أبلاغ ولى الأمر ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
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
