class GetAllOrdersModel{
  late List<Missing> missing ;
  late List<Complaints> complaints;
  late List<Damaged> damaged ;
  late List<Enquiry> enquiry;
  late List<ChangeRoom> changeRoom;
  late List<FamilyOrders> familyOrders;
  late List<GuestOrders>? guestOrders;
  late List<LeftOrders> leftOrders;
  late List<BookingOrders> bookingOrders;

  GetAllOrdersModel.fromJson(Map<String, dynamic> json) {

    if( json['Missingthingsorders'] != null){
      missing = List.from(json['Missingthingsorders'])
          .map((e) => Missing.fromJson(e))
          .toList();
    }

    if( json['Complaintsorders'] != null){
      complaints = List.from(json['Complaintsorders'])
          .map((e) => Complaints.fromJson(e))
          .toList();
    }

    if( json['Damagedthingsorders'] != null){
      damaged = List.from(json['Damagedthingsorders'])
          .map((e) => Damaged.fromJson(e))
          .toList();
    }

    if( json['enquiryorders'] != null){
      enquiry = List.from(json['enquiryorders'])
          .map((e) => Enquiry.fromJson(e))
          .toList();
    }


    if( json['RequestsTochangeRoomorders'] != null){
      changeRoom = List.from(json['RequestsTochangeRoomorders'])
          .map((e) => ChangeRoom.fromJson(e))
          .toList();
    }

    if( json['Endorsementorders'] != null){
      familyOrders = List.from(json['Endorsementorders'])
          .map((e) => FamilyOrders.fromJson(e))
          .toList();
    }




    if( json['Guestorders'] != null){
      guestOrders = List.from(json['Guestorders'])
          .map((e) => GuestOrders.fromJson(e))
          .toList();
    }

    if( json['leftRequestsorders'] != null){
      leftOrders = List.from(json['leftRequestsorders'])
          .map((e) => LeftOrders.fromJson(e))
          .toList();
    }



    if( json['Bookingsorders'] != null){
      bookingOrders = List.from(json['Bookingsorders'])
          .map((e) => BookingOrders.fromJson(e))
          .toList();
    }

  }

}


class Missing{
  late bool isReplied;
  late String reply;
  late String idDB;
  late String missingthing;
  late String createdAt;
  late String updatedAt;
  User? user;

  Missing.fromJson(Map<String, dynamic> json) {
    isReplied = json['isReplied'] ?? false;
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    missingthing = json['missingthing']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';

    if(json['user'] !=null){
      user = User.fromJson(json['user']);
    }

  }
}

class Complaints{
  late bool isReplied;
  late String reply;
  late String idDB;
  late String complaint;
  late String createdAt;
  late String updatedAt;
  User? user;

  Complaints.fromJson(Map<String, dynamic> json) {
    isReplied = json['isReplied'] ?? false;
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    complaint = json['complaint']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    if(json['user'] !=null){
      user = User.fromJson(json['user']);
    }

  }
}

class Damaged{
  late bool isReplied;
  late String reply;
  late String idDB;
  late String damagedthing;
  late String createdAt;
  late String updatedAt;
  User? user;

  Damaged.fromJson(Map<String, dynamic> json) {
    isReplied = json['isReplied'] ?? false;
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    damagedthing = json['damagedthing']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    if(json['user'] !=null){
      user = User.fromJson(json['user']);
    }

  }
}

class Enquiry{
  late bool isReplied;
  late String enquiryAnswer;
  late String idDB;
  late String enquiry;
  late String createdAt;
  late String updatedAt;
  User? user;

  Enquiry.fromJson(Map<String, dynamic> json) {
    isReplied = json['isReplied'] ?? false;
    enquiryAnswer = json['enquiryAnswer']?? 'empty';
    idDB = json['_id']?? 'empty';
    enquiry = json['enquiry']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    if(json['user'] !=null){
      user = User.fromJson(json['user']);
    }

  }
}

class ChangeRoom{
  late bool isReplied;
  late String reply;
  late String idDB;
  late num numofnextroom;
  late int floornumberofnextroom;
  late String createdAt;
  late String updatedAt;
  User? user;

  ChangeRoom.fromJson(Map<String, dynamic> json) {
    isReplied = json['isReplied'] ?? false;
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    numofnextroom = json['numofnextroom'] ?? 0;
    floornumberofnextroom = json['floornumberofnextroom'] ?? 0;
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    if(json['user'] !=null){
      user = User.fromJson(json['user']);
    }

  }
}

