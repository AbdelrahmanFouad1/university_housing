import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_housing/model/comments_model.dart';
import 'package:university_housing/model/get_buildings_model.dart';
import 'package:university_housing/model/get_notifications_model.dart';
import 'package:university_housing/model/get_reviews_model.dart';
import 'package:university_housing/model/my_orders_model.dart';
import 'package:university_housing/model/news_model.dart';
import 'package:university_housing/model/profile_model.dart';
import 'package:university_housing/moduls/booking_room/booking_room2_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/network/end_point.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/network/remote/dio_helper.dart';
import 'package:university_housing/shard/style/color.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // Home Screen
  ProfileModel? profileModel;
  String? tokeen = CacheHelper.getData(key: 'token');

  int sum = 0;

  void getProfileData() {
    emit(GetProfileLoadingStates());

    DioHelper.getData(
      url: USERS_PROFILE,
      token: tokeen ?? '',
    ).then((value) {
      sum = 0;
      if (value != null) {
        // printFullText(value.data.toString());
        profileModel = ProfileModel.fromJson(value.data);
        for (var element in profileModel!.fines) {
          sum += element.fineValue;
        }
        emit(GetProfileSuccessStates());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorStates(error.toString()));
    });
  }

  NewsModel? newsModel;

  void getNews() {
    emit(GetNewsLoadingStates());

    DioHelper.getData(
      url: NEWS,
    ).then((value) {
      if (value != null) {
        // printFullText(value.data.toString());
        newsModel = NewsModel.fromJson(value.data);
        emit(GetNewsSuccessStates());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetNewsErrorStates(error.toString()));
    });
  }

  // Change Damaged Screen
  void postDamaged({
    required String complaints,
  }) {
    emit(PostDamagedLoadingStates());

    DioHelper.postData(
      url: ORDERS_DAMAGED,
      token: tokeen ?? '',
      data: {
        'damagedthing': complaints,
      },
    ).then(
      (value) {
        emit(PostDamagedSuccessStates());
      },
    ).catchError((error) {
      print(error.toString());
      emit(PostDamagedErrorStates(error));
    });
  }

  // Change lost Screen
  void postLost({
    required String complaints,
  }) {
    emit(PostLostLoadingStates());

    DioHelper.postData(
      url: ORDERS_MISSING,
      token: tokeen ?? '',
      data: {
        'missingthing': complaints,
      },
    ).then(
      (value) {
        emit(PostLostSuccessStates());
      },
    ).catchError((error) {
      print(error.toString());
      emit(PostLostErrorStates(error));
    });
  }

  // Complaints Screen
  void postComplaints({
    required String complaints,
  }) {
    emit(PostComplaintsLoadingStates());

    DioHelper.postData(
      url: ORDERS_COMPLAINTS,
      token: tokeen ?? '',
      data: {
        'complaint': complaints,
      },
    ).then(
      (value) {
        emit(PostComplaintsSuccessStates());
      },
    ).catchError((error) {
      print(error.toString());
      emit(PostComplaintsErrorStates(error));
    });
  }

  // Hosting Requests Screen
  bool isStudent = true;

  void changeIsStudent(bool student) {
    isStudent = student;
    emit(ChangeStudentState());
  }

  var picker = ImagePicker();
  File? idImage;


  Future<void> pikeIdImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery).then((value){
      idImage = File(value!.path);
      emit(ImagePickedSuccessState());
    });
  }

  Future<void> removePikePostImage() async {
    idImage = null;
    emit(RemovePikeIdImageState());
  }


  Future<void> postStudentGuest({
    required String name,
    required String date,
    required String guestID,
    required String relation,
    required String durationOfHosting,
    required File studentIdCard,
    required bool isStudent,
  }) async {
    emit(PostGuestLoadingStates());

    DioHelper.postData(
      url: ORDER_GUEST,
      token: tokeen ?? '',
      data: FormData.fromMap(
        {
          'NameofGuest': name,
          'HostDate': date,
          'DurationOfHosting': durationOfHosting,
          'isStudent': isStudent,
          'studentId': guestID,
          'relation': relation,
          'guestIsIDCard':  await MultipartFile.fromFile(
            studentIdCard.path,
            filename: Uri.file(studentIdCard.path).pathSegments.last),
        },
      )
    ).then(
      (value) {
        showToast(message: 'تم رفع الطلب بنجاح', state: ToastStates.SUCCESS);
        emit(PostGuestSuccessStates());
      },
    ).catchError((error) {
      print(error.toString());
      emit(PostGuestErrorStates(error));
    });
  }

  

  // Booking Room 1
  File? nationalIdImage;

  Future<void> pikeNationalIdImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    ).then((value){
      nationalIdImage = File(value!.path);
      emit(NationalIdImageSuccessState());
    });
  }

  Future<void> removeNationalIdImage() async {
    nationalIdImage = null;
    emit(RemoveNationalIdImageState());
  }

  // family Report
  File? familyImage;

  Future<void> pikeFamilyImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,).then((value){
      familyImage = File(value!.path);
      emit(ImagePickedSuccessState());

    });
  }

  Future<void> removePikeImage() async {
    familyImage = null;
    emit(ImageRemoveSuccessState());
  }

  Future<void> postReports({
    required String reason,
    required File image,
  }) async {
    emit(PostReportLoadingStates());

    DioHelper.postData(
      url: ORDERS_REPORT,
      token: tokeen ?? '',
      data: FormData.fromMap(
          {
            'reason': reason,
            'parentIsendorsement': await MultipartFile.fromFile(
              image.path,
              filename: Uri.file(image.path).pathSegments.last),
          }
      )
    ).then(
      (value) {
        emit(PostReportSuccessStates());
      },
    ).catchError((error) {
      print(error.toString());
      emit(PostReportErrorStates(error));
    });
  }

  //Queries Screen
  void postQueries({
    required String queries,
  }) {
    emit(PostQueriesLoadingStates());

    DioHelper.postData(
      url: ORDERS_ENQUIRES,
      token: tokeen ?? '',
      data: {
        'enquiry': queries,
      },
    ).then(
      (value) {
        emit(PostQueriesSuccessStates());
      },
    ).catchError((error) {
      print(error.toString());
      emit(PostQueriesErrorStates(error));
    });
  }

  List<CommentsModel>? commentModel = [];

  void getQueriesData() {
    commentModel = [];
    emit(GetQueriesLoadingStates());
    DioHelper.getData(
      url: ORDERS_ENQUIRES,
    ).then((value) {
      if (value != null) {
        value.data.forEach((element) {
          commentModel!.add(CommentsModel.fromJson(element));
        });
        emit(GetQueriesSuccessStates());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetQueriesErrorStates(error.toString()));
    });
  }

  // edit profile screen
  bool isDark = false;

  void toggleButton() {
    isDark = !isDark;
    emit(ChangeThemeSuccessState());
  }

  File? profileImage;
  Icon icon = Icon(
    Icons.edit,
    color: mainColors,
  );

  late CircleAvatar img;

  Future<void> pikeProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    ).then((value){
      profileImage = File(value!.path);
      icon = Icon(
        Icons.check_rounded,
        color: mainColors,
      );
      emit(ImagePickedSuccessState());
    }).catchError((error){
      emit(ImagePickedErrorState());
      showToast(state: ToastStates.WARNING, message: 'لم يتم أختيار الصوره');
    });

  }



  Future<void> uploadImage({
  required File image,
}) async {
  emit(UpdateImgLoadingStates());
  DioHelper.putData(
    url: PUT_PROFILE,
    token: tokeen,
    data: FormData.fromMap(
        {
          'image': await MultipartFile.fromFile(
              image.path,
              filename: Uri.file(image.path).pathSegments.last),
        }
    )
  ).then((value){
    showToast(state: ToastStates.SUCCESS, message: 'تم رفع الصوره بنجاح');
    emit(UpdateImgSuccessState());
    profileImage = null;
    icon = Icon(
      Icons.edit,
      color: mainColors,
    );
    getProfileData();
  }).catchError((error){
    print('Erooooooooooor ==> ' + error.toString());
    emit(UpdateImgErrorStates(error.toString()));
    showToast(message: 'لم يتم رفع الصوره , الرجاء المحاولة في وقت لاحق', state: ToastStates.ERROR);
  });

  }





  // Change Room Screen
  int currVal = 0;
  String currText = '';

  void changeFloor(int currentNum, String currentFloor ) {
    currVal = currentNum;
    currText = currentFloor;
    // todo اجيب ازاي id المبني الي ساكن فيه
    // getFloorAndRooms();
    emit(ChangeFloorState());
  }

  int currRoomVal = 0;
  String currRoomText = '';
  String currRoomIdDB = '';

  void changeRoom(int currentNum, String currentFloor ,String idDB) {
    currRoomVal = currentNum;
    currRoomText = currentFloor;
    currRoomIdDB = idDB;
    emit(ChangeRoomState());
  }

  void postChangeRoom({
    required int room,
    required int floor,
    //todo محتاجه ازودهم هنا + حجز الغرف
    // required String roomIdDB,
    // required String BuildingIdDB,
  }) {
    emit(PostChangeRoomLoadingStates());

    DioHelper.postData(
      url: ORDER_CHANGE_ROOM,
      token: tokeen ?? '',
      data: {
        'numofnextroom': room,
        'floornumberofnextroom': floor,
      },
    ).then(
      (value) {
        emit(PostChangeRoomSuccessStates());
      },
    ).catchError((error) {
      print(error.toString());
      emit(PostChangeRoomErrorStates(error));
    });
  }

