import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_housing/model/complaints_model.dart';
import 'package:university_housing/model/get_buildings_model.dart';
import 'package:university_housing/model/get_num_rooms_model.dart';
import 'package:university_housing/model/news_model.dart';
import 'package:university_housing/model/profile_model.dart';
import 'package:university_housing/model/queries_model.dart';
import 'package:university_housing/model/students_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/network/end_point.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/network/remote/dio_helper.dart';

class DashBoardCubit extends Cubit<DashBoardStates>{
  DashBoardCubit() : super(DashBoardInitialState());

  static DashBoardCubit get(context) => BlocProvider.of(context);



  // get profile Api

  ProfileModel? profileModel;
  String? tokeen = CacheHelper.getData(key: 'token');

  void getDashProfileData() {
    emit(GetProfileLoadingStates());

    DioHelper.getData(
      url: USERS_PROFILE,
      token: tokeen ?? '',
    ).then((value) {
      if (value != null) {
        profileModel = ProfileModel.fromJson(value.data);
        emit(GetProfileSuccessStates());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorStates(error.toString()));
    });
  }



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

  bool isBoy = true;
  void changeGenderStatues(bool gender) {
    isBoy = gender;
    emit(ChangeGenderStatues());
  }

  void postBuilding({
    required String buildingName,
    required String buildingCode,
    required String slug,
    required bool buildingLevels,
    required String image,
    required bool gender,
    required bool availability,
    required String address,
    required String buildingsupervisorName,
    required String buildingsupervisorPhonenumber,
    required int cost,
  }) {
    emit(postBuildingLoadingStates());
    DioHelper.postData(
      url: ADD_BUILDING,
      token: tokeen ?? '',
      data: {
        'buildingName': buildingName,
        'buildingCode': buildingCode,
        'slug': slug,
        'buildingLevels': buildingLevels,
        'image': image,
        'gender': gender,
        'availability': availability,
        'address': address,
        'buildingsupervisorName': buildingsupervisorName,
        'buildingsupervisorPhonenumber': buildingsupervisorPhonenumber,
        'cost': cost,
      },
    ).then((value) {
      print(value!.statusMessage.toString());
      emit(postBuildingSuccessStates());
    },
    ).catchError((error) {
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(postBuildingErrorStates(error.toString()));
    });
  }





