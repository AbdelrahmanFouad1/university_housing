import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:university_housing/model/login_model.dart';
import 'package:university_housing/moduls/login/cubit/states.dart';
import 'package:university_housing/shard/network/end_point.dart';
import 'package:university_housing/shard/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitialStates());

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  var buttonController = RoundedLoadingButtonController();

  void rotationPeriod() async {
    Timer(const Duration(milliseconds: 2000), () {
      buttonController.stop();
      emit(LoginRotationPeriodState());
    });
  }

  late LoginModel loginModel;

  void userLogin({
    required String id,
    required String password,
  }) {
    emit(LoginLoadingStates());

    DioHelper.postData(
      url: USERS_LOGIN,
      data: {
        'id': id,
        'password': password,
      },
    ).then((value) {
      // print(value!.data);
      loginModel = LoginModel.fromJson(value!.data);
      emit(LoginSuccessStates(loginModel));
    },
    ).catchError((error) {
      print(error.toString());
      emit(LoginErrorStates(error));
    });
  }

}