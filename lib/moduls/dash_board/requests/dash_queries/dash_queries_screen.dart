import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/queries_model.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_queries/dash_queries_details_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashQueriesScreen extends StatelessWidget {


  final List<QueriesModel> queriesItem = [
    QueriesModel(
      code: 'TTR52',
      name: 'أحمد الغندور علي',
      id: '42020111',
      buildingName: 'أسكان مميز (أ)',
      isReplied: false,
      managerReply: '',
      replyDate: 'Nov 2,2021',
      room: '203',
      queriesDate: 'Nov 2,2021',
      StudentQueries: 'أمته اقدر ادفع المصاؤف ؟'
    ),
    QueriesModel(
      code: 'Rm520',
      name: 'أمنيه سيد مصطفي',
      id: '42019336',
      buildingName: 'أسكان مميز (أ)',
      isReplied: true,
      managerReply: 'لا خلاص كده كله متسجل عندنا لو دفعتي عن طريق الابلكيشن بتاع السكن',
      replyDate: 'Nov 2,2021',
      room: '14',
      queriesDate: 'Nov 2,2021',
      StudentQueries: 'لو دفعت عن طريق الانترنت .. هبقا مضطره اجيب الوصل بردو ؟'
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'الأستعلامات',
              context: context,
              action: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                width: 30.0,
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: ThemeCubit.get(context).darkTheme
                        ? mainTextColor
                        : mainColors,
                  ),
                  onPressed: () {
                    ThemeCubit.get(context).changeTheme();
                  },
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/research.svg',
                        svg: true,
                        title: 'الاستعلامات'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 500.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: ListView.separated(
                        padding: EdgeInsetsDirectional.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => ComplaintsItem(
                            item: queriesItem[index],
                            cubit: cubit,
                            context: context,
                            index: index,
                        ),
                        separatorBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: queriesItem.length,
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


Widget ComplaintsItem({
  required BuildContext context,
  required DashBoardCubit cubit,
  required QueriesModel item,
  required int index,
}) {
  var codeController = TextEditingController();
  var nameController = TextEditingController();
  codeController.text = item.code!;
  nameController.text = item.name!;
  return InkWell(
    onTap: (){
      cubit.savingCurrentQueriesModel(item);
      if(currentQueriesModel != null){
        navigateTo(context, DashQueriesDetailsScreen());
      }
    },
    child: Row(
      children: [
        Expanded(
          child: Text(
            item.name!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
          child: Text(
            item.code!,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 30.0,
          height: 30.0,
          child: IconButton(
            onPressed: () {
              cubit.savingCurrentQueriesModel(item);
              if(currentQueriesModel != null){
                navigateTo(context, DashQueriesDetailsScreen());
              }
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: ThemeCubit
                  .get(context)
                  .darkTheme
                  ? mainTextColor
                  : mainColors,
            ),
          ),
        ),
      ],
    ),
  );
}


