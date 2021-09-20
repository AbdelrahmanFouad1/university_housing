import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/states.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  // Login Screen
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  // Hosting Requests Screen
  bool isStudent = true;

  void changeIsStudent(bool student) {
    isStudent = student;
    emit(ChangeStudentState());
  }

  File? idImage;
  var picker = ImagePicker();

  Future<void> pikeIdImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      idImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(ImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(ImagePickedErrorState());
    }
  }

  Future<void> removePikePostImage() async {
    idImage = null;
    emit(RemovePikeIdImageState());
  }
}