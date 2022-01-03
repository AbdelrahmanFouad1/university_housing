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
class ImagePickedSuccessState extends DashBoardStates {}


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
class DeleteRoomLoadingStates extends DashBoardStates {}
class DeleteRoomSuccess extends DashBoardStates {}
class DeleteRoomError extends DashBoardStates {
  final String error;
  DeleteRoomError(this.error);
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
class SelectStudentTerm extends DashBoardStates {}
class SelectStudentLevel extends DashBoardStates {}
class SelectStudentJob extends DashBoardStates {}
class SelectStudentCredit extends DashBoardStates {}
class GetAllUsersLoadingStates extends DashBoardStates {}
class GetAllUsersSuccessStates extends DashBoardStates {}
class GetAllUsersErrorStates extends DashBoardStates {
  final String error;

  GetAllUsersErrorStates(this.error);
}
class PutStudentLoadingStates extends DashBoardStates {}
class PutStudentSuccessStates extends DashBoardStates {}
class PutStudentErrorStates extends DashBoardStates {
  final String error;
  PutStudentErrorStates(this.error);
}
class DeleteStudentLoadingStates extends DashBoardStates {}
class DeleteStudentSuccess extends DashBoardStates {}
class DeleteStudentError extends DashBoardStates {
  final String error;
  DeleteStudentError(this.error);
}
class postStudentLoadingStates extends DashBoardStates {}
class postStudentSuccessStates extends DashBoardStates {}
class postStudentErrorStates extends DashBoardStates {
  final String error;
  postStudentErrorStates(this.error);
}
class ChangeGender extends DashBoardStates {}
class ChangeJob extends DashBoardStates {}
class ChangeFinesIndex extends DashBoardStates {}
class ChangeFinesEditIcon extends DashBoardStates {}
class PutFinesLoadingStates extends DashBoardStates {}
class PutFinesSuccessStates extends DashBoardStates {}
class PutFinesErrorStates extends DashBoardStates {
  final String error;
  PutFinesErrorStates(this.error);
}
class postFinesLoadingStates extends DashBoardStates {}
class postFinesSuccessStates extends DashBoardStates {}
class postFinesErrorStates extends DashBoardStates {
  final String error;
  postFinesErrorStates(this.error);
}
class GetAllVouchersLoadingStates extends DashBoardStates {}
class GetAllVouchersSuccessStates extends DashBoardStates {}
class GetAllVouchersErrorStates extends DashBoardStates {
  final String error;

  GetAllVouchersErrorStates(this.error);
}
class DeleteFinesLoadingStates extends DashBoardStates {}
class DeleteFinesSuccess extends DashBoardStates {}
class DeleteFinesError extends DashBoardStates {
  final String error;
  DeleteFinesError(this.error);
}
class InputDataSuccess extends DashBoardStates {}





//security
class SelectSecurityBuilding extends DashBoardStates {}
class ShowSecurityDetails extends DashBoardStates {}
class ChangeSecurityEditIcon extends DashBoardStates {}
class GetAllOrdersLoadingStates extends DashBoardStates {}
class GetAllOrdersSuccessStates extends DashBoardStates {}
class GetAllOrdersErrorStates extends DashBoardStates {
  final String error;

  GetAllOrdersErrorStates(this.error);
}




//get all requests
class GetAllAttendanceLoadingStates extends DashBoardStates {}
class GetAllAttendanceSuccessStates extends DashBoardStates {}
class GetAllAttendanceErrorStates extends DashBoardStates {
  final String error;

  GetAllAttendanceErrorStates(this.error);
}
//book room
class PutReplayRoomLoadingStates extends DashBoardStates {}
class PutReplayRoomSuccessStates extends DashBoardStates {}
class PutReplayRoomErrorStates extends DashBoardStates {
  final String error;
  PutReplayRoomErrorStates(this.error);
}
//change room
class PutReplayChangeLoadingStates extends DashBoardStates {}
class PutReplayChangeSuccessStates extends DashBoardStates {}
class PutReplayChangeErrorStates extends DashBoardStates {
  final String error;
  PutReplayChangeErrorStates(this.error);
}
//exit room
class PutReplayExitLoadingStates extends DashBoardStates {}
class PutReplayExitSuccessStates extends DashBoardStates {}
class PutReplayExitErrorStates extends DashBoardStates {
  final String error;
  PutReplayExitErrorStates(this.error);
}
//enquiry
class PutReplayEnquiryLoadingStates extends DashBoardStates {}
class PutReplayEnquirySuccessStates extends DashBoardStates {}
class PutReplayEnquiryErrorStates extends DashBoardStates {
  final String error;
  PutReplayEnquiryErrorStates(this.error);
}
//hosting
class PutReplayHostingLoadingStates extends DashBoardStates {}
class PutReplayHostingSuccessStates extends DashBoardStates {}
class PutReplayHostingErrorStates extends DashBoardStates {
  final String error;
  PutReplayHostingErrorStates(this.error);
}
//report
class PutReplayReportLoadingStates extends DashBoardStates {}
class PutReplayReportSuccessStates extends DashBoardStates {}
class PutReplayReportErrorStates extends DashBoardStates {
  final String error;
  PutReplayReportErrorStates(this.error);
}
//missing
class PutReplayMissingLoadingStates extends DashBoardStates {}
class PutReplayMissingSuccessStates extends DashBoardStates {}
class PutReplayMissingErrorStates extends DashBoardStates {
  final String error;
  PutReplayMissingErrorStates(this.error);
}
//damaged
class PutReplayDamagedLoadingStates extends DashBoardStates {}
class PutReplayDamagedSuccessStates extends DashBoardStates {}
class PutReplayDamagedErrorStates extends DashBoardStates {
  final String error;
  PutReplayDamagedErrorStates(this.error);
}
//complaints
class PutReplayComplaintsLoadingStates extends DashBoardStates {}
class PutReplayComplaintsSuccessStates extends DashBoardStates {}
class PutReplayComplaintsErrorStates extends DashBoardStates {
  final String error;
  PutReplayComplaintsErrorStates(this.error);
}





//changePassword
class ChangePasswordVisibilityState extends DashBoardStates {}


// rooms home screen
class GetAllRoomsLoadingStates extends DashBoardStates {}
class GetAllRoomsSuccessStates extends DashBoardStates {}
class GetAllRoomsErrorStates extends DashBoardStates {
  final String error;
  GetAllRoomsErrorStates(this.error);
}

