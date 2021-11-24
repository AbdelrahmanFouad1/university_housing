abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeRegisterStudentState extends AppStates {}

class ImagePickedSuccessState extends AppStates {}

class RemovePikeIdImageState extends AppStates {}

class ImageRemoveSuccessState extends AppStates {}

class ImagePickedErrorState extends AppStates {}

class ChangeStudentState extends AppStates {}

class ChangeReasonState extends AppStates {}

class DoubleClickState extends AppStates {}

class ChangeThemeSuccessState extends AppStates {}

class SelectHouseSuccessState extends AppStates {}

class SelectFloorState extends AppStates {}

class SelectRoomState extends AppStates {}

class ShowAllDetailsSuccessState extends AppStates {}

class IsDoubleSuccessState extends AppStates {}

class IsAgreeSuccessState extends AppStates {}

class ChangeFloorState extends AppStates {}

class ChangeRoomState extends AppStates {}

class ChangeTermState extends AppStates {}

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

class PostReportLoadingStates extends AppStates {}

class PostReportSuccessStates extends AppStates {}

class PostReportErrorStates extends AppStates {
  final String error;

  PostReportErrorStates(this.error);
}

class PostQueriesLoadingStates extends AppStates {}

class PostQueriesSuccessStates extends AppStates {}

class PostQueriesErrorStates extends AppStates {
  final String error;

  PostQueriesErrorStates(this.error);
}

class GetQueriesLoadingStates extends AppStates {}

class GetQueriesSuccessStates extends AppStates {}

class GetQueriesErrorStates extends AppStates {
  final String error;

  GetQueriesErrorStates(this.error);
}

class GetNewsLoadingStates extends AppStates {}

class GetNewsSuccessStates extends AppStates {}

class GetNewsErrorStates extends AppStates {
  final String error;

  GetNewsErrorStates(this.error);
}

class PostChangeRoomLoadingStates extends AppStates {}

class PostChangeRoomSuccessStates extends AppStates {}

class PostChangeRoomErrorStates extends AppStates {
  final String error;

  PostChangeRoomErrorStates(this.error);
}

class PostGuestLoadingStates extends AppStates {}

class PostGuestSuccessStates extends AppStates {}

class PostGuestErrorStates extends AppStates {
  final String error;

  PostGuestErrorStates(this.error);
}

class PostLeavingLoadingStates extends AppStates {}

class PostLeavingSuccessStates extends AppStates {}

class PostLeavingErrorStates extends AppStates {
  final String error;

  PostLeavingErrorStates(this.error);
}

class GetOrderLoadingStates extends AppStates {}

class GetOrderSuccessStates extends AppStates {}

class GetOrderErrorStates extends AppStates {
  final String error;

  GetOrderErrorStates(this.error);
}



// booking room api
class PostBookingLoadingStates extends AppStates {}
class PostBookingSuccessStates extends AppStates {}
class PostBookingErrorStates extends AppStates {
  final String error;
  PostBookingErrorStates(this.error);
}


// get buildings from api
class GetBuildingDataLoadingStates extends AppStates {}
class GetBuildingDataSuccessStates extends AppStates {}
class GetBuildingDataErrorStates extends AppStates {
  final String error;
  GetBuildingDataErrorStates(this.error);
}
class GetFloorAndRoomSuccessStates extends AppStates {}


// get notifications from api
class GetNotificationsLoadingStates extends AppStates {}
class GetNotificationsSuccessStates extends AppStates {}
class GetNotificationsErrorStates extends AppStates {
  final String error;
  GetNotificationsErrorStates(this.error);
}

// get rate from api
class GetReviewsSuccessStates extends AppStates {}
class GetReviewsErrorStates extends AppStates {
  final String error;
  GetReviewsErrorStates(this.error);
}


//post rate to api

class PostReviewLoadingStates extends AppStates {}
class PostReviewSuccessStates extends AppStates {}
class PostReviewErrorStates extends AppStates {
  final String error;
  PostReviewErrorStates(this.error);
}

// update profile image
class UpdateImgLoadingStates extends AppStates {}
class UpdateImgSuccessState extends AppStates {}
class UpdateImgErrorStates extends AppStates {
  final String error;
  UpdateImgErrorStates(this.error);
}