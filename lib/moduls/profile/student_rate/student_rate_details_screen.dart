import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/model/get_reviews_model.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class StudentRateDetailsScreen extends StatelessWidget {
  StudentRateDetailsScreen({
    Key? key,
    required this.review,
  }) : super(key: key);

  Reviews review;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 12.0,
                title: Text(
                  'المزيد',
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
                          color: ThemeCubit.get(context).darkTheme
                              ? mainTextColor
                              : mainColors,
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
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 550.0,
                        decoration: BoxDecoration(
                          color: evaluation,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Builder(builder:(context){
                                    if(review.user == null){
                                      return CircleAvatar(
                                        radius: 30.0,
                                        backgroundColor: ThemeCubit.get(context).darkTheme
                                            ? mainTextColor
                                            : mainColors,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 80.0,
                                          child: Icon(Icons.error,
                                            color: ThemeCubit.get(context).darkTheme
                                                ? mainColors
                                                : mainTextColor,
                                          ),
                                        ),
                                      );
                                    }else{
                                      if(review.user!.image != null){
                                        return CircleAvatar(
                                          radius: 30.0,
                                          backgroundColor: ThemeCubit.get(context).darkTheme
                                              ? mainTextColor
                                              : mainColors,
                                          backgroundImage: NetworkImage(
                                            review.user!.image,
                                          ),
                                        );
                                      }else{
                                        return CircleAvatar(
                                          radius: 30.0,
                                          backgroundColor: ThemeCubit.get(context).darkTheme
                                              ? mainTextColor
                                              : mainColors,
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 80.0,
                                            child: Icon(Icons.error,
                                              color: ThemeCubit.get(context).darkTheme
                                                  ? mainColors
                                                  : mainTextColor,
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  }),

                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        review.user!= null ? review.user!.username : 'فارغ',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: mainColors,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        review.user!= null ? review.user!.id.toString(): 'فارغ',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: mainColors,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RatingBar.builder(
                                      textDirection: TextDirection.ltr,
                                      allowHalfRating: false,
                                      initialRating: double.parse(review.rating.toString()),
                                      itemSize: 10.0,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      ignoreGestures: true,
                                      onRatingUpdate: (rating) {
                                        // print(rating);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 400.0,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Text(
                                    review.comment,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: mainColors,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
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
      ),
    );
  }
}
