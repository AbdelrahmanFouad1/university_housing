import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/main_security_model.dart';
import 'package:university_housing/model/profile_model.dart';
import 'package:university_housing/moduls/security/success/success_enttre_student_screen.dart';
import 'package:university_housing/moduls/security/success/success_exit_student_screen.dart';
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
  void showStudentWarning ({
    required bool isLate,
}){
    showWarning = isLate;
    emit(SecurityShowWarningState());
  }


  List<MainSecurityModel> mainSecurityModel = [];

  void getUserInSecurity({
    Map<String, dynamic>? query
}) {

    print('-----------user security-----------');

    emit(GetUserSecurityLoadingStates());
    DioHelper.getData(
      url: GET_USERSECUTIRY,
      token: tokeen ?? '',
      query: query
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


  void postAttendance({
    required String idDB,
    required String enterAt,
    required String enterDate,
    required context,
    String? Notes,
  }) {
    emit(PostAttendanceLoadingStates());

    DioHelper.postData(
      url: 'users/${idDB}/security',
      token: tokeen ?? '',
      data: {
          'enterAt': enterAt,
          'enterDate': enterDate,
        if(Notes!=null)
          'Notes': Notes,
      },
    ).then((value) {
      if (value != null) {
        print(value.statusMessage);
        emit(PostAttendanceSuccessStates());
        navigateTo(context, const SuccessEnterStudentScreen());
      }
    }).catchError((error) {
      print(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PostAttendanceErrorStates());
    });
  }


  void putAttendance({
    required String idDB,
    required String enterAt,
    required String enterDate,
    required String exitDate,
    required String exitAt,
    required String attendanceID,
    required context,
    String? Notes,
  }) {
    emit(PutAttendanceLoadingStates());

    DioHelper.putData(
      url: 'users/$idDB/security/exit',
      token: tokeen ?? '',
      data: {
        '_id':attendanceID,
        'enterAt': enterAt,
        'enterDate': enterDate,
        'exitDate': exitDate,
        'exitAt': exitAt,
        if(Notes!=null)
          'Notes': Notes,
      },
    ).then((value) {
      if (value != null) {
        emit(PutAttendanceSuccessStates());
        navigateTo(context, const SuccessExitStudentScreen());
      }
    }).catchError((error) {
      print(error.toString());
      showToast(message: 'حدث خطأ ما, برجاء المحاوله في وقت لاحق', state: ToastStates.ERROR);
      emit(PutAttendanceErrorStates());
    });
  }



 }