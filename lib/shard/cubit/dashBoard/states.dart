abstract class DashBoardStates {}

class DashBoardInitialState extends DashBoardStates {}

//get profile data from API
class GetProfileLoadingStates extends DashBoardStates {}
class GetProfileSuccessStates extends DashBoardStates {}
class GetProfileErrorStates extends DashBoardStates {
  final String error;

  GetProfileErrorStates(this.error);
}

// add building
class ChangeBuildingLevel extends DashBoardStates {}
class ChangeBuildingStatues extends DashBoardStates {}
class ChangeGenderStatues extends DashBoardStates {}
class postBuildingLoadingStates extends DashBoardStates {}
class postBuildingSuccessStates extends DashBoardStates {}
class postBuildingErrorStates extends DashBoardStates {
  final String error;
  postBuildingErrorStates(this.error);
}

// add room
class ChangeRoomType extends DashBoardStates {}
class ChangeRoomFor extends DashBoardStates {}
class ChangeRoomStatues extends DashBoardStates {}
class postRoomLoadingStates extends DashBoardStates {}
class postRoomSuccessStates extends DashBoardStates {}
class postRoomErrorStates extends DashBoardStates {}

// Available now
class GetAvailableNowLoadingStates extends DashBoardStates {}
class GetAvailableNowSuccessStates extends DashBoardStates {}
class GetAvailableNowErrorStates extends DashBoardStates {
  final String error;
  GetAvailableNowErrorStates(this.error);
}
class ShowBuildingDetails extends DashBoardStates {}
class ShowRoomDetails extends DashBoardStates {}
class ChangeBuildingEditIcon extends DashBoardStates {}
class ChangeRoomEditIcon extends DashBoardStates {}
class SelectBuildingState extends DashBoardStates {}
class SelectBuildingLevel extends DashBoardStates {}
class SelectBuildingGender extends DashBoardStates {}
class SelectRoomState extends DashBoardStates {}
class SelectRoomLevel extends DashBoardStates {}
class SelectRoomGender extends DashBoardStates {}
class DeleteBuildingLoadingStates extends DashBoardStates {}
class DeleteBuildingSuccess extends DashBoardStates {}
class DeleteBuildingError extends DashBoardStates {
  final String error;
  DeleteBuildingError(this.error);
}
class PutRoomLoadingStates extends DashBoardStates {}
class PutRoomSuccessStates extends DashBoardStates {}
class PutRoomErrorStates extends DashBoardStates {
  final String error;
  PutRoomErrorStates(this.error);
}
class PutBuildingLoadingStates extends DashBoardStates {}
class PutBuildingSuccessStates extends DashBoardStates {}
class PutBuildingErrorStates extends DashBoardStates {
  final String error;
  PutBuildingErrorStates(this.error);
}



// Add news
class NewsImagePickedSuccessState extends DashBoardStates {}
class NewsImagePickedErrorState extends DashBoardStates {}
class ImageRemoveSuccessState extends DashBoardStates {}
class GetNewsLoadingStates extends DashBoardStates {}
class GetNewsSuccessStates extends DashBoardStates {}
class GetNewsErrorStates extends DashBoardStates {
  final String error;

  GetNewsErrorStates(this.error);
}
class PostNewsLoadingStates extends DashBoardStates {}
class PostNewsSuccessStates extends DashBoardStates {}
class PostNewsErrorStates extends DashBoardStates {
  final String error;

  PostNewsErrorStates(this.error);
}
class DelNewsLoadingStates extends DashBoardStates {}
class DelNewsSuccessStates extends DashBoardStates {}
class DelNewsErrorStates extends DashBoardStates {
  final String error;

  DelNewsErrorStates(this.error);
}


// Students
class ChangeTerm extends DashBoardStates {}
class ChangePeopleType extends DashBoardStates {}
class ShowStudentDetails extends DashBoardStates {}
class ChangeStudentEditIcon extends DashBoardStates {}
class DeleteStudentSuccess extends DashBoardStates {}
class SelectStudentGender extends DashBoardStates {}
class SelectStudentLevel extends DashBoardStates {}
class SelectStudentJob extends DashBoardStates {}
class SelectStudentCredit extends DashBoardStates {}
class SavingCurrentStudentsModelSuccess extends DashBoardStates {}



//security
class SelectSecurityBuilding extends DashBoardStates {}
class ShowSecurityDetails extends DashBoardStates {}
class ChangeSecurityEditIcon extends DashBoardStates {}

//requests
class SavingCurrentComplaintsModelSuccess extends DashBoardStates {}
class SavingCurrentQueriesModelSuccess extends DashBoardStates {}


//changePassword
class ChangePasswordVisibilityState extends DashBoardStates {}


// rooms home screen
class GetAllRoomsLoadingStates extends DashBoardStates {}
class GetAllRoomsSuccessStates extends DashBoardStates {}
class GetAllRoomsErrorStates extends DashBoardStates {
  final String error;
  GetAllRoomsErrorStates(this.error);
}

