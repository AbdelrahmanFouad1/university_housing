import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/login/login_screen.dart';
import 'package:university_housing/moduls/profile/about_app_screen.dart';
import 'package:university_housing/moduls/profile/follow_requests/follow_requests_screen.dart';
import 'package:university_housing/moduls/profile/student_rate/student_rate_screen.dart';
import 'package:university_housing/moduls/profile/technical_support_screen.dart';
import 'package:university_housing/moduls/profile/terms_and_conditions_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is UpdateImgLoadingStates){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }else if(state is GetProfileSuccessStates){
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
                'الأعدادات',
                style: Theme.of(context).textTheme.headline5,
              ),
              actions: [
                IconButton(
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
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [

                              Builder(builder: (context){
                                if(cubit.profileImage !=null){
                                  return CircleAvatar(
                                    radius: 60,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          150.0,
                                        ),
                                        image: DecorationImage(
                                          image: FileImage(cubit.profileImage!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                }else if(cubit.profileModel!.image != null){
                                  return CircleAvatar(
                                    radius: 60,
                                    backgroundColor: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                    backgroundImage:  NetworkImage(
                                      AppCubit.get(context).profileModel!.image,
                                    ),
                                  );
                                }else{
                                  return CircleAvatar(
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
                                  );
                              }
                              }),

                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                child: IconButton(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(0.0),
                                  iconSize: 20.0,
                                  icon: cubit.icon,
                                  onPressed: () {
                                    if (cubit.profileImage == null) {
                                        cubit.pikeProfileImage();
                                    } else {
                                      cubit.uploadImage();
                                    }
                                  },
                                ),
                                backgroundColor: Colors.white,
                                radius: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              AppCubit.get(context).getOrderData();
                              navigateTo(
                                context,
                                const FollowRequestsScreen(),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  'متابعه طلباتى',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const Spacer(),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    IconBroken.Arrow___Left_2,
                                    color: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                  ),
                                  onPressed: () {
                                    navigateTo(context, const FollowRequestsScreen());
                                    AppCubit.get(context).getOrderData();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 1.0,
                              color: separator,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              navigateTo(
                                context,
                                StudentRateScreen(),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  'تقييم الطلاب',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const Spacer(),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    IconBroken.Arrow___Left_2,
                                    color: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                  ),
                                  onPressed: () {
                                    navigateTo(
                                      context,
                                      StudentRateScreen(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 1.0,
                              color: separator,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              navigateTo(context, AboutAppScreen());
                            },
                            child: Row(
                              children: [
                                Text(
                                  'خدماتنا',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const Spacer(),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    IconBroken.Arrow___Left_2,
                                    color: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                  ),
                                  onPressed: () {
                                    navigateTo(context, AboutAppScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 1.0,
                              color: separator,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              navigateTo(context, const TermsAndConditionsScreen());
                            },
                            child: Row(
                              children: [
                                Text(
                                  'الشروط والأحكام',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const Spacer(),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    IconBroken.Arrow___Left_2,
                                    color: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                  ),
                                  onPressed: () {
                                    navigateTo(
                                        context, const TechnicalSupportScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 1.0,
                              color: separator,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              navigateTo(context, const TechnicalSupportScreen());
                            },
                            child: Row(
                              children: [
                                Text(
                                  'الدعم الفنى',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const Spacer(),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    IconBroken.Arrow___Left_2,
                                    color: ThemeCubit.get(context).darkTheme
                                        ? mainTextColor
                                        : mainColors,
                                  ),
                                  onPressed: () {
                                    navigateTo(
                                        context, const TechnicalSupportScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 1.0,
                              color: separator,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'الوضع الليلى',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const Spacer(),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 1000),
                                height: 30.0,
                                width: 70.0,
                                child: Stack(
                                  children: [
                                    AnimatedPositioned(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      child: InkWell(
                                        onTap: () {
                                          cubit.toggleButton();
                                          ThemeCubit.get(context).changeTheme();
                                        },
                                        child: AnimatedSwitcher(
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          transitionBuilder: (Widget child,
                                              Animation<double> animation) {
                                            return RotationTransition(
                                                child: child, turns: animation);
                                          },
                                          child:
                                              ThemeCubit.get(context).darkTheme
                                                  ? Icon(
                                                      Icons.nightlight_round,
                                                      color: Colors.white,
                                                      size: 20.0,
                                                      key: UniqueKey(),
                                                    )
                                                  : Icon(
                                                      Icons.wb_sunny_sharp,
                                                      color: Colors.amberAccent,
                                                      size: 20.0,
                                                      key: UniqueKey(),
                                                    ),
                                        ),
                                      ),
                                      curve: Curves.easeIn,
                                      top: 5.0,
                                      right: ThemeCubit.get(context).darkTheme
                                          ? 40.0
                                          : 0.0,
                                      left: ThemeCubit.get(context).darkTheme
                                          ? 0.0
                                          : 40.0,
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color:
                                      ThemeCubit.get(context).darkTheme == true
                                          ? mainColors
                                          : Colors.white,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          defaultButton(
                            text: 'تسجيل خروج',
                            function: () {
                              CacheHelper.removeData(key: 'token');
                              CacheHelper.removeData(key: 'isStudent');
                              CacheHelper.removeData(key: 'isSecurity');
                              CacheHelper.removeData(key: 'isHousingManager');
                              CacheHelper.removeData(key: 'isStudentAffairs');
                              CacheHelper.removeData(key: 'isresident');
                              //todo ايه الهبل ده ؟ مهو لما اعمل لوجن تاني هيتعامل من الباديه
                              CacheHelper.removeData(key: 'waiting');
                              navigateAndFinish(context, LoginScreen());
                            },
                            btnColor: Colors.red,
                            fontSize: 20,
                            height: 40.0,
                            width: double.infinity,
                          ),
                        ],
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
}
