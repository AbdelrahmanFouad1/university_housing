class GetBuildingsModel{
  List<BuildingModel> Buildings = [];


  GetBuildingsModel.fromJson(Map<String, dynamic> json) {
    json['Buildings'].forEach((element) {
      Buildings.add(BuildingModel.fromJson(element));
    });
  }

}



class BuildingModel{
  late bool buildingLevels;
  late bool gender;
  late int cost;
  late bool availability;
  late int rating;
  late int numReviews;
  late String idDB;
  late String slug;
  late String buildingName;
  late String buildingCode;
  late String image;
  late String address;
  late String buildingsupervisorName;
  late String buildingsupervisorPhonenumber;
  late String createdAt;
  late String updatedAt;
  List<Rooms> rooms = [];
  List<Review> reviews = [];

  BuildingModel.fromJson(Map<String, dynamic> json) {
    buildingLevels = json['buildingLevels'];
    availability = json['availability'];

    gender = json['gender'];
    if(json['cost'] !=null){
      cost = json['cost'];
    }
    if(json['rating'] !=null){
      rating = json['rating'];
    }
    if(json['numReviews'] !=null){
      numReviews = json['numReviews'];
    }
    idDB = json['_id']??'فارغ';
    slug = json['slug']??'فارغ';
    buildingName = json['buildingName']??'فارغ';
    buildingCode = json['buildingCode']??'فارغ';
    image = json['image']??'فارغ';
    address = json['address']??'فارغ';
    buildingsupervisorName = json['buildingsupervisorName']??'فارغ';
    buildingsupervisorPhonenumber = json['buildingsupervisorPhonenumber']??'فارغ';
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

    json['rooms'].forEach((element) {
        rooms.add(Rooms.fromJson(element));
      });
    json['reviews'].forEach((element) {
      reviews.add(Review.fromJson(element));
    });


  }
}

class Rooms {
  late int roomnumber;
  late int floor;
  late bool roomfor;
  late bool availability;
  late String userresidentId;
  late String userresidentName;
  late String idDB;
  late String roomcode;
  late bool type;
  late String slug;
  late String updatedAt;
  late String createdAt;

  Rooms.fromJson(Map<String, dynamic> json) {

    if(json['roomnumber'] !=null){
      roomnumber = json['roomnumber'];
    }else{
      roomnumber = 0;
    }

    if(json['floor'] !=null){
      floor = json['floor'];
    }else{
      floor=0;
    }
    roomfor = json['roomfor'];
    availability = json['availability'];
    userresidentId = json['userresidentId'] ??'فارغ';
    userresidentName = json['userresidentName'] ??'فارغ';
    idDB = json['_id'];
    roomcode = json['roomcode']??'فارغ';
    type = json['type'];
    slug = json['slug'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  }



class Review {
  late String idDB;
  late String username;
  late int rating;
  late String comment;
  late String user;
  late String createdAt;
  late String updatedAt;

  Review.fromJson(Map<String, dynamic> json) {
    idDB = json['_id'];
    username = json['username'];
    if(json['rating'] !=null){
      rating = json['rating'];
    }
    comment = json['comment'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  }