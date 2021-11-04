import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:university_housing/model/profile_model.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';

class FinesScreen extends StatelessWidget {
 const FinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: defaultAppBar(
              context: context,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/wallet.svg',
                            width: 50.0,
                            height: 50.0,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'تفاصيل الغرامات',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        '* يجب مراعاه اضافه الغرامات للمصاريف الدراسيه للترم التالي',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(height: 5.0),
                      Container(
                        width: double.infinity,
                        height: 1.0,
                        color: separator,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),

                      ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                        AppCubit.get(context).profileModel != null ? buildFineList(context, AppCubit.get(context).profileModel!.fines[index]) : buildFineShimmerList(context),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 12,
                        ),
                        itemCount:
                        AppCubit.get(context).profileModel != null ? AppCubit.get(context).profileModel!.fines.length : 8,
                      ),


                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1.0,
                        color: separator,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'اجمالي الغرامات',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const Spacer(),
                          Text(
                            '${AppCubit.get(context).sum} جنيه',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      defaultButton(
                        text: 'العوده الي الرئيسيه',
                        function: () {
                          navigateTo(context, HomeScreen());
                        },
                        width: double.infinity,
                        btnColor: mainColors,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  Widget buildFineList(context, FinesModel model) => Column(
        children: [
          Row(
            children: [
              Text(
                model.fineReason,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Spacer(),
              Text(
                '${model.fineValue} جنيه',
                style: TextStyle(
                  fontSize: 16.0,
                  color: separator,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );

  Widget buildFineShimmerList(context) => Column(
        children: [
          Row(
            children: [
              Shimmer.fromColors(
                child: Container(
                  height: 14.0,
                  width: 120.0,
                  color: baseColor,
                ),
                baseColor: baseColor,
                highlightColor:highlightColor,
              ),
              const Spacer(),
              Shimmer.fromColors(
                child: Container(
                  height: 14.0,
                  width: 30.0,
                  color: baseColor,
                ),
                baseColor: baseColor,
                highlightColor:highlightColor,
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );


}
