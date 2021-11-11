class CommentsModel{
   String? enquiryAnswer;
   bool? isReplied;
   String? idDB;
   String? enquiry;
   UserModel? user;

   CommentsModel({
     this.enquiryAnswer,
     this.isReplied,
     this.idDB,
     this.enquiry,
     this.user,
   });

  CommentsModel.fromJson(Map<String, dynamic> json) {
    enquiryAnswer = json['enquiryAnswer'];
    isReplied = json['isReplied'];
    idDB = json['_id'];
    enquiry = json['enquiry'];
    user = (json['user'] != null) ? UserModel.fromJson(json['user']) : null;
  }

   Map<String, dynamic> toJson() {
     final data = <String, dynamic>{};
     data['enquiryAnswer'] = enquiryAnswer;
     data['isReplied'] = isReplied;
     data['_id'] = idDB;
     data['enquiry'] = enquiry;
     if (user != null) {
       data['user'] = user!.toJson();
     }
     return data;
   }

}

class UserModel{
   String? image;
   bool? isStudent;
   String? buildingName;
   bool? buildingType;
   int? roomnumber;
   int? floor;
   String? idDB;
   int? id;
   String? username;
   String? phone;

   UserModel({
     this.image,
     this.isStudent,
     this.buildingName,
     this.buildingType,
     this.roomnumber,
     this.floor,
     this.idDB,
     this.id,
     this.username,
     this.phone,
   });

  UserModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    isStudent = json['isStudent'];
    buildingName = json['buildingName'];
    buildingType = json['buildingType'];
    roomnumber = json['roomnumber'];
    floor = json['floor'];
    idDB = json['_id'];
    id = json['id'];
    username = json['username'];
    phone = json['phone'];
  }

   Map<String, dynamic> toJson() {
     final data = <String, dynamic>{};
     data['image'] = image;
     data['isStudent'] = isStudent;
     data['buildingName'] = buildingName;
     data['buildingType'] = buildingType;
     data['roomnumber'] = roomnumber;
     data['floor'] = floor;
     data['_id'] = idDB;
     data['id'] = id;
     data['username'] = username;
     data['phone'] = phone;
     return data;
   }

}