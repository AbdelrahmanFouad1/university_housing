import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/model/main_security_model.dart';
import 'package:university_housing/moduls/dash_board/change_password/change_password_screen.dart';
import 'package:university_housing/moduls/security/enter_student_login_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/security/security_cubit.dart';
import 'package:university_housing/shard/cubit/security/security_states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class MainSecurityScreen extends StatelessWidget {
  final searchController = TextEditingController();

  MainSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SecurityCubit, SecurityStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar:
                dashAppBar(title: 'إدارة الأمن', context: context, pop: false),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 80.0,
                            height: 80.0,
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'احمد سيد علي',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '202076',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, ChangePasswordScreen());
                      },
                      child: Text(
                        'تغيير كلمه المرور',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 12.0, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: ThemeCubit.get(context).darkTheme
                                ? mainColors
                                : Colors.white,
                            content: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/warning.svg',
                                      width: 25.0,
                                      height: 25.0,
                                      alignment: Alignment.center,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'تأكيد الخروج من الحساب ؟',
                                      textDirection: TextDirection.rtl,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'الغاء',
                                  textDirection: TextDirection.rtl,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'تأكيد',
                                  textDirection: TextDirection.rtl,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'تسجيل خروج',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: separator,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: defaultFormField(
                        controller: searchController,
                        type: TextInputType.text,
                        onSubmit: (String text) {},
                        hint: 'بحث ...',
                        prefix: IconBroken.Search,
                        context: context,
                        validate: () {},
                        onChange: (value) {
                          SecurityCubit.get(context)
                              .getUserByNameInSecurity(username: value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Conditional.single(
                      context: context,
                      conditionBuilder: (context) => state is GetUserSecurityLoadingStates,
                      widgetBuilder: (context) => const Center(child: CircularProgressIndicator()),
                      fallbackBuilder: (context) => ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildSecurityCard(
                            context,
                            SecurityCubit.get(context)
                                .mainSecurityModel[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 18.0,
                        ),
                        itemCount:
                            SecurityCubit.get(context).mainSecurityModel.length,
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

  Widget buildSecurityCard(context, MainSecurityModel model) => Column(
        children: [
          Container(
            width: double.infinity,
            height: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              color: ThemeCubit.get(context).darkTheme
                  ? mainColors
                  : containerFollowStudent,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.username,
                              style: Theme.of(context).textTheme.bodyText2),
                          Text('${model.id}',
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                defaultButton2(
                  function: () {
                    navigateTo(context, EnterStudentDetailsScreen());
                  },
                  text: 'إدخال التفاصيل',
                  width: double.infinity,
                  height: 32.0,
                  btnColor: ThemeCubit.get(context).darkTheme
                      ? Colors.black45
                      : mainColors,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      );
}
