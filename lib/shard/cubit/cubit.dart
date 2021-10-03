import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/states.dart';
import 'package:university_housing/shard/style/color.dart';

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


  // family Report
  File? familyImage;
  var familyPicker = ImagePicker();

  Future<void> pikeFamilyImage() async {
    final pickedFile = await familyPicker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      familyImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(ImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(ImagePickedErrorState());
    }
  }

  Future<void> removePikeImage() async {
    familyImage = null;
    emit(ImageRemoveSuccessState());
  }


  // edit profile screen
  bool isDark = false ;
  void getTheme(){
    isDark =!isDark;
    emit(ChangeThemeSuccessState());
  }

  File? profileImage;
  var profilePicker = ImagePicker();
  Icon icon = Icon( Icons.edit, color: mainColors,);
  CircleAvatar img = CircleAvatar(radius: 60, backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/149/149071.png'),);

  Future<void> pikeProfileIdImage() async {
    final pickedFile = await profilePicker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      icon = Icon(Icons.delete,color: mainColors,);
      img = CircleAvatar(
        radius: 60,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              150.0,
            ),
            image: DecorationImage(
              image:
              FileImage(profileImage!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
      emit(ImagePickedSuccessState());
      showToast(state: ToastStates.SUCCESS,message: 'تم رفع الصوره بنجاح');
    } else {
      emit(ImagePickedErrorState());
      showToast(state: ToastStates.ERROR,message: 'لم يتم رفع الصوره');
    }
  }

  void deleteImg (){
    profileImage =null;
    icon = Icon( Icons.edit, color: mainColors,);
    img = CircleAvatar(radius: 60, backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/149/149071.png'),);
    emit(ImageRemoveSuccessState());
    showToast(state: ToastStates.SUCCESS,message: 'تم حذف الصوره بنجاح');
  }

  //Change Room Screen

  int currVal = 0;
  String currText = '';

  void changeFloor(int currentNum, String currentFloor) {
    currVal = currentNum;
    currText = currentFloor;
    emit(ChangeFloorState());
  }

  int currRoomVal = 0;
  String currRoomText = '';

  void changeRoom(int currentNum, String currentFloor) {
    currRoomVal = currentNum;
    currRoomText = currentFloor;
    emit(ChangeRoomState());
  }


//  Booking Room

  int selectedHouse = -1;
  bool? showDetails = false;
  bool? showAll = false;
  bool? isDouble= false;
  bool? agree= false;
 void changeHouseColor (int Selected){
   selectedHouse = Selected;
   showDetails = true;
   emit(SelectHouseSuccessState());
 }

  void ShowAllDetails (bool ShowAll){
    showAll = ShowAll;
    emit(ShowAllDetailsSuccessState());
  }

  void IsDouble (bool IsDouble){
    isDouble = IsDouble;
    emit(IsDoubleSuccessState());
  }


  void IsAgree(bool Is_agree){
    agree = Is_agree;
    emit(IsAgreeSuccessState());
  }

  int currentVal = 0;
  String currentText = '';

  void selectFloor(int currentNum, String currentFloor) {
    currentVal = currentNum;
    currentText = currentFloor;
    emit(SelectFloorState());
  }

  int currentRoomVal = 0;
  String currentRoomText = '';

  void selectRoom(int currentNum, String currentFloor) {
    currentRoomVal = currentNum;
    currentRoomText = currentFloor;
    emit(SelectRoomState());
  }

//  receipt screen
  File? receiptImage;
  var receiptPicker = ImagePicker();

  Future<void> pikeReceiptImage() async {
    final pickedFile = await receiptPicker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      receiptImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(ImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(ImagePickedErrorState());
    }
  }

  Future<void> removeReceiptImage() async {
    receiptImage = null;
    emit(ImageRemoveSuccessState());
  }

}