import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/model/news_model.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class NewsDetailsScreen extends StatelessWidget {

   News model;
   NewsDetailsScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) => orientation == Orientation.portrait ? buildPortrait(context) :buildLandScape(context) ,
            ),
          ),
        );
      },
    );
  }
  Widget buildPortrait(context) => Column(
    children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children:  [
          Stack(
            alignment: Alignment.topLeft,
            children:  [
               Image(
                 width: double.infinity,
                height: 300.0,
                image: NetworkImage(
                  '${model.image}',
                ),
                 fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 42,left: 18),
                child: InkWell(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 14.0,
                        backgroundColor: backGround,
                      ),
                      SvgPicture.asset('assets/images/back_arrow.svg'),
                    ],
                  ),
                  onTap: () {
                    navigateTo(context, HomeScreen());
                  },
                ),
              )
            ],
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft:  Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                  color: ThemeCubit.get(context).darkTheme? backGroundDark : backGround,
                ),
              ),
              Container(
                height: 5.0,
                color: ThemeCubit.get(context).darkTheme? backGroundDark : backGround,
              ),
            ],
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          '${model.title}',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      const SizedBox(height: 18.0,),
      Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          // scrollDirection: Axis.vertical,
          // reverse: true,
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '${model.text}',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ),
    ],
  );

  Widget buildLandScape(context) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children:  [
             Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Image(
                height: 200.0,
                image: NetworkImage(
                  '${model.image}',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 42,left: 14),
              child: InkWell(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 14.0,
                      backgroundColor: backGround,
                    ),
                    SvgPicture.asset('assets/images/back_arrow.svg'),
                  ],
                ),
                onTap: () {
                  navigateTo(context, HomeScreen());
                },
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '${model.title}',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(height: 18.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '${model.text}',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: 14.0,
          ),
          ),
        ),
      ],
    ),
  );
}