class FamilyOrders{
  late bool isReplied;
  late String reply;
  late String idDB;
  late String reason;
  late String reportImg;
  late String createdAt;
  late String updatedAt;
  User? user;

  FamilyOrders.fromJson(Map<String, dynamic> json) {
      isReplied = json['isReplied'] ?? false;
    reply = json['reply'] ?? 'empty';
    idDB = json['_id']?? 'empty';
    reason = json['reason']?? 'empty';
    reportImg = json['parentIsendorsement']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
      if(json['user'] !=null){
        user = User.fromJson(json['user']);
      }

  }
}

// todo missing isReplied
// todo missing isStudent
// todo missing num of hosting days
class GuestOrders{
  late bool isReplied;
  late String reply;
  late String idDB;
  late String HostDate;
  late String NameofGuest;
  late String guestIsIDCard;
  late String relation;
  late int DurationOfHosting;
  late String createdAt;
  late String updatedAt;
  User? user;

  GuestOrders.fromJson(Map<String, dynamic> json) {
    isReplied = json['isReplied'] ?? false;
    HostDate = json['HostDate']?? 'empty';
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty' ;
    NameofGuest = json['NameofGuest']?? 'empty';
    guestIsIDCard = json['guestIsIDCard'] ?? 'empty';
    relation = json['relation'] ?? 'empty';
    DurationOfHosting = json['DurationOfHosting']?? 0;
    createdAt = json['createdAt'] ?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    if(json['user'] !=null){
      user = User.fromJson(json['user']);
    }
  }
}

class LeftOrders{
  late bool isReplied;
  late String reply;
  late String idDB;
  late String reason;
  late String createdAt;
  late String updatedAt;
  User? user;

  LeftOrders.fromJson(Map<String, dynamic> json) {
      isReplied = json['isReplied'] ?? false;
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    reason = json['reason']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
      if(json['user'] !=null){
        user = User.fromJson(json['user']);
      }

  }
}

class BookingOrders{
  late bool firstTerm;
  late bool secondTerm;
  late bool thirdTerm;
  late String address;
  late int NationalID;
  late String cardPhoto;
  late bool gender;
  late String buildingName;
  late bool buildingType;
  late int roomnumber;
  late int floor;
  late String Section;
  late bool isWaiting;
  late bool isAccepted;
  late bool isReplied;
  late String reply;
  late String idDB;
  late String phone;
  late String createdAt;
  late String updatedAt;
  User? user;

  BookingOrders.fromJson(Map<String, dynamic> json) {
      isReplied = json['isReplied'] ?? false;

    if(json['secondTerm']!= null){
      secondTerm = json['secondTerm'];
    }

    if(json['thirdTerm']!= null){
      thirdTerm = json['thirdTerm'];
    }

    if(json['gender']!= null){
      gender = json['gender'];
    }

    if(json['isWaiting']!= null){
      isWaiting = json['isWaiting'];
    }

    if(json['isAccepted']!= null){
      isAccepted = json['isAccepted'];
    }

    if(json['buildingType']!= null){
      buildingType = json['buildingType'];
    }

    if(json['firstTerm']!= null){
      firstTerm = json['firstTerm'];
    }

    address = json['address']?? 'empty';
    NationalID = json['NationalID'] ?? 0;
    cardPhoto = json['cardPhoto']?? 'empty';
    buildingName = json['buildingName']?? 'empty';
    roomnumber = json['roomnumber'] ?? 0;
    floor = json['floor'] ?? 0;
    Section = json['Section']?? 'empty';
    phone = json['phone']?? 'empty';
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
      if(json['user'] !=null){
        user = User.fromJson(json['user']);
      }
  }
}


class User {
  late bool isEmployee;
  late bool isStudent;
  late String buildingName;
  late String idDB;
  late String username;
  late int roomnumber;
  late int floor;
  late int id;
  late String phone;

  User.fromJson(Map<String, dynamic> json) {
    isEmployee = json['isEmployee'];
    isStudent = json['isStudent'];
    buildingName = json['buildingName']?? 'empty';
    username = json['username']?? 'empty';
    roomnumber = json['roomnumber'];
    floor = json['floor'];
    idDB = json['_id']?? 'empty';
    id = json['id'];
    phone = json['phone']?? 'empty';
  }

  }


