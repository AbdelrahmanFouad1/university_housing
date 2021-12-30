import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/get_dash_security_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';

class SecurityDetailsScreen extends StatelessWidget {
  SecurityDetailsScreen({Key? key ,
  required this.item}) : super(key: key);

GetDashSecurityModel item;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'إداره الأمن',
              context: context,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultDashBoardTitleBox(
                        img: 'assets/images/security.png',
                        title: 'التفاصيل'
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.username,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.id.toString(),
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: separator,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          securityItem(
                            item: item.exitAndEnters[index],
                            cubit: cubit,
                            context: context,
                          ),
                      separatorBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        width: double.infinity,
                        height: 1.0,
                        color: separator,
                      ),
                      itemCount: item.exitAndEnters.length,
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

Widget securityItem({
  required context,
  required DashBoardCubit cubit,
  required Details item,
}) {
  var exitDateController = TextEditingController();
  var exitTimeController = TextEditingController();
  var enterDateController = TextEditingController();
  var enterTimeController = TextEditingController();
  var notesController = TextEditingController();

  exitDateController.text = item.exitDate;
  exitTimeController.text = item.exitAt;
  enterDateController.text = item.enterDate;
  enterTimeController.text = item.enterAt;
  notesController.text = item.notes;
  return Column(
    children: [
      //exitDate
      Row(
        children: [
          Expanded(
            child: Text(
              '- تاريخ الخروج :',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
            ),
          ),
          switchedTextFormField(
            context: context,
            cubit: cubit,
            controller: exitDateController,
          ),
        ],
      ),
      const SizedBox(
        height: 5.0,
      ),

      // exitAt
      Row(
        children: [
          Expanded(
            child: Text(
              '- وقت الخروج :',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
            ),
          ),
          switchedTextFormField(
            context: context,
            cubit: cubit,
            controller: exitTimeController,
          ),
        ],
      ),
      const SizedBox(
        height: 5.0,
      ),


      // enterDate
      Row(
        children: [
          Expanded(
            child: Text(
              '- تاريخ الدخول :',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
            ),
          ),
          switchedTextFormField(
            context: context,
            cubit: cubit,
            controller: enterDateController,
          ),
        ],
      ),
      const SizedBox(
        height: 5.0,
      ),


      // enterAt
      Row(
        children: [
          Expanded(
            child: Text(
              '- وقت الدخول :',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
            ),
          ),
          switchedTextFormField(
            context: context,
            cubit: cubit,
            controller: enterTimeController,
          ),
        ],
      ),
      const SizedBox(
        height: 5.0,
      ),


      // notes
      Row(
        children: [
          Expanded(
            child: Text(
              '- الملاحظات :',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
            ),
          ),
          switchedTextFormField(
            context: context,
            cubit: cubit,
            controller: notesController,
          ),
        ],
      ),
      const SizedBox(
        height: 5.0,
      ),


    ],
  );
}


