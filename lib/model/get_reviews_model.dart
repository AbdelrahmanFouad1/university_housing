class Reviews{
  late String comment;
  late String idDB;
  late String createdAt;
  late String updatedAt;
  late int rating;
  late User user;

  Reviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    idDB = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    comment = json['comment'];
    user = User.fromJson(json['user']);
  }
}

class User {
  late String image;
  late bool isEmployee;
  late bool isStudent;
  late String buildingName;
  late String idDB;
  late String username;
  late int id;
  late int floor;
  late int roomnumber;

  User.fromJson(Map<String, dynamic> json) {
    roomnumber = json['roomnumber'];
    floor = json['floor'];
    idDB = json['_id'];
    image = json['image'];
    isEmployee = json['isEmployee'];
    isStudent = json['isStudent'];
    buildingName = json['buildingName'];
    username = json['username'];
    id = json['id'];
  }

  }