  // Add room
  bool isSpecialRoom = true;
  void changeRoomType(bool special) {
    isSpecialRoom = special;
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

  void postRoom({
    required String slug,
    required bool availability,
    required bool type,
    required bool roomfor,
    required String roomcode,
    required int floor,
    required int roomnumber,
  }) {
    emit(postRoomLoadingStates());
    DioHelper.postData(
      url: 'buildings/addroom/${slug}',
      token: tokeen ?? '',
      data: {
        'availability': availability,
        'type': type,
        'roomcode': roomcode,
        'roomfor': roomfor,
        'floor': floor,
        'roomnumber': roomnumber,
      },
    ).then((value) {
      if(value!.data == null){
        showToast(message: 'كوود المبنى غير صحيح', state: ToastStates.ERROR);
        emit(postRoomErrorStates());
      }else{
        print(value.statusMessage.toString());
        emit(postRoomSuccessStates());
      }
    },
    ).catchError((error) {
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(postRoomErrorStates());
    });
  }





  // Available now
  GetBuildingsModel? availableNow;
  void getAvailableNowData() {
    emit(GetAvailableNowLoadingStates());
    DioHelper.getData(
      url: GET_BUILDINGS,
      token: tokeen ?? '',
    ).then((value) {
      if (value != null) {
        availableNow = GetBuildingsModel.fromJson(value.data);
        print(availableNow!.Buildings.length.toString());
        emit(GetAvailableNowSuccessStates());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetAvailableNowErrorStates(error.toString()));
    });
  }

  double animatedHeight = 0.0;
  bool showDetails = false;
  int currentIndex = -1;
  void showBuildingDetails(bool show ,int index) {
    if(currentIndex == index){
      showDetails = show;
      animatedHeight == 0.0? animatedHeight= 500.0: animatedHeight= 0.0;
      emit(ShowBuildingDetails());
    }
  }

  bool showEdit = false;
  void changeBuildingEditIcon(bool edit){
    showEdit = edit;
    emit(ChangeBuildingEditIcon());
  }


  double animatedRoomHeight = 0.0;
  bool showRoom = false;
  int currentRoomIndex = -1;
  void showRoomDetails(bool show ,int index) {
    if(currentRoomIndex == index){
      showRoom = show;
      animatedRoomHeight == 0.0? animatedRoomHeight= 450.0: animatedRoomHeight= 0.0;
      emit(ShowRoomDetails());
    }
  }

  bool showRoomEdit = false;
  void changeRoomEditIcon(bool edit){
    showRoomEdit = edit;
    emit(ChangeRoomEditIcon());
  }


  int currentBuildingStateVal = -1;
  String currentBuildingStateText = '';
  void selectBuildingState(int currentNum) {
    currentBuildingStateVal = currentNum;
    emit(SelectBuildingState());
  }


  int currentBuildingLevelVal = -1;
  String currentBuildingLevelText = '';
  void selectBuildingLevel(int currentNum) {
    currentBuildingLevelVal = currentNum;
    emit(SelectBuildingLevel());
  }

  int currentBuildingGenderVal = -1;
  String currentBuildingGenderText = '';
  void selectBuildingGender(int currentNum) {
    currentBuildingGenderVal = currentNum;
    emit(SelectBuildingGender());
  }



  int currentRoomStateVal = -1;
  String currentRoomStateText = '';
  void selectRoomState(int currentNum) {
    currentRoomStateVal = currentNum;
    emit(SelectRoomState());
  }


  int currentRoomLevelVal = -1;
  String currentRoomLevelText = '';
  void selectRoomLevel(int currentNum) {
    currentRoomLevelVal = currentNum;
    emit(SelectRoomLevel());
  }

  int currentRoomGenderVal = -1;
  String currentRoomGenderText = '';
  void selectRoomGender(int currentNum) {
    currentRoomGenderVal = currentNum;
    emit(SelectRoomGender());
  }



  void deleteBuilding(id) {
    emit(DeleteBuildingLoadingStates());
    DioHelper.deleteData(
      url: 'buildings/${id}',
      token: tokeen ?? '',
    ).then((value) {
        emit(DeleteBuildingSuccess());
        getAvailableNowData();
        showToast(message: 'تم حذف المبنى بنجاح', state: ToastStates.SUCCESS);
      },
    ).catchError((error) {
      print(error.toString());
      emit(DeleteBuildingError(error.toString()));
      showToast(message: 'حدث خطأ ما, برجاء المحاولة في وقت لاحق', state: ToastStates.ERROR);
    });
  }

  void putRoom({
    required String slug,
    required String idDB,
    required bool availability,
    required bool type,
    required bool roomfor,
    required int floor,
    required int roomnumber,
    required String roomcode,
    required String userresidentId,
    required String userresidentName,
  }) {
    emit(PutRoomLoadingStates());

    DioHelper.putData(
      url: 'buildings/${slug}/updateroom',
      token: tokeen ?? '',
      data: {
        '_id': idDB,
        'availability': availability,
        'type': type,
        'roomfor': roomfor,
        'floor': floor,
        'roomnumber': roomnumber,
        'roomcode': roomcode,
        'userresidentId': userresidentId,
        'userresidentName': userresidentName,
      },
    ).then((value) {
      print(value!.statusMessage.toString());
      showToast(message: 'تم تعديل الغرفه بنجاح', state: ToastStates.SUCCESS);
        emit(PutRoomSuccessStates());
      },
    ).catchError((error) {
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutRoomErrorStates(error.toString()));
    });
  }


