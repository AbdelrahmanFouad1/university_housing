import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_housing/model/comments_model.dart';
import 'package:university_housing/model/news_model.dart';
import 'package:university_housing/model/profile_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/network/end_point.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/network/remote/dio_helper.dart';
import 'package:university_housing/shard/style/color.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  // Home Screen
  ProfileModel? profileModel;
  String? tokeen = CacheHelper.getData(key: 'token');

  int sum = 0;

  void getProfileData(){

    emit(GetProfileLoadingStates());

    DioHelper.getData(
      url: USERS_PROFILE,
      token: tokeen??'',
    ).then((value) {
      sum = 0;
      if(value != null){
        // printFullText(value.data.toString());
        profileModel = ProfileModel.fromJson(value.data);
        for (var element in profileModel!.fines) {
          sum += element.fineValue;
        }
        emit(GetProfileSuccessStates());
      }
    }).catchError((error){
      print(error.toString());
      emit(GetProfileErrorStates(error.toString()));
    });
  }

  NewsModel? newsModel;

  void getNews(){
    emit(GetNewsLoadingStates());

    DioHelper.getData(
      url: NEWS,
    ).then((value) {
      if(value != null){
        // printFullText(value.data.toString());
        newsModel = NewsModel.fromJson(value.data);
        emit(GetNewsSuccessStates());
      }
    }).catchError((error){
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
      token: tokeen??'',
      data: {
        'damagedthing': complaints,
      },
    ).then((value) {
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
      token: tokeen??'',
      data: {
        'missingthing': complaints,
      },
    ).then((value) {
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
      token: tokeen??'',
      data: {
        'complaint': complaints,
      },
    ).then((value) {
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

  void postStudentGuest({
    required String name,
    required String date,
    required String durationOfHosting,
    required String studentId,
  }) {
    emit(PostGuestLoadingStates());

    DioHelper.postData(
      url: ORDER_GUEST,
      token: tokeen??'',
      data: {
        'NameofGuest': name,
        'HostDate': date,
        'DurationOfHosting': durationOfHosting,
        'studentId': studentId,

      },
    ).then((value) {
      emit(PostGuestSuccessStates());
    },
    ).catchError((error) {
      print(error.toString());
      emit(PostGuestErrorStates(error));
    });
  }

  void postGuest({
    required String name,
    required String date,
    required  String durationOfHosting,
    required String guestIsIDCard,
    required String relation,
  }) {
    emit(PostGuestLoadingStates());

    DioHelper.postData(
      url: ORDER_GUEST,
      token: tokeen??'',
      data: {
        'NameofGuest': name,
        'HostDate': date,
        'DurationOfHosting': durationOfHosting,
        'guestIsIDCard': guestIsIDCard,
        'relation': relation,
      },
    ).then((value) {
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
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      nationalIdImage = File(pickedFile.path);
      emit(NationalIdImageSuccessState());
    } else {
      print('No image selected.');
      emit(NationalIdImageErrorState());
    }
  }

  Future<void> removeNationalIdImage() async {
    nationalIdImage = null;
    emit(RemoveNationalIdImageState());
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
      getProfileData();
      emit(ImagePickedErrorState());
    }
  }

  Future<void> removePikeImage() async {
    familyImage = null;
    emit(ImageRemoveSuccessState());
  }

  void postReports({
    required String reason,
    required String image,
  }) {
    emit(PostReportLoadingStates());

    DioHelper.postData(
      url: ORDERS_REPORT,
      token: tokeen??'',
      data: {
        'reason': reason,
        'parentIsendorsement': image,
      },
    ).then((value) {
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
      token: tokeen??'',
      data: {
        'enquiry': queries,
      },
    ).then((value) {
      emit(PostQueriesSuccessStates());
    },
    ).catchError((error) {
      print(error.toString());
      emit(PostQueriesErrorStates(error));
    });
  }

  List<CommentsModel>? commentModel = [];
  void getQueriesData(){

    emit(GetQueriesLoadingStates());

    DioHelper.getData(
      url: ORDERS_ENQUIRES,
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxN2MzNzg2ZjMzZWViMDAxNmQxNmI4ZiIsImlhdCI6MTYzNTg0NTI2MiwiZXhwIjoxNjM4NDM3MjYyfQ.qTyr2yr-3h-klgP2AOmtHS9DOqNksDMvk5CbaQxqUbY',
    ).then((value) {
      if(value != null){
        // printFullText(value.data.toString());
        value.data.forEach((element) {
          commentModel!.add(CommentsModel.fromJson(element)) ;
        });
        getProfileData();
        emit(GetQueriesSuccessStates());
      }
    }).catchError((error){
      getProfileData();
      print(error.toString());
      emit(GetQueriesErrorStates(error.toString()));
    });
  }



  // edit profile screen
  bool isDark = false ;
  void toggleButton(){
    isDark =!isDark;
    emit(ChangeThemeSuccessState());
  }

  File? profileImage;
  var profilePicker = ImagePicker();
  Icon icon = Icon(
    Icons.edit,
    color: mainColors,
  );
  CircleAvatar img = const CircleAvatar(
    radius: 60,
    backgroundImage:
        NetworkImage('https://cdn-icons-png.flaticon.com/512/149/149071.png'),
  );

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

  void postChangeRoom({
    required int room,
    required int floor,
  }) {
    emit(PostChangeRoomLoadingStates());

    DioHelper.postData(
      url: ORDER_CHANGE_ROOM,
      token: tokeen??'',
      data: {
        'numofnextroom': room,
        'floornumberofnextroom': floor,
      },
    ).then((value) {
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
  bool? isDouble= false;
  bool? agree= false;
  bool isStudent_job = true;
  bool isBoy = true;

  void changeIsStudent_job(bool student) {
    isStudent_job = student;
    emit(ChangeStudentJobState());
  }

  void changeIsBoy(bool kind) {
    isBoy = kind;
    emit(ChangeKindState());
  }

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


  void IsAgree(bool IsAgree){
    agree = IsAgree;
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
      token: tokeen??'',
      data: {
        'reason': reason,
      },
    ).then((value) {
      emit(PostLeavingSuccessStates());
    },
    ).catchError((error) {
      print(error.toString());
      emit(PostLeavingErrorStates(error));
    });
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

  // E-payment Screen

  String cardNumber = '';
  String expiryDate= '';
  String cardHolderName = '';
  String cvvCode= '';
  bool isCvvFocused = false;

void changeCreditCardModel(CreditCardModel creditCardModel){
  cardNumber = creditCardModel.cardNumber;
  expiryDate = creditCardModel.expiryDate;
  cardHolderName = creditCardModel.cardHolderName;
  cvvCode = creditCardModel.cvvCode;
  isCvvFocused = creditCardModel.isCvvFocused;

  emit(ChangeCreditCardModelState());
}

// notifications
bool isBus = false;

}