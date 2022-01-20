class ProfileModel{
  late int id;
  late bool gender;
  late int NationalID;
  late bool isEmployee;
  late bool isStudent;
  late bool isSecurity;
  late bool isHousingManager;
  late bool isStudentAffairs;
  late bool isPaid;
  late dynamic paidAt;
  late bool isresident;
  late int numofAttendanceDays;
  late bool isWaiting;
  late bool buildingType;
  late int roomnumber;
  late int floor;
  late bool isFine;
  late String paymentMethod;
  late String username;
  late String image;
  late String address;
  late String cardPhoto;
  late String idDB;
  late String buildingName;
   List<AttendancesModel> attendances = [];
   List<ExitAndEntersModel> ExitandEnters = [];
   List<FinesModel> fines = [];

  ProfileModel.fromJson(Map<String, dynamic> json) {
    idDB = json['_id']?? 'empty';
    id = json['id'];
    username = json['username']?? 'empty';
    gender = json['gender'];
    image = json['image']?? 'empty';
    address = json['address']?? 'empty';
    NationalID = json['NationalID'];
    cardPhoto = json['cardPhoto']?? 'empty';
    isEmployee = json['isEmployee'];
    isStudent = json['isStudent'];
    isSecurity = json['isSecurity'];
    isHousingManager = json['isHousingManager'];
    isStudentAffairs = json['isStudentAffairs'];
    isPaid = json['isPaid'];
    paymentMethod = json['paymentMethod'] ?? 'empty';
    isresident = json['isresident'];
    numofAttendanceDays = json['numofAttendanceDays'];
    isWaiting = json['isWaiting'];
    buildingName = json['buildingName']?? 'empty';
    buildingType = json['buildingType'];
    roomnumber = json['roomnumber'];
    floor = json['floor'];
    isFine = json['isFine'] ?? 'empty';

    if(json['paidAt'] != null){
      paidAt = json['paidAt'];
    }

      json['attendances'].forEach((element) {
        attendances.add(AttendancesModel.fromJson(element));
      });


      json['ExitandEnters'].forEach((element) {
        ExitandEnters.add(ExitAndEntersModel.fromJson(element));
      });

    json['fines'].forEach((element) {
      fines.add(FinesModel.fromJson(element));
    });


  }
}

class ExitAndEntersModel {
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

  ExitAndEntersModel.fromJson(Map<String, dynamic> json) {
    enterAt = json['enterAt']??'';
    exitAt = json['exitAt']??'';
    enterDate = json['enterDate']??'';
    exitDate = json['exitDate']??'';
    idDB = json['_id']??'';
    Notes = json['Notes']??'';
    createdAt = json['createdAt']??'';
    updatedAt = json['updatedAt']??'';
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
    idDB = json['_id']??'';
    attendancedate = json['attendancedate']??'';
    createdAt = json['createdAt']??'';
    updatedAt = json['updatedAt']??'';
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
    idDB = json['_id']??'';
    fineReason = json['fineReason']??'';
    createdAt = json['createdAt']??'';
    updatedAt = json['updatedAt']??'';
  }
}