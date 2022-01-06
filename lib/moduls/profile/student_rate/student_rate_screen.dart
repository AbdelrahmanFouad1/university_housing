import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/model/get_reviews_model.dart';
import 'package:university_housing/moduls/profile/student_rate/student_rate_details_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class StudentRateScreen extends StatelessWidget {
  StudentRateScreen({Key? key}) : super(key: key);

  var commentController = TextEditingController();
  double rate = 0 ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is PostQueriesLoadingStates){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }else if(state is GetQueriesSuccessStates){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 12.0,
              title: Text(
                'تقييم الطلاب',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'اضف تقييمك',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const Spacer(),
                        RatingBar.builder(
                          textDirection: TextDirection.ltr,
                          allowHalfRating: false,
                          initialRating: rate,
                          minRating: 1,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            rate = rating;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        whiteBoard(
                          context,
                          height: 130.0,
                          maxLine: 2,
                          controller: commentController,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: defaultButton(
                              btnColor: mainColors,
                              text: 'أضف',
                              fontSize: 16.0,
                              width: 80.0,
                              height: 30.0,
                              function: () {
                                if (cubit.profileModel!.isresident == false) {
                                  showToast(
                                      message: 'غير مصرح لك إضافة تقييم حاليا',
                                      state: ToastStates.WARNING);
                                }else{
                                  if(commentController.text.isEmpty){
                                    showToast(message: 'أدخل التقييم اولا', state: ToastStates.ERROR);
                                  }else if(rate == 0){
                                    showToast(message: 'أدخل عدد النجوم', state: ToastStates.ERROR);
                                  }else{
                                    cubit.postReviews(
                                        comment: commentController.text,
                                        rate: rate
                                    );
                                    commentController.text = '';
                                    rate = 0;
                                  }
                                }
                              }),
                        ),

                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    if(cubit.reviews.isNotEmpty)
                    SizedBox(
                      height: 180.0,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildEvaluationItem(
                            cubit, context, cubit.reviews[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 8.0,
                        ),
                        itemCount: cubit.reviews.length,
                      ),
                    ),
                    if(cubit.reviews.isEmpty)
                      Center(
                        child: Text(
                          'لا يوجد تقييمات سابقة حاليا !!',
                          style: Theme.of(context).textTheme.headline6,
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

Widget buildEvaluationItem(
  AppCubit cubit,
  context,
  Reviews review,
) =>
    Container(
      width: 300.0,
      decoration: BoxDecoration(
        color: evaluation,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
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
                        radius: 25.0,
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
                          radius: 25.0,
                          backgroundColor: ThemeCubit.get(context).darkTheme
                              ? mainTextColor
                              : mainColors,
                          backgroundImage: NetworkImage(
                            review.user!.image,
                          ),
                        );
                      }else{
                        return CircleAvatar(
                          radius: 25.0,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.user!= null ? review.user!.username : 'فارغ',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: mainColors,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        review.user!= null ? review.user!.id.toString(): 'فارغ',
                        style: TextStyle(
                          fontSize: 12.0,
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              width: 280.0,
              child: Text(
                review.comment,
                style: TextStyle(
                  fontSize: 12.0,
                  color: mainColors,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                navigateTo(context, StudentRateDetailsScreen(
                review: review,
                ));
              },
              child: SizedBox(
                width: 280.0,
                child: Text(
                  'المزيد',
                  style: TextStyle(
                    color: mainColors,
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
