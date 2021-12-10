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
class SecurityDoNotShowWarningState extends SecurityStates {}


//get user in security data from API
class GetUserSecurityLoadingStates extends SecurityStates {}
class GetUserSecuritySuccessStates extends SecurityStates {}
class GetUserSecurityErrorStates extends SecurityStates {
  final String error;

  GetUserSecurityErrorStates(this.error);
}




