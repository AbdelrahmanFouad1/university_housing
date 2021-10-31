class StudentsModel {
  String? id;
  String? name;
  String? address;
  String? section;
  String? phone;
  String? nationalID;
  String? nationalPhoto;
  String? room;
  String? buildingName;
  String? paymentDate;
  bool? level;
  bool? gender;
  bool? credit;
  bool? job;


  StudentsModel({
      this.id,
      this.name,
      this.address,
      this.section,
      this.phone,
      this.nationalID,
      this.nationalPhoto,
      this.level,
      this.gender,
      this.room,
      this.credit,
      this.paymentDate,
      this.job,
      this.buildingName,
  });

  StudentsModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    section = json['section'];
    phone = json['phone'];
    nationalID = json['nationalID'];
    nationalPhoto = json['nationalPhoto'];
    level = json['level'];
    gender = json['gender'];
    room = json['room'];
    credit = json['credit'];
    paymentDate = json['paymentDate'];
    job = json['job'];
    buildingName = json['buildingName'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'id':id,
      'name':name,
      'address':address,
      'section':section,
      'phone':phone,
      'nationalID':nationalID,
      'nationalPhoto':nationalPhoto,
      'level':level,
      'gender':gender,
      'room':room,
      'credit':credit,
      'paymentDate':paymentDate,
      'job':job,
      'buildingName':buildingName,
    };
  }
}