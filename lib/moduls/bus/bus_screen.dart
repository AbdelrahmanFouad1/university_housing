import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class BusScreen extends StatelessWidget {
  const BusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 20.0,
          automaticallyImplyLeading: false,
          title: Text(
            'مواعيد اتوبيسات السكن',
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            IconButton(
              icon:  SvgPicture.asset(
                'assets/images/back_arrow.svg',
                color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
              ),
              onPressed: () {
              Navigator.pop(context);
            },
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height:12.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                        'assets/images/bus.svg',
                    ),
                    const SizedBox(width: 12.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'موعد الخروج',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'موعد الوصول الي مبني S',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'موعد الوصول الي مبني M',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '8:30 AM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '8:45 AM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '9:00 AM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height:16.0),
              Container(
                width: double.infinity,
                height:1.0,
                color: separator,
              ),
              const SizedBox(height: 16.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/bus.svg',
                    ),
                    const SizedBox(width: 12.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'موعد الخروج',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'موعد الوصول الي مبني S',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'موعد الوصول الي مبني M',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '11:30 AM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '11:45 AM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '12:00 PM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height:16.0),
              Container(
                width: double.infinity,
                height:1.0,
                color: separator,
              ),
              const SizedBox(height: 16.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/bus.svg',
                    ),
                    const SizedBox(width: 12.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'موعد الخروج',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'موعد الوصول الي مبني S',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'موعد الوصول الي مبني M',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '1:30 PM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '1:45 PM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '2:00 PM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height:16.0),
              Container(
                width: double.infinity,
                height:1.0,
                color: separator,
              ),
              const SizedBox(height: 16.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/bus.svg',
                    ),
                    const SizedBox(width: 12.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'موعد الخروج',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'موعد الوصول الي مبني S',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'موعد الوصول الي مبني M',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '3:00 PM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '3:15 PM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '3:30 PM',
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height:16.0),
              Container(
                width: double.infinity,
                height:1.0,
                color: separator,
              ),
              const SizedBox(height: 16.0,),

            ],
          ),
        ),
      ),
    );
  }
}
