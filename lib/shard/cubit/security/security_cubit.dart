import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/shard/cubit/security/security_states.dart';

class SecurityCubit extends Cubit<SecurityStates>{

  SecurityCubit() : super(SecurityInitialState());
  static SecurityCubit get(context) => BlocProvider.of(context);


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