
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_housing/model/buidings_model.dart';
import 'package:university_housing/model/complaints_model.dart';
import 'package:university_housing/model/queries_model.dart';
import 'package:university_housing/model/students_model.dart';
import 'package:university_housing/moduls/dash_board/rooms/available_now.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashBoardCubit extends Cubit<DashBoardStates>{
  DashBoardCubit() : super(DashBoardInitialState());

  static DashBoardCubit get(context) => BlocProvider.of(context);



  // Add building
  bool isSpecial = true;
  void changeBuildingLevel(bool special) {
    isSpecial = special;
    emit(ChangeBuildingLevel());
  }

  bool isWorking = true;
  void changeBuildingStatues(bool working) {
    isWorking = working;
    emit(ChangeBuildingStatues());
  }




  // Add room
  bool isSingle = true;
  void changeRoomType(bool single) {
    isSingle = single;
    emit(ChangeRoomType());
  }

  bool isStudent = true;
  void changeRoomFor(bool student) {
    isStudent = student;
    emit(ChangeRoomFor());
  }

  bool available = true;
  void changeRoomStatues(bool working) {
    available = working;
    emit(ChangeRoomStatues());
  }




  // Available now
  double animatedHeight = 0.0;
  bool showDetails = false;
  int currentIndex = -1;
  void showBuildingDetails(bool show ,int index) {
    if(currentIndex == index){
      showDetails = show;
      animatedHeight == 0.0? animatedHeight= 500.0: animatedHeight= 0.0;
      emit(ShowBuildingDetails());
    }else{
      print('elseeeeeee');
    }
  }

  bool showEdit = false;
  void changeBuildingEditIcon(bool edit){
    showEdit = edit;
    emit(ChangeBuildingEditIcon());
  }

  int currentStateVal = 0;
  String currentStateText = '';

  void selectBuildingState(int currentNum) {
    currentStateVal = currentNum;
    emit(SelectBuildingState());
  }


  int currentLevelVal = 0;
  String currentLevelText = '';

  void selectBuildingLevel(int currentNum) {
    currentLevelVal = currentNum;
    emit(SelectBuildingLevel());
  }

  void deleteBuilding(List<BuildingsModel> list ,index) {
    list.removeAt(index);
    emit(DeleteBuildingSuccess());
  }





//  News Screen

  File? newsImage;
  var newsPicker = ImagePicker();

  Future<void> pikeNewsImage() async {
    final pickedFile = await newsPicker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      newsImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(NewsImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(NewsImagePickedErrorState());
    }
  }

  Future<void> removeNewsImage() async {
    newsImage = null;
    emit(ImageRemoveSuccessState());
  }


//  Students

  int termNum = 1;
  void changeTerm(int term) {
    termNum = term;
    emit(ChangeTerm());
  }

  bool isStudentKind = true;
  void changePeopleType(bool student) {
    isStudentKind = student;
    emit(ChangePeopleType());
  }



  double animatedStudentHeight = 0.0;
  bool showStudent_details = false;
  int currentStudentIndex = -1;
  void showStudentDetails(bool show ,int index) {
    if(currentStudentIndex == index){
      showStudent_details = show;
      animatedStudentHeight == 0.0? animatedStudentHeight= 900.0: animatedStudentHeight= 0.0;
      emit(ShowStudentDetails());
    }
  }

  bool showStudentEdit = false;
  void changeStudentEditIcon(bool edit){
    showStudentEdit = edit;
    emit(ChangeStudentEditIcon());
  }

  int currentStudentGenderVal = 0;
  String currentStudentGenderText = '';

  void selectStudentGender(int currentNum) {
    currentStudentGenderVal = currentNum;
    emit(SelectStudentGender());
  }

  int currentStudentLevelVal = 0;
  String currentStudentLevelText = '';

  void selectStudentLevel(int currentNum) {
    currentStudentLevelVal = currentNum;
    emit(SelectStudentLevel());
  }

  int currentStudentJobVal = 0;
  String currentStudentJobText = '';

  void selectStudentJob(int currentNum) {
    currentStudentJobVal = currentNum;
    emit(SelectStudentJob());
  }

  int currentStudentCreditVal = 0;
  String currentStudentCreditText = '';

  void selectStudentCredit(int currentNum) {
    currentStudentCreditVal = currentNum;
    emit(SelectStudentCredit());
  }

  void deleteStudent(List<StudentsModel> list ,index) {
    list.removeAt(index);
    emit(DeleteStudentSuccess());
  }


  void savingCurrentStudentsModel(StudentsModel item) {
    currentStudentsModel = item;
    emit(SavingCurrentStudentsModelSuccess());
  }



//security
  int currentSecurityBuildingVal = 0;
  void selectSecurityBuilding(int currentNum) {
    currentSecurityBuildingVal = currentNum;
    emit(SelectSecurityBuilding());
  }


  double animatedSecurityHeight = 0.0;
  bool showSecurity_details = false;
  int currentSecurityIndex = -1;
  void showSecurityDetails(bool show ,int index) {
    if(currentSecurityIndex == index){
      showSecurity_details = show;
      animatedSecurityHeight == 0.0? animatedSecurityHeight= 400.0: animatedSecurityHeight= 0.0;
      emit(ShowSecurityDetails());
    }
  }

  bool showSecurityEdit = false;
  void changeSecurityEditIcon(bool edit){
    showSecurityEdit = edit;
    emit(ChangeSecurityEditIcon());
  }



// requests

    void savingCurrentComplaintsModel(ComplaintsModel item) {
    currentComplaintsModel = item;
    emit(SavingCurrentComplaintsModelSuccess());
  }

  void savingCurrentQueriesModel(QueriesModel item) {
    currentQueriesModel = item;
    emit(SavingCurrentQueriesModelSuccess());
  }


  //change password
  int? index ;
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(int currentIndex) {
    index = currentIndex;
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

}
