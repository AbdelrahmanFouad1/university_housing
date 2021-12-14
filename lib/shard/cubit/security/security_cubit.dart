import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/main_security_model.dart';
import 'package:university_housing/model/profile_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/components/constants.dart';
import 'package:university_housing/shard/cubit/security/security_states.dart';
import 'package:university_housing/shard/network/end_point.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/network/remote/dio_helper.dart';

class SecurityCubit extends Cubit<SecurityStates>{

  SecurityCubit() : super(SecurityInitialState());
  static SecurityCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;
  String? tokeen = CacheHelper.getData(key: 'token');

  void getSecurityProfileData() {
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

  bool showWarning = false;
  void showStudentWarning (bool isLate){
    if (isLate == true){
      showWarning == true;
      emit(SecurityShowWarningState());
    }else{
      emit(SecurityDoNotShowWarningState());
    }
  }


  //get Data From model and can search it
  List<MainSecurityModel> mainSecurityModel = [];

  void getUserInSecurity() {

    print('-----------user security-----------');

    emit(GetUserSecurityLoadingStates());
    DioHelper.getData(
      url: GET_USERSECUTIRY,
      token: tokeen ?? '',
    ).then((value) {
      if (value != null) {

        // printFullText(value.data.toString());
        mainSecurityModel = [];
        value.data.forEach((element) {
          mainSecurityModel.add(MainSecurityModel.fromJson(element));
        });
        print('-----------user security-----------success');
        emit(GetUserSecuritySuccessStates());
      }
    }).catchError((error) {
      print('-----------user security-----------${error.toString()}');
      emit(GetUserSecurityErrorStates(error.toString()));
    });
  }

  void getUserByNameInSecurity({
   String? username,
}) {

    print('-----------user security-----------');

    emit(GetUserSecurityLoadingStates());
    DioHelper.getData(
      url: '$GET_USERSECUTIRY?username=$username',
      token: tokeen ?? '',
    ).then((value) {
      if (value != null) {

        // printFullText(value.data.toString());
        mainSecurityModel = [];
        value.data.forEach((element) {
          mainSecurityModel.add(MainSecurityModel.fromJson(element));
        });
        print('-----------user security-----------success');
        emit(GetUserSecuritySuccessStates());
      }
    }).catchError((error) {
      print('-----------user security-----------${error.toString()}');
      emit(GetUserSecurityErrorStates(error.toString()));
    });
  }

  // todo post el enter baaaaaas  3wza ta3del
  void postAttendance({
    required String idDB,
    String? enterAt,
    String? enterDate,
    String? exitAt,
    String? exitDate,
    String? Notes,
  }) {
    emit(postAttendanceLoadingStates());

    DioHelper.postData(
      url: 'users/${idDB}/security',
      token: tokeen ?? '',
      data: {
        if(enterAt!=null)
          'enterAt': enterAt,
        if(enterDate!=null)
          'enterDate': enterDate,
        if(exitAt!=null)
          'exitAt': exitAt,
        if(exitDate!=null)
          'exitDate': exitDate,
        if(Notes!=null)
          'Notes': Notes,
      },
    ).then((value) {
      if (value != null) {
        print(value.statusMessage);
        emit(postAttendanceSuccessStates());
      }
    }).catchError((error) {
      print(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(postAttendanceErrorStates());
    });
  }

 }