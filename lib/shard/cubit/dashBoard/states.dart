abstract class DashBoardStates {}

class DashBoardInitialState extends DashBoardStates {}

// add building
class ChangeBuildingLevel extends DashBoardStates {}
class ChangeBuildingStatues extends DashBoardStates {}

// add room
class ChangeRoomType extends DashBoardStates {}
class ChangeRoomFor extends DashBoardStates {}
class ChangeRoomStatues extends DashBoardStates {}

// Available now
class ShowBuildingDetails extends DashBoardStates {}
class ChangeBuildingEditIcon extends DashBoardStates {}
class SelectBuildingState extends DashBoardStates {}
class SelectBuildingLevel extends DashBoardStates {}
class DeleteBuildingSuccess extends DashBoardStates {}



// Add news
class NewsImagePickedSuccessState extends DashBoardStates {}
class NewsImagePickedErrorState extends DashBoardStates {}
class ImageRemoveSuccessState extends DashBoardStates {}


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




