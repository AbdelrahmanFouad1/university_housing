import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/shard/network/local/cache_helper.dart';
import 'package:university_housing/shard/style/theme/cubit/states.dart';

class ThemeCubit extends Cubit<ThemeStates> {

  ThemeCubit() : super(ThemeInitialState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool darkTheme = false;

  void changeTheme({fromShared}) {
    if (fromShared != null) {
      darkTheme = fromShared;

      emit(ThemeSuccessState());
    } else {
      darkTheme = !darkTheme;
      print('from cubit ${darkTheme}');
      CacheHelper.saveData(key: 'isDark', value: darkTheme).then(
            (value) {
          emit(ChangeThemeState());
        },
      );
    }
  }

}