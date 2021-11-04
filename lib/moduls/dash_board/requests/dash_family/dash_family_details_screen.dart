import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashFamilyDetailsScreen extends StatelessWidget {
  var managerController = TextEditingController();
  var now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        var replyDate = DateFormat.yMMMd().format(now);
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'الأقرارات',
              context: context,
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    smallDashBoardTitleBox(
                      svgImage:  'assets/images/family.svg',
                      title: 'أقرارات ولي الأمر',
                      svg: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [

                          //code
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'رقم الإقرار :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'TTM52',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),

                          // name
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'الأسم :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'احمد سعيد علي محمد',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          //ID
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'رقم الطالب :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '42019006',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          //Room
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'رقم الغرفة :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '19',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          //Building
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'اسم المبنى :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'عماره الزهراء',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          //requestDate
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'تاريخ الإقرار :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Nov 12, 2021',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          //Student
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'سبب الإقرار',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          Container(
                            width: double.infinity,
                            height: 400.0,
                            decoration: BoxDecoration(
                              color:
                              ThemeCubit.get(context).darkTheme ? finesColorDark : Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.grey, width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: ThemeCubit.get(context).darkTheme
                                      ? Colors.black.withOpacity(0.5)
                                      : Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(5, 5), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  // reason
                                  Container(
                                    width: double.infinity,
                                    height: 170.0,
                                    decoration: BoxDecoration(
                                      color: ThemeCubit.get(context).darkTheme ? finesColorDark : Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Text(
                                        'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه. وهذا ما يجعله أول مولّد نص لوريم إيبسوم حقيقي على الإنترنت.',
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 180.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0,),
                                          image: DecorationImage(
                                            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/New_Norwegian_ID_Card_%282021%29_%28Front%29.png/640px-New_Norwegian_ID_Card_%282021%29_%28Front%29.png'),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 188.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          border: Border.all(color: Colors.grey, width: 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //managerReply
                          SizedBox(
                            height: 20.0,
                          ),
                          dashTextFormField(
                            controller: managerController,
                            type: TextInputType.text,
                            hint: 'الرد ...',
                            context: context,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: defaultButton(
                                  function: () {
                                    showToast(
                                        message: '${replyDate}',
                                        state: ToastStates.SUCCESS);
                                  },
                                  text: 'اوافق',
                                  btnColor: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: defaultButton(
                                  function: () {
                                    showToast(
                                        message: '${replyDate}',
                                        state: ToastStates.ERROR);
                                  },
                                  text: 'ارفض',
                                  btnColor: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
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
