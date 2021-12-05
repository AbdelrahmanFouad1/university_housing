class GetNumRoomsModel{

  late int numStudent;
  late int numEmployee;
  late int available;
  late int notAvailable;

  GetNumRoomsModel.fromJson(Map<String, dynamic> json) {
    numStudent = json['numberofroomsForStudents'];
    numEmployee = json['numberofroomsForEmployee'];
    available = json['numberofroomsisavailable'];
    notAvailable = json['numberofroomsisNotavailable'];
  }

}

