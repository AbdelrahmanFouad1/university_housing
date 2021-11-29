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