//  Booking Room

  int selectedHouse = -1;
  bool? showDetails = false;
  bool? showAll = false;
  bool? isDouble = false;
  bool? agree = false;
  int term = 1;
  bool isBoy = true;

  void changeTerm(int first) {
    term = first;
    emit(ChangeTermState());
  }

  void changeIsBoy(bool kind) {
    isBoy = kind;
    emit(ChangeKindState());
  }

  void changeHouseColor(int selected) {
    selectedHouse = selected;
    showDetails = true;
    emit(SelectHouseSuccessState());
  }

  void showAllDetails(bool show) {
    showAll = show;
    emit(ShowAllDetailsSuccessState());
  }

  void IsDouble(bool double) {
    isDouble = double;
    emit(IsDoubleSuccessState());
  }

  void IsAgree(bool IsAgree) {
    agree = IsAgree;
    emit(IsAgreeSuccessState());
  }

  int currentFloorVal = -1;
  String currentText = '';

  void selectFloor(int currentNum, String currentFloor) {
    currentFloorVal = currentNum;
    currentText = currentFloor;
    getFloorAndRooms(selectedBuildingItem);
    emit(SelectFloorState());
  }

  int currentRoomVal = -1;
  String currentRoomText = '';
  String currentRoomIdDB = '';

  void selectRoom(int currentNum, String currentFloor ,String idDB) {
    currentRoomVal = currentNum;
    currentRoomText = currentFloor;
    currentRoomIdDB = idDB;
    emit(SelectRoomState());
  }


  //Leaving Room Screen
  bool isReason = true;

  void changeIsReason(bool reason) {
    isReason = reason;
    emit(ChangeReasonState());
  }

  void postLeavingRoom({
    required String reason,
  }) {
    emit(PostLeavingLoadingStates());

    DioHelper.postData(
      url: ORDER_LEAVING,
      token: tokeen ?? '',
      data: {
        'reason': reason,
      },
    ).then(
      (value) {
        emit(PostLeavingSuccessStates());
      },
    ).catchError((error) {
      print(error.toString());
      emit(PostLeavingErrorStates(error));
    });
  }


