import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/shard/cubit/states.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super (AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);


}