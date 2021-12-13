import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_housing/model/get_all_orders_model.dart';
import 'package:university_housing/model/get_all_users_model.dart';
import 'package:university_housing/model/get_buildings_model.dart';
import 'package:university_housing/model/get_dash_security_model.dart';
import 'package:university_housing/model/get_num_rooms_model.dart';
import 'package:university_housing/model/news_model.dart';
import 'package:university_housing/model/profile_model.dart';
import 'package:university_housing/moduls/dash_board/rooms/available_now.dart';
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
    print('----------get Profile Data----------');
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
      print('----------get Profile Data---------- Error  ${error.toString()}');
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

  List<AlertDialogModel> buildingsName = [];

  void getAvailableNowData() {
    emit(GetAvailableNowLoadingStates());
    DioHelper.getData(
      url: GET_BUILDINGS,
      token: tokeen ?? '',
    ).then((value) {
      if (value != null) {
        buildingsName = [];
        availableNow = GetBuildingsModel.fromJson(value.data);
        availableNow!.Buildings.asMap().forEach((index,element) {
          buildingsName.add(
              AlertDialogModel(
                text: element.buildingName,
                index: index,
              ));
        });
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
    getAllUsers(
      query: {
          if(termNum == 1)
            'firstTerm':true,
          if(termNum == 2)
            'secondTerm':true,
          if(termNum == 3)
            'thirdTerm':true,
          if(isStudentKind)
            'isStudent':true,
          if(!isStudentKind)
            'isEmployee':true,
      }
    );
  }

  bool isStudentKind = true;
  void changePeopleType(bool student) {
    isStudentKind = student;
    getAllUsers(
        query: {
          if(termNum == 1)
            'firstTerm':true,
          if(termNum == 2)
            'secondTerm':true,
          if(termNum == 3)
            'thirdTerm':true,
          if(isStudentKind)
            'isStudent':true,
          if(!isStudentKind)
            'isEmployee':true,
        }
    );
  }


  bool waitingIsStudentKind = true;
  void changeWaitingPeopleType(bool student) {
    waitingIsStudentKind = student;
    getAllUsers(
        query: {
            'firstTerm':false,
            'secondTerm':false,
            'thirdTerm':false,
          if(waitingIsStudentKind)
            'isStudent':true,
          if(!waitingIsStudentKind)
            'isEmployee':true,
        }
    );
  }

  double animatedStudentHeight = 0.0;
  bool showStudent_details = false;
  int currentStudentIndex = -1;
  void showStudentDetails(bool show ,int index) {
    if(currentStudentIndex == index){
      showStudent_details = show;
      animatedStudentHeight == 0.0? animatedStudentHeight= 1000.0: animatedStudentHeight= 0.0;
      emit(ShowStudentDetails());
    }
  }

  bool showStudentEdit = false;
  void changeStudentEditIcon(bool edit){
    showStudentEdit = edit;
    emit(ChangeStudentEditIcon());
  }

  int currentStudentTermVal = 0;
  String currentStudentTermText = '';
  void selectStudentTerm(int currentNum) {
    currentStudentTermVal = currentNum;
    emit(SelectStudentTerm());
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


  GetAllUsersModel? allUsers;
  void getAllUsers({
    Map<String, dynamic>? query,
   }) {
    print('----------get all users----------');
    emit(GetAllUsersLoadingStates());
    DioHelper.getData(
      url: ALL_USERS,
      query: query,
      token: tokeen ?? '',
    ).then((value) {
      if (value != null) {
        allUsers = GetAllUsersModel.fromJson(value.data);
        emit(GetAllUsersSuccessStates());
      }
    }).catchError((error) {
      print('get all users '+error.toString());
      emit(GetAllUsersErrorStates(error.toString()));
    });
  }


  //todo add phone number
  void putStudent({
    required String idDB,
    required int id,
    required String username,
    required bool isStudent,
    required bool isEmployee,
    required bool firstTerm,
    required bool secondTerm,
    required bool thirdTerm,
    required int NationalID,
    required String address,
    required String buildingName,
    required bool buildingType,
    required int roomnumber,
    required String Section,
    required bool isPaid,
    required String paidAt,
    required String cardPhoto,
  }) {
    emit(PutStudentLoadingStates());
    DioHelper.putData(
      url: 'users/${idDB}',
      token: tokeen ?? '',
      data: {
        'id': id,
        'username': username,
        'isStudent': isStudent,
        'isEmployee': isEmployee,
        'NationalID': NationalID,
        'address': address,
        'buildingName': buildingName,
        'buildingType': buildingType,
        'roomnumber': roomnumber,
        'Section': Section,
        'isPaid': isPaid,
        'paidAt': paidAt,
        'cardPhoto': cardPhoto,

      },
    ).then((value) {
      emit(PutStudentSuccessStates());
      // getAllUsers();
    },
    ).catchError((error) {
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutStudentErrorStates(error.toString()));
    });
  }


  void deleteStudent(id , bool isWaiting) {
    emit(DeleteStudentLoadingStates());
    DioHelper.deleteData(
      url: 'users/${id}',
      token: tokeen ?? '',
    ).then((value) {
      emit(DeleteStudentSuccess());
      if(isWaiting)
        getAllUsers(query: {
        'firstTerm':false,
        'secondTerm':false,
        'thirdTerm':false,
        if(waitingIsStudentKind)
        'isStudent':true,
        if(!waitingIsStudentKind)
        'isEmployee':true,
        });
      if(!isWaiting)
        getAllUsers(query: {
        if(termNum == 1)
          'firstTerm':true,
      if(termNum == 2)
      'secondTerm':true,
      if(termNum == 3)
      'thirdTerm':true,
      if(isStudentKind)
      'isStudent':true,
      if(!isStudentKind)
      'isEmployee':true,
      });
    },
    ).catchError((error) {
      print(error.toString());
      emit(DeleteStudentError(error.toString()));
      showToast(message: 'حدث خطأ ما, برجاء المحاولة في وقت لاحق', state: ToastStates.ERROR);
    });
  }


  bool gender = true;
  void changeGender(bool boy) {
    gender = boy;
    emit(ChangeGender());
  }

  bool student = true;
  void changeJob(bool student) {
    student = student;
    emit(ChangeJob());
  }

  void postStudent({
    required int id,
    required String password,
    required bool gender,
    required String username,
    required bool isStudent,
    required bool isEmployee,
  }) {
    emit(postStudentLoadingStates());
    DioHelper.postData(
      url: POST_STUDENT,
      token: tokeen ?? '',
      data: {
        'id': id,
        'password': password,
        'gender': gender,
        'username': username,
        'isStudent': isStudent,
        'isEmployee': isEmployee,
      },
    ).then((value) {
      print(value!.statusMessage);
      emit(postStudentSuccessStates());
    },
    ).catchError((error) {
      printFullText(error.toString());
      // showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(postStudentErrorStates(error.toString()));
    });
  }


  bool showFinesEdit = true;
  void changeFinesEditIcon(bool edit){
    showFinesEdit = edit;
    emit(ChangeFinesEditIcon());
  }

  int fineIndex = -1;
  void changeFineIndex(int index){
    fineIndex = index;
    emit(ChangeFinesIndex());
  }

  void putFines({
    required String idDB,
    required String fineReason,
    required num fineValue,
    required bool isFine,
    String? costRoom,
  }) {
    emit(PutFinesLoadingStates());
    DioHelper.putData(
      url: 'users/${idDB}/updatefine',
      token: tokeen ?? '',
      data: {
        'fineReason': fineReason,
        'fineValue': fineValue,
        'isFine': isFine,
        // if(costRoom!=null)
        // 'CostRoom': costRoom,
      },
    ).then((value) {
      emit(PutFinesSuccessStates());
    },
    ).catchError((error) {
      print('errrrrrrrror '+error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutFinesErrorStates(error.toString()));
    });
  }

  void postFines({
    required String idDB,
    required String fineReason,
    required int fineValue,
    required bool isFine,
  }) {
    emit(postFinesLoadingStates());

    DioHelper.postData(
      url: 'users/${idDB}/addfine',
      token: tokeen ?? '',
      data: {
        'fineReason': fineReason,
        'fineValue': fineValue,
        'isFine': isFine,
      },
    ).then((value) {
      if (value != null) {
        print(value.statusMessage);
        emit(postFinesSuccessStates());
        getAllUsers(query: {
          if(termNum == 1)
            'firstTerm':true,
          if(termNum == 2)
            'secondTerm':true,
          if(termNum == 3)
            'thirdTerm':true,
          if(isStudentKind)
            'isStudent':true,
          if(!isStudentKind)
            'isEmployee':true,
        });
      }
    }).catchError((error) {
      print(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(postFinesErrorStates(error.toString()));
    });
  }





//security
  int currentSecurityBuildingVal = 0;
  void selectSecurityBuilding(int currentNum ,String text) {
    currentSecurityBuildingVal = currentNum;
    print(text);
    emit(SelectSecurityBuilding());
    getAllAttendance(
        query: {
          'buildingName': text
        }
    );
  }


  double animatedSecurityHeight = 0.0;
  bool showSecurity_details = false;
  int currentSecurityIndex = -1;
  void showSecurityDetails(bool show ,int index) {
    if(currentSecurityIndex == index){
      showSecurity_details = show;
      animatedSecurityHeight == 0.0? animatedSecurityHeight= 300.0: animatedSecurityHeight= 0.0;
      emit(ShowSecurityDetails());
    }
  }

  bool showSecurityEdit = false;
  void changeSecurityEditIcon(bool edit){
    showSecurityEdit = edit;
    emit(ChangeSecurityEditIcon());
  }


  List<GetDashSecurityModel> allAttendance = [];
  void getAllAttendance({Map<String, dynamic>? query }) {
    print('----------get all Attendance----------');
    emit(GetAllAttendanceLoadingStates());
    allAttendance = [];
    DioHelper.getData(
      url: ALL_ATTENDANCE,
      token: tokeen ?? '',
      query: query,
    ).then((value) {
      if (value != null) {
        value.data.forEach((element) {
          allAttendance.add(GetDashSecurityModel.fromJson(element));
        });
        emit(GetAllAttendanceSuccessStates());
      }
    }).catchError((error) {
      print('get all Attendance '+error.toString());
      emit(GetAllAttendanceErrorStates(error.toString()));
    });
  }


  // void getAttendanceByBuilding({
  //   String? username,
  // }) {
  //   emit(GetUserSecurityLoadingStates());
  //   DioHelper.getData(
  //     url: '$GET_USERSECUTIRY?username=$username',
  //     token: tokeen ?? '',
  //   ).then((value) {
  //     if (value != null) {
  //
  //       // printFullText(value.data.toString());
  //       mainSecurityModel = [];
  //       value.data.forEach((element) {
  //         mainSecurityModel.add(MainSecurityModel.fromJson(element));
  //       });
  //       print('-----------user security-----------success');
  //       emit(GetUserSecuritySuccessStates());
  //     }
  //   }).catchError((error) {
  //     print('-----------user security-----------${error.toString()}');
  //     emit(GetUserSecurityErrorStates(error.toString()));
  //   });
  // }



// requests

  GetAllOrdersModel? allOrders;
  void getAllOrders() {
    print('----------get all order----------');
    emit(GetAllOrdersLoadingStates());
    DioHelper.getData(
      url: ALL_ORDERS,
      token: tokeen ?? '',
    ).then((value) {
      if (value != null) {
        allOrders = GetAllOrdersModel.fromJson(value.data);
        emit(GetAllOrdersSuccessStates());
      }
    }).catchError((error) {
      print('get all order '+error.toString());
      emit(GetAllOrdersErrorStates(error.toString()));
    });
  }

  void putReplayBookRoom({
    required String idDB,
    required String reply,
    required bool isAccepted,
    required bool isWaiting,
    required bool isReplied,
  }) {
    emit(PutReplayRoomLoadingStates());
    DioHelper.putData(
      url: 'users/bookingrequests/${idDB}/accept',
      token: tokeen ?? '',
      data: {
        'reply': reply,
        'isAccepted': isAccepted,
        'isWaiting': isWaiting,
        'isReplied': isReplied,
      },
    ).then((value) {
      emit(PutReplayRoomSuccessStates());
      getAllOrders();
    },
    ).catchError((error) {
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutReplayRoomErrorStates(error.toString()));
    });
  }


  void putReplayChange({
    required String idDB,
    required String reply,
    // required bool isAccepted,
    required bool isReplied,
  }) {
    emit(PutReplayChangeLoadingStates());
    DioHelper.putData(
      url: 'orders/requesttochangroom/${idDB}/replied',
      token: tokeen ?? '',
      data: {
        'reply': reply,
        // 'isAccepted': isAccepted,
        'isReplied': isReplied,
      },
    ).then((value) {
      emit(PutReplayChangeSuccessStates());
      getAllOrders();
    },
    ).catchError((error) {
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutReplayChangeErrorStates(error.toString()));
    });
  }


  void putReplayExit({
    required String idDB,
    required String reply,
    // required bool isAccepted,
    required bool isReplied,
  }) {
    emit(PutReplayExitLoadingStates());
    DioHelper.putData(
      url: 'orders/requesttoleft/${idDB}/replied',
      token: tokeen ?? '',
      data: {
        'reply': reply,
        // 'isAccepted': isAccepted,
        'isReplied': isReplied,
      },
    ).then((value) {
      emit(PutReplayExitSuccessStates());
      getAllOrders();
    },
    ).catchError((error) {
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutReplayExitErrorStates(error.toString()));
    });
  }


  void putEnquiry({
    required String idDB,
    required String enquiryAnswer,
    required bool isReplied,
  }) {
    emit(PutReplayEnquiryLoadingStates());
    DioHelper.putData(
      url: 'orders/enquiry/${idDB}/replied',
      token: tokeen ?? '',
      data: {
        'enquiryAnswer': enquiryAnswer,
        'isReplied': isReplied,
      },
    ).then((value) {
      emit(PutReplayEnquirySuccessStates());
      getAllOrders();
    },
    ).catchError((error) {
      printFullText(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutReplayEnquiryErrorStates(error.toString()));
    });
  }


  void putHosting({
    required String idDB,
    required String reply,
    required bool isReplied,
    // required bool isAccepted,
  }) {
    emit(PutReplayHostingLoadingStates());
    DioHelper.putData(
      url: 'orders/replytorequesttoaddguests/${idDB}/replied',
      token: tokeen ?? '',
      data: {
        'reply': reply,
        'isReplied': isReplied,
        // required bool isAccepted,
      },
    ).then((value) {
      emit(PutReplayHostingSuccessStates());
      getAllOrders();
    },
    ).catchError((error) {
      printFullText(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutReplayHostingErrorStates(error.toString()));
    });
  }

  void putFamilyReport({
    required String idDB,
    required String reply,
    required bool isReplied,
    // required bool isAccepted,
  }) {
    emit(PutReplayReportLoadingStates());
    DioHelper.putData(
      url: 'orders/endorsement/${idDB}/replied',
      token: tokeen ?? '',
      data: {
        'reply': reply,
        'isReplied': isReplied,
        // required bool isAccepted,
      },
    ).then((value) {
      emit(PutReplayReportSuccessStates());
      getAllOrders();
    },
    ).catchError((error) {
      printFullText(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutReplayReportErrorStates(error.toString()));
    });
  }

  void putMissing({
    required String idDB,
    required String reply,
    required bool isReplied,
    // required bool isAccepted,
  }) {
    emit(PutReplayMissingLoadingStates());
    DioHelper.putData(
      url: 'orders/addmissingthing/${idDB}/replied',
      token: tokeen ?? '',
      data: {
        'reply': reply,
        'isReplied': isReplied,
        // required bool isAccepted,
      },
    ).then((value) {
      emit(PutReplayMissingSuccessStates());
      getAllOrders();
    },
    ).catchError((error) {
      printFullText(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutReplayMissingErrorStates(error.toString()));
    });
  }

  void putDamaged({
    required String idDB,
    required String reply,
    required bool isReplied,
    // required bool isAccepted,
  }) {
    emit(PutReplayDamagedLoadingStates());
    DioHelper.putData(
      url: 'orders/damagedthings/${idDB}/replied',
      token: tokeen ?? '',
      data: {
        'reply': reply,
        'isReplied': isReplied,
        // required bool isAccepted,
      },
    ).then((value) {
      emit(PutReplayDamagedSuccessStates());
      getAllOrders();
    },
    ).catchError((error) {
      printFullText(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutReplayDamagedErrorStates(error.toString()));
    });
  }


  void putComplaints({
    required String idDB,
    required String reply,
    required bool isReplied,
    // required bool isAccepted,
  }) {
    emit(PutReplayComplaintsLoadingStates());
    DioHelper.putData(
      url: 'orders/complaint/${idDB}/replied',
      token: tokeen ?? '',
      data: {
        'reply': reply,
        'isReplied': isReplied,
        // required bool isAccepted,
      },
    ).then((value) {
      emit(PutReplayComplaintsSuccessStates());
      getAllOrders();
    },
    ).catchError((error) {
      printFullText(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutReplayComplaintsErrorStates(error.toString()));
    });
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
