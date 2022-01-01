abstract class SecurityStates {}

class SecurityInitialState extends SecurityStates {}

//get profile data from API
class GetProfileLoadingStates extends SecurityStates {}
class GetProfileSuccessStates extends SecurityStates {}
class GetProfileErrorStates extends SecurityStates {
  final String error;

  GetProfileErrorStates(this.error);
}

class SecurityShowWarningState extends SecurityStates {}


//get user in security data from API
class GetUserSecurityLoadingStates extends SecurityStates {}
class GetUserSecuritySuccessStates extends SecurityStates {}
class GetUserSecurityErrorStates extends SecurityStates {
  final String error;

  GetUserSecurityErrorStates(this.error);
}

//post attendance
class PostAttendanceLoadingStates extends SecurityStates {}
class PostAttendanceSuccessStates extends SecurityStates {}
class PostAttendanceErrorStates extends SecurityStates {}

//put attendance
class PutAttendanceLoadingStates extends SecurityStates {}
class PutAttendanceSuccessStates extends SecurityStates {}
class PutAttendanceErrorStates extends SecurityStates {}