  void putBuilding({
    required String slug,
    required bool buildingLevels,
    required String image,
    required bool availability,
    required int numberofrooms,
    required String buildingName,
    required String buildingCode,
    required String address,
    required bool gender,
    required String buildingsupervisorName,
    required String buildingsupervisorPhonenumber,
  }) {
    emit(PutBuildingLoadingStates());
    DioHelper.putData(
      url: 'buildings/${slug}/updatebuilding',
      token: tokeen ?? '',
      data: {
        'buildingLevels': buildingLevels,
        'image': image,
        'availability': availability,
        'numberofrooms': numberofrooms,
        'buildingName': buildingName,
        'buildingCode': buildingCode,
        'address': address,
        'gender': gender,
        'buildingsupervisorName': buildingsupervisorName,
        'buildingsupervisorPhonenumber': buildingsupervisorPhonenumber,
      },
    ).then((value) {
      printFullText(value!.statusMessage.toString());
      showToast(message: 'تم تعديل الغرفه بنجاح', state: ToastStates.SUCCESS);
      emit(PutBuildingSuccessStates());
    },
    ).catchError((error) {
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutBuildingErrorStates(error.toString()));
    });
  }

// rooms home screen
  late GetNumRoomsModel allRooms;
  void getRoomsNum(){
    emit(GetAllRoomsLoadingStates());

    DioHelper.getData(
      url: ROOMS_NUM,
      token: tokeen,
    ).then((value) {
      if (value != null) {
        allRooms = GetNumRoomsModel.fromJson(value.data);
        emit(GetAllRoomsSuccessStates());
      }
      print(value!.statusMessage);
    }).catchError((error) {
      printFullText(error.toString());
      emit(GetAllRoomsErrorStates(error.toString()));
    });
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

  NewsModel? newsModel;

  void getNews() {
    emit(GetNewsLoadingStates());

    DioHelper.getData(
      url: NEWS,
    ).then((value) {
      if (value != null) {
        newsModel = NewsModel.fromJson(value.data);
        emit(GetNewsSuccessStates());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetNewsErrorStates(error.toString()));
    });
  }

  void postNews({
   required String title,
   required String text,
   required String image,
}) {
    emit(PostNewsLoadingStates());

    DioHelper.postData(
      url: CREATE_NEWS,
      token: tokeen ?? '',
      data: {
        'title': title,
        'text': text,
        'image': image,
      },
    ).then((value) {
      if (value != null) {
        print(value.statusMessage);
        emit(PostNewsSuccessStates());
      }
    }).catchError((error) {
      print(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PostNewsErrorStates(error.toString()));
    });
  }

  void DeleteNews({
    required String id,
  }) {
    emit(DelNewsLoadingStates());

    DioHelper.deleteData(
      url: 'news/${id}',
      token: tokeen ?? '',
    ).then((value) {
      if (value != null) {
        print(value.statusMessage);
        showToast(message: 'تم حذف الخبر بنجاح', state: ToastStates.SUCCESS);
        getNews();
        emit(DelNewsSuccessStates());
      }
    }).catchError((error) {
      print(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(DelNewsErrorStates(error.toString()));
    });
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
  IconData suffix1 = Icons.visibility_outlined;
  IconData suffix2 = Icons.visibility_outlined;
  IconData suffix3 = Icons.visibility_outlined;
  bool isFirstPassword = true;
  bool isSecPassword = true;
  bool isThirdPassword = true;

  void changePasswordVisibility(int index) {
    if(index == 1){
      isFirstPassword = !isFirstPassword;
      suffix1 = isFirstPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    }
    if(index == 2){
      isSecPassword = !isSecPassword;
      suffix2 = isSecPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    }
    if(index == 3){
      isThirdPassword = !isThirdPassword;
      suffix3 = isThirdPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    }

    emit(ChangePasswordVisibilityState());
  }

}
