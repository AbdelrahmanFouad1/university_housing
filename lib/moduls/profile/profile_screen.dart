import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:university_housing/moduls/profile/edit_profile_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 12.0,
              actions: [
                Container(
                  padding: const EdgeInsets.all(0.0),
                  width: 34.0,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      navigateTo(context, const EditProfileScreen());
                    },
                    icon: Icon(
                      Icons.settings,
                        color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(0.0),
                    width: 34.0,
                    child: IconButton(
                      padding:EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(
                        'assets/images/back_arrow.svg',
                        width: 18.0,
                        height: 18.0,
                        color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Conditional.single(
                context: context,
                conditionBuilder: (BuildContext context) => AppCubit.get(context).profileModel != null,
                widgetBuilder: (BuildContext context) => buildProfileItem(context),
                fallbackBuilder: (BuildContext context) => buildProfileShimmerItem(context),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildProfileItem(context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                if(AppCubit.get(context).profileModel!.image != null)
                 CircleAvatar(
                  radius: 60,
                  backgroundColor: ThemeCubit.get(context).darkTheme
                      ? mainTextColor
                      : mainColors,
                  backgroundImage: NetworkImage(
                      '${AppCubit.get(context).profileModel!.image}',
                  ),
                ),
                if(AppCubit.get(context).profileModel!.image == null)
                  CircleAvatar(
                    radius: 60,
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
                  ),


                  const SizedBox(
                  width: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppCubit.get(context).profileModel!.username,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      '${AppCubit.get(context).profileModel!.id}',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                roomBox(
                  roomNumber: AppCubit.get(context).profileModel!.roomnumber,
                  floor: AppCubit.get(context).profileModel!.floor,
                  buildingName:
                      AppCubit.get(context).profileModel!.buildingName,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'الغرامات',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                buildFinesBox(context, fontsize1: 14.0, fontsize2: 18.0),
              ],
            ),
          ),
        ],
      );

  Widget buildProfileShimmerItem(context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Shimmer.fromColors(
                  highlightColor: highlightColor,
                  baseColor: baseColor,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: baseColor,
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      child: Container(
                        height: 14.0,
                        width: 80.0,
                        color: baseColor,
                      ),
                      baseColor: baseColor,
                      highlightColor:highlightColor,
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Shimmer.fromColors(
                      child: Container(
                        height: 14.0,
                        width: 40.0,
                        color: baseColor,
                      ),
                      baseColor: baseColor,
                      highlightColor:highlightColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                roomBox(),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'الغرامات',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                buildFinesBox(context, fontsize1: 14.0, fontsize2: 18.0),
              ],
            ),
          ),
        ],
      );

}
