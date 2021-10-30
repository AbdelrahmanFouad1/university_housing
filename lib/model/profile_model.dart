class ProfileModel{
  late String idDB;
  late int id;
  late String username;
  late bool gender;
  late String image;
  late String address;
  late int NationalID;
  late String cardPhoto;
  late bool isEmployee;
  late bool isStudent;
  late bool isSecurity;
  late bool isHousingManager;
  late bool isStudentAffairs;
  late bool isPaid;
  late String paidAt;
  late String paymentMethod;
  late bool isresident;
  late int numofAttendanceDays;
  late bool isWaiting;
  late String buildingName;
  late bool buildingType;
  late int roomnumber;
  late int floor;
  late bool isFine;
   List<AttendancesModel> attendances = [];
   List<ExitandEntersModel> ExitandEnters = [];
   List<FinesModel> fines = [];

  ProfileModel.fromJson(Map<String, dynamic> json) {
    idDB = json['_id'];
    id = json['id'];
    username = json['username'];
    gender = json['gender'];
    image = json['image'];
    address = json['address'];
    NationalID = json['NationalID'];
    cardPhoto = json['cardPhoto'];
    isEmployee = json['isEmployee'];
    isStudent = json['isStudent'];
    isSecurity = json['isSecurity'];
    isHousingManager = json['isHousingManager'];
    isStudentAffairs = json['isStudentAffairs'];
    isPaid = json['isPaid'];
    paidAt = json['paidAt'];
    paymentMethod = json['paymentMethod'];
    isresident = json['isresident'];
    numofAttendanceDays = json['numofAttendanceDays'];
    isWaiting = json['isWaiting'];
    buildingName = json['buildingName'];
    buildingType = json['buildingType'];
    roomnumber = json['roomnumber'];
    floor = json['floor'];

    if (json['isFine'] != null) {
      isFine = json['isFine'];
    }


      json['attendances'].forEach((element) {
        attendances.add(AttendancesModel.fromJson(element));
      });


      json['ExitandEnters'].forEach((element) {
        ExitandEnters.add(ExitandEntersModel.fromJson(element));
      });

    json['fines'].forEach((element) {
      fines.add(FinesModel.fromJson(element));
    });


  }
}

class ExitandEntersModel {
  late String enterAt;
  late String exitAt;
  late String enterDate;
  late String exitDate;
  late String idDB;
  late String Notes;
  late String createdAt;
  late String updatedAt;

  // ExitandEntersModel(
  //     {required this.enterAt,
  //       required this.exitAt,
  //       required  this.enterDate,
  //       required this.exitDate,
  //       required this.idDB,
  //       required this.Notes,
  //       required this.createdAt,
  //       required this.updatedAt});

  ExitandEntersModel.fromJson(Map<String, dynamic> json) {
    enterAt = json['enterAt'];
    exitAt = json['exitAt'];
    enterDate = json['enterDate'];
    exitDate = json['exitDate'];
    idDB = json['_id'];
    Notes = json['Notes'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['enterAt'] = enterAt;
  //   data['exitAt'] = exitAt;
  //   data['enterDate'] = enterDate;
  //   data['exitDate'] = exitDate;
  //   data['_id'] = idDB;
  //   data['Notes'] = Notes;
  //   data['createdAt'] = createdAt;
  //   data['updatedAt'] = updatedAt;
  //   return data;
  // }

}

class AttendancesModel {
  late String idDB;
  late String attendancedate;
  late String createdAt;
  late String updatedAt;

  AttendancesModel.fromJson(Map<String, dynamic> json) {
    idDB = json['_id'];
    attendancedate = json['attendancedate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class FinesModel {
  late int fineValue;
  late String idDB;
  late String fineReason;
  late String createdAt;
  late String updatedAt;

  FinesModel.fromJson(Map<String, dynamic> json) {
    fineValue = json['fineValue'];
    idDB = json['_id'];
    fineReason = json['fineReason'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}