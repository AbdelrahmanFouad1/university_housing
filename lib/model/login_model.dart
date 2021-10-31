class LoginModel {

   late String? idDB;
   late int id;
   late bool isEmployee;
   late bool isStudent;
   late bool isSecurity;
   late bool isHousingManager;
   late bool isStudentAffairs;
   late bool isresident;
   late String token;

  //Named constructor
  LoginModel.fromJson(Map<String, dynamic> json) {
    idDB = json['_id'];
    id = json['id'];
    isEmployee = json['isEmployee'];
    isStudent = json['isStudent'];
    isSecurity = json['isSecurity'];
    isHousingManager = json['isHousingManager'];
    isStudentAffairs = json['isStudentAffairs'];
    isresident = json['isresident'];
    token = json['token'];
  }
}
