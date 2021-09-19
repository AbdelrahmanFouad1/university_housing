import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_housing/shard/cubit/states.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super (AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

 // Hosting Requests Screen
  bool isStudent =true;

  void changeIsStudent(bool student){
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
}