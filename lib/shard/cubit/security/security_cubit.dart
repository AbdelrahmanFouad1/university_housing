import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/profile_model.dart';
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
        // printFullText(value.data.toString());
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

 }