//  receipt screen
  File? receiptImage;

  Future<void> pikeReceiptImage() async {
    final pickedFile = await picker.pickImage(
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

  // Follow Requests Screen
  MyOrdersModel? myOrdersModel;

  void getOrderData() {
    emit(GetOrderLoadingStates());

    DioHelper.getData(
      url: ORDER_MYORDER,
      token: tokeen ?? '',
    ).then((value) {
      // printFullText(value.data.toString());
      myOrdersModel = MyOrdersModel.fromJson(value!.data);
      emit(GetOrderSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(GetOrderErrorStates(error.toString()));
    });
  }

  // E-payment Screen

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void changeCreditCardModel(CreditCardModel creditCardModel) {
    cardNumber = creditCardModel.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;

    emit(ChangeCreditCardModelState());
  }

// notifications
  bool isBus = false;




// Booking room api


  void getBuildings() {
    emit(GetBuildingDataLoadingStates());

    DioHelper.getData(
      url: GET_BUILDINGS,
      query: {
        'gender':profileModel!.gender,
        'availability': 'true'
      },
    ).then((value) {
      if (value != null) {
        buildings = GetBuildingsModel.fromJson(value.data);
        emit(GetBuildingDataSuccessStates());
      }
    }).catchError((error) {
      print('Erooooooooooor ==> ' + error.toString());
      emit(GetBuildingDataErrorStates(error.toString()));
    });
  }

  List<SelectFloorModel> groupFloor = [
    SelectFloorModel(text: 'الأول', index: 1),
    SelectFloorModel(text: 'الثاني', index: 2),
    SelectFloorModel(text: 'الثالث', index: 3),
    SelectFloorModel(text: 'الرابع', index: 4),
  ];

  List<RoomData> roomsList= [];
  int selectedBuildingItem = -1;


  void getFloorAndRooms(int index) {
     roomsList= [];
    buildings!.Buildings[index].rooms.forEach((element) {
      if(currentFloorVal == 1){
        if(element.floor == 1 && element.userresidentName.isEmpty && element.availability ==true){
          roomsList.add(RoomData(roomNum:element.roomnumber,idDB: element.idDB,index: element.roomnumber));
        }
      }else if(currentFloorVal == 2){
        if(element.floor == 2 && element.userresidentName.isEmpty && element.availability ==true){
          roomsList.add(RoomData(roomNum:element.roomnumber,idDB: element.idDB ,index: element.roomnumber));
        }
      }else if(currentFloorVal == 3){
        if(element.floor == 3 && element.userresidentName.isEmpty && element.availability ==true){
          roomsList.add(RoomData(roomNum:element.roomnumber,idDB: element.idDB ,index: element.roomnumber));
        }
      }else{
        if(element.floor == 4 && element.userresidentName.isEmpty && element.availability ==true){
          roomsList.add(RoomData(roomNum:element.roomnumber,idDB: element.idDB ,index: element.roomnumber));
        }
      }
    });

    emit(GetFloorAndRoomSuccessStates());
  }


  Future<void> postBookingRoom({
    required bool firstTerm,
    required bool secondTerm,
    required bool thirdTerm,
    required bool gender,
    required bool buildingType,
    required String Section,
    required String phone,
    required String address,
    required String NationalID,
    required File cardPhoto,
    required String buildingName,
    required int roomnumber,
    required int floor,
  }) async {
    emit(PostBookingLoadingStates());

    DioHelper.postData(
      url: BOOKING_ROOM,
      token: tokeen ?? '',
      data:FormData.fromMap(
        {
          'firstTerm': firstTerm,
          'secondTerm': secondTerm,
          'thirdTerm': thirdTerm,
          'gender': gender,
          'buildingType': buildingType,
          'Section': Section,
          'phone': phone,
          'address': address,
          'NationalID': NationalID,
          'cardPhoto': await MultipartFile.fromFile(
            cardPhoto.path,
            filename: Uri.file(cardPhoto.path).pathSegments.last),
          'buildingName': buildingName,
          'roomnumber': roomnumber,
          'floor': floor,
        },
      )

    ).then(
      (value) {
        emit(PostBookingSuccessStates());
        CacheHelper.saveData(key: 'waiting',value: true);
        showToast(message: 'تم رفع الطلب بنجاح', state: ToastStates.SUCCESS);
      },
    ).catchError((error) {
      print(error.toString());
      emit(PostBookingErrorStates(error));
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
    });
  }


  // notification with api

  GetNotificationsModel? notifications;
  void getNotifications() {
    emit(GetNotificationsLoadingStates());

    DioHelper.getData(
      url: 'users/${profileModel!.idDB}/notification',
      // url: 'users/6175cc2bfcc4ec001613f3f1/notification',
      token: tokeen ?? '',
      // 'id': '6175cc2bfcc4ec001613f3f1',
    ).then((value) {
      if (value != null) {
        notifications = GetNotificationsModel.fromJson(value.data);
        emit(GetNotificationsSuccessStates());
      }
    }).catchError((error) {
      print('Erooooooooooor ==> ' + error.toString());
      emit(GetNotificationsErrorStates(error.toString()));
    });
  }



  // reviews with api
  List<Reviews> reviews =[];
  void getReviews(){
    reviews =[];
    DioHelper.getData(
      url: REVIEWS,
      token: tokeen,
    ).then((value) {
      if (value != null) {
        value.data.forEach((element) {
          reviews.add(Reviews.fromJson(element));
        });
        emit(GetReviewsSuccessStates());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetReviewsErrorStates(error.toString()));
    });
  }

  void postReviews({
  required String comment,
  required double rate,
  }){
    emit(PostReviewLoadingStates());

    DioHelper.postData(
      url: REVIEWS,
      token: tokeen ?? '',
      data: {
        'comment':comment,
        'rating':rate.toInt(),
      },
    ).then(
          (value) {
        emit(PostReviewSuccessStates());
        showToast(message: 'تمت إضافه التقييم بنجاح', state: ToastStates.SUCCESS);
        getReviews();
      },
    ).catchError((error) {
      emit(PostReviewErrorStates(error));
      showToast(message: 'نأسف لوجود عطل ما, حاول في وقت لاحق', state: ToastStates.ERROR);
    });
  }



}


class RoomData{
late String idDB;
late int roomNum;
late int index;

RoomData({
  required this.idDB,
  required this.roomNum,
  required this.index,
});
}
