
// for Dashboard

class BuildingsModel {
  String? code;
  String? name;
  String? address;
  String? studentNum;
  String? employeeNum;
  String? managerName;
  String? managerPhone;
  bool? statues;
  bool? level;


  BuildingsModel({
      this.code,
      this.name,
      this.address,
      this.studentNum,
      this.employeeNum,
      this.managerName,
      this.managerPhone,
      this.statues,
      this.level});

  BuildingsModel.fromJson(Map<String, dynamic> json)
  {
    code = json['code'];
    name = json['name'];
    address = json['address'];
    studentNum = json['studentNum'];
    employeeNum = json['employeeNum'];
    managerName = json['managerName'];
    managerPhone = json['managerPhone'];
    statues = json['statues'];
    level = json['level'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'code':code,
      'name':name,
      'address':address,
      'studentNum':studentNum,
      'employeeNum':employeeNum,
      'managerName':managerName,
      'managerPhone':managerPhone,
      'statues':statues,
      'level':level,
    };
  }
}