import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/model/news_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

import 'add_news_screen.dart';
import 'news_dash_details_screen.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {
        if (state is DelNewsSuccessStates) {
          Navigator.pop(context);
        }
        if (state is DelNewsLoadingStates) {
          showDialog<void>(
              context: context,
              builder: (context) => waitingDialog(context: context));
        }
        if (state is DelNewsErrorStates) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'أخبار المعهد',
              context: context,
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Builder(
                  builder: (context) {
                    if (state is GetNewsLoadingStates) {
                      return Container(
                          width: double.infinity,
                          height: 300.0,
                          child: Center(child: CircularProgressIndicator()));
                    } else {
                      return Column(
                        children: [
                          defaultDashBoardTitleBox(
                              img: 'assets/images/newspaper.png',
                              title: 'أخبار المعهد'),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: double.infinity,
                            height: 1.0,
                            color: separator,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultButton(
                            text: 'إضافة خبر جديد',
                            function: () {
                              navigateTo(context, AddNewsScreen());
                            },
                            btnColor: mainColors,
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => buildNewsItem(
                                context: context,
                                model: cubit.newsModel!.news[index],
                                cubit: cubit),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 16,
                            ),
                            itemCount: cubit.newsModel!.news.length,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildNewsItem({
  context,
  required News model,
  required DashBoardCubit cubit,
}) {
  DateTime tempDate =
      new DateFormat("yyyy-MM-dd").parse(model.updatedAt!);
  String date = tempDate.toString().substring(0, 10);

  return Dismissible(
    direction: DismissDirection.startToEnd,
    resizeDuration: Duration(milliseconds: 200),
    onDismissed: (direction) {
      cubit.DeleteNews(id: model.idDB!);
    },
    background: Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadiusDirectional.circular(8.0),
      ),
      padding: EdgeInsets.all(5.0),
      alignment: AlignmentDirectional.centerStart,
      child: Icon(
        Icons.delete_forever,
        color: Colors.white,
      ),
    ),
    key: UniqueKey(),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(
          8.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120.0,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CachedNetworkImage(
                imageUrl: '${model.image}',
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>  Container(
                  alignment: Alignment.center,
                    height: 80.0,
                    child: Icon(Icons.error,
                      color: ThemeCubit.get(context).darkTheme
                          ? mainTextColor
                          : mainColors,),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 80.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${model.title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            date,
                            style: TextStyle(
                              color: separator,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            child: Text(
                              'عرض المزيد',
                              style:
                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                            ),
                            onTap: () {
                              navigateTo(
                                  context,
                                  NewsDashDetailsScreen(
                                    model: model,
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
