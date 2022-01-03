import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:university_housing/model/login_model.dart';
import 'package:university_housing/moduls/dash_board/dash_home_screen.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/moduls/login/cubit/cubit.dart';
import 'package:university_housing/moduls/security/main_security_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  late LoginModel loginModel;
  DateTime timeBackPressed = DateTime.now();
  var fromKey = GlobalKey<FormState>();
  var idController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) async {
          if (state is LoginSuccessStates) {
            // LoginCubit.get(context).buttonController.stop();
            CacheHelper.saveData(key: 'token', value: state.loginModel.token)
                .then((value) {
              token = state.loginModel.token;
              idDB = state.loginModel.idDB!;
              CacheHelper.saveData(
                  key: 'isStudent', value: state.loginModel.isStudent);
              CacheHelper.saveData(
                  key: 'isSecurity', value: state.loginModel.isSecurity);
              CacheHelper.saveData(
                  key: 'isHousingManager',
                  value: state.loginModel.isHousingManager);
              CacheHelper.saveData(
                  key: 'isStudentAffairs',
                  value: state.loginModel.isStudentAffairs);
              CacheHelper.saveData(
                  key: 'isresident', value: state.loginModel.isresident);

              CacheHelper.saveData(key: 'isEmployee', value: state.loginModel.isEmployee);

              CacheHelper.saveData(key: 'waiting', value: false);
              if (state.loginModel.isStudent || state.loginModel.isEmployee) {
                navigateAndFinish(context,
                    HomeScreen(isRegister: state.loginModel.isresident));
              }
              if (state.loginModel.isSecurity) {
                navigateAndFinish(context, MainSecurityScreen());
              }
              if (state.loginModel.isHousingManager) {
                navigateAndFinish(context, const DashHomeScreen());
              }
            });
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = LoginCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: WillPopScope(
                onWillPop: () async {
                  final difference = DateTime.now().difference(timeBackPressed);
                  final isExitWarning =
                      difference >= const Duration(seconds: 2);
                  timeBackPressed = DateTime.now();
                  if (isExitWarning) {
                    showToast(
                        message: 'اضغط مرة أخرى للخروج من البرنامج',
                        state: ToastStates.WARNING);
                    return false;
                  } else {
                    return true;
                  }
                },
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, top: 28),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: ThemeCubit.get(context).darkTheme
                              ? Image.asset(
                                  'assets/images/logo_dark.png',
                                  width: 71.0,
                                  height: 71.0,
                                )
                              : Image.asset(
                                  'assets/images/logo.png',
                                  width: 71.0,
                                  height: 71.0,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: SvgPicture.asset(
                                'assets/images/login.svg',
                                height: 227.0,
                              ),
                            ),
                            Text(
                              'اهلا بك في تطبيق الاسكان الجامعي',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const SizedBox(
                              height: 33.0,
                            ),
                            SizedBox(
                              height: 48.0,
                              child: TextFormField(
                                controller: idController,
                                style: Theme.of(context).textTheme.bodyText1,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'رقم الطالب',
                                  hintStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            SizedBox(
                              height: 48.0,
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: cubit.isPassword,
                                style: Theme.of(context).textTheme.bodyText1,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    color: Colors.grey,
                                    onPressed: () {
                                      cubit.changePasswordVisibility();
                                    },
                                    icon: Icon(
                                      cubit.suffix,
                                    ),
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: 'كلمه المرور',
                                  hintStyle: const TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 36.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50.0,
                              child: defaultButton(
                                  function: () {
                                    cubit.userLogin(
                                      id: int.parse(idController.text),
                                      password: passwordController.text,
                                    );
                                  },
                                  text: 'تسجيل دخول',
                                  btnColor: mainColors),

                              // RoundedLoadingButton(
                              //   color: mainColors,
                              //   controller: cubit.buttonController,
                              //   borderRadius: 5.0,
                              //   onPressed: () {
                              //     cubit.rotationPeriod();
                              //     cubit.userLogin(
                              //       id: idController.text,
                              //       password: passwordController.text,
                              //     );
                              //   },
                              //   child: const Text(
                              //     'تسجيل دخول',
                              //     style: TextStyle(
                              //       fontSize: 20.0,
                              //     ),
                              //   ),
                              // ),
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
