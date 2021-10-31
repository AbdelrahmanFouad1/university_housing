abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeRegisterStudentState extends AppStates {}

class ImagePickedSuccessState extends AppStates {}

class RemovePikeIdImageState extends AppStates {}

class ImagePickedErrorState extends AppStates {}

class ChangeStudentState extends AppStates {}

class DoubleClickState extends AppStates {}

class ChangeThemeSuccessState extends AppStates {}

class ImageRemoveSuccessState extends AppStates {}

class SelectHouseSuccessState extends AppStates {}

class SelectFloorState extends AppStates {}

class SelectRoomState extends AppStates {}

class ShowAllDetailsSuccessState extends AppStates {}

class IsDoubleSuccessState extends AppStates {}

class IsAgreeSuccessState extends AppStates {}

class ChangeFloorState extends AppStates {}

class ChangeRoomState extends AppStates {}

class ChangeStudentJobState extends AppStates {}

class ChangeKindState extends AppStates {}

class ChangeCreditCardModelState extends AppStates {}

class NationalIdImageSuccessState extends AppStates {}

class NationalIdImageErrorState extends AppStates {}

class RemoveNationalIdImageState extends AppStates {}

class GetProfileLoadingStates extends AppStates {}

class GetProfileSuccessStates extends AppStates {}

class GetProfileErrorStates extends AppStates {
  final String error;

  GetProfileErrorStates(this.error);
}

class PostComplaintsLoadingStates extends AppStates {}

class PostComplaintsSuccessStates extends AppStates {}

class PostComplaintsErrorStates extends AppStates {
  final String error;

  PostComplaintsErrorStates(this.error);
}

class PostDamagedLoadingStates extends AppStates {}

class PostDamagedSuccessStates extends AppStates {}

class PostDamagedErrorStates extends AppStates {
  final String error;

  PostDamagedErrorStates(this.error);
}

class PostLostLoadingStates extends AppStates {}

class PostLostSuccessStates extends AppStates {}

class PostLostErrorStates extends AppStates {
  final String error;

  PostLostErrorStates(this.error);
}







