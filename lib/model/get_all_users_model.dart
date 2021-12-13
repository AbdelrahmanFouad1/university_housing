class GetAllUsersModel {
  List<Users> users = [];

  GetAllUsersModel.fromJson(Map<String, dynamic> json) {
    json['users'].forEach((element) {
      users.add(Users.fromJson(element));
    });
  }
}

class Users{
  late bool isEmployee;
  late bool isStudent;
  late bool isSecurity;
  late bool isHousingManager;
  late bool isPaid;
  late bool isFine;
  late String paidAt;
  late String address;
  late int NationalID;
  late String cardPhoto;
  late bool gender;
  late bool firstTerm;
  late bool secondTerm;
  late bool thirdTerm;
  late bool buildingType;
  late String buildingName;
  late int roomnumber;
  late int floor;
  late int id;
  late String idDB;
  late String section;
  late String password;
  late String username;
  late String createdAt;
  late String updatedAt;
  late String phone;
  late List<Fines> fines = [];


  Users.fromJson(Map<String, dynamic> json) {
    idDB = json['_id'] ?? 'فارغ';
    createdAt = json['createdAt']?? 'فارغ';
    updatedAt = json['updatedAt']?? 'فارغ';
    isEmployee = json['isEmployee'];
    isStudent = json['isStudent'];
    isSecurity = json['isSecurity'];
    phone = json['phone']?? 'فارغ';
    isHousingManager = json['isHousingManager'];
    isPaid = json['isPaid'];
    isFine = json['isFine']?? false ;
    paidAt = json['paidAt'] ?? 'لم يتم الدفع';
    address = json['address'] ?? 'فارغ';
    section = json['Section'] ?? 'فارغ';
    NationalID = json['NationalID'];
    cardPhoto = json['cardPhoto'] ?? 'فارغ';
    gender = json['gender'];
    firstTerm = json['firstTerm'];
    secondTerm = json['secondTerm'];
    thirdTerm = json['thirdTerm'];
    buildingName = json['buildingName'] ?? 'فارغ';
    buildingType = json['buildingType'];
    roomnumber = json['roomnumber'];
    floor = json['floor'];
    id = json['id'];
    password = json['password'] ?? 'فارغ';
    username = json['username'] ?? 'فارغ';

    json['fines'].forEach((element) {
      fines.add(Fines.fromJson(element));
    });


  }
}

class Fines {
  late num fineValue;
  late String idDB;
  late String fineReason;
  late String createdAt;
  late String updatedAt;

  Fines.fromJson(Map<String, dynamic> json) {
    fineValue = json['fineValue'];
    fineReason = json['fineReason'] ?? 'فارغ';
    createdAt = json['createdAt'] ?? 'فارغ';
    updatedAt = json['updatedAt'] ?? 'فارغ';
    idDB = json['_id'];
  }
}