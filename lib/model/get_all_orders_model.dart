class GetAllOrdersModel{
  List<Missing> missing = [];
  List<Complaints> complaints = [];
  List<Damaged> damaged = [];
  List<Enquiry> enquiry = [];
  List<ChangeRoom> changeRoom = [];
  List<FamilyOrders> familyOrders = [];
  List<GuestOrders>? guestOrders;
  List<LeftOrders> leftOrders = [];
  List<BookingOrders> bookingOrders = [];

  GetAllOrdersModel.fromJson(Map<String, dynamic> json) {
    json['Missingthingsorders'].forEach((element) {
      missing.add(Missing.fromJson(element));
    });

    json['Complaintsorders'].forEach((element) {
      complaints.add(Complaints.fromJson(element));
    });

    json['Damagedthingsorders'].forEach((element) {
      damaged.add(Damaged.fromJson(element));
    });

    json['enquiryorders'].forEach((element) {
      enquiry.add(Enquiry.fromJson(element));
    });

    json['RequestsTochangeRoomorders'].forEach((element) {
      changeRoom.add(ChangeRoom.fromJson(element));
    });

    json['Endorsementorders'].forEach((element) {
      familyOrders.add(FamilyOrders.fromJson(element));
    });

    if( json['Guestorders'] != null){
      guestOrders = List.from(json['Guestorders'])
          .map((e) => GuestOrders.fromJson(e))
          .toList();
    }

    // json['Guestorders'].forEach((element) {
    //   guestOrders.add(GuestOrders.fromJson(element));
    // });

    json['leftRequestsorders'].forEach((element) {
      leftOrders.add(LeftOrders.fromJson(element));
    });

    json['Bookingsorders'].forEach((element) {
      bookingOrders.add(BookingOrders.fromJson(element));
    });
  }

}


class Missing{
  late bool isReplied;
  late String reply;
  late String idDB;
  late String missingthing;
  late String createdAt;
  late String updatedAt;
  late User user;

  Missing.fromJson(Map<String, dynamic> json) {
    isReplied = json['isReplied'];
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    missingthing = json['missingthing']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    user = User.fromJson(json['user']);

  }
}

class Complaints{
  late bool isReplied;
  late String reply;
  late String idDB;
  late String complaint;
  late String createdAt;
  late String updatedAt;
  late User user;

  Complaints.fromJson(Map<String, dynamic> json) {
    isReplied = json['isReplied'];
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    complaint = json['complaint']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    user = User.fromJson(json['user']);

  }
}

class Damaged{
  late bool isReplied;
  late String reply;
  late String idDB;
  late String damagedthing;
  late String createdAt;
  late String updatedAt;
  late User user;

  Damaged.fromJson(Map<String, dynamic> json) {
    isReplied = json['isReplied'];
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    damagedthing = json['damagedthing']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    user = User.fromJson(json['user']);

  }
}

class Enquiry{
  late bool isReplied;
  late String enquiryAnswer;
  late String idDB;
  late String enquiry;
  late String createdAt;
  late String updatedAt;
  late User user;

  Enquiry.fromJson(Map<String, dynamic> json) {
    isReplied = json['isReplied'];
    enquiryAnswer = json['enquiryAnswer']?? 'empty';
    idDB = json['_id']?? 'empty';
    enquiry = json['enquiry']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    user = User.fromJson(json['user']);

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
  late User user;

  ChangeRoom.fromJson(Map<String, dynamic> json) {
    if(json['isReplied'] != null){
      isReplied = json['isReplied'];
    }
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    numofnextroom = json['numofnextroom'];
    floornumberofnextroom = json['floornumberofnextroom'];
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    user = User.fromJson(json['user']);

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
  late User user;

  FamilyOrders.fromJson(Map<String, dynamic> json) {
    isReplied = json['isReplied'];
    reply = json['reply'] ?? 'empty';
    idDB = json['_id']?? 'empty';
    reason = json['reason']?? 'empty';
    reportImg = json['parentIsendorsement']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    user = User.fromJson(json['user']);

  }
}

// todo missing isReplied
// todo missing isStudent
// todo missing num of hosting days
class GuestOrders{
  // late bool isReplied;
  late String reply;
  late String idDB;
  late String HostDate;
  late String NameofGuest;
  late String guestIsIDCard;
  late String relation;
  late int DurationOfHosting;
  late String createdAt;
  late String updatedAt;
  late User user;

  GuestOrders.fromJson(Map<String, dynamic> json) {
    HostDate = json['HostDate']?? 'empty';
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty' ;
    NameofGuest = json['NameofGuest']?? 'empty';

    guestIsIDCard = json['guestIsIDCard'] ?? 'empty';
    relation = json['relation'] ?? 'empty';

    DurationOfHosting = json['DurationOfHosting']?? 0;
    createdAt = json['createdAt'] ?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    user = User.fromJson(json['user']);
  }
}

class LeftOrders{
  late bool isReplied;
  late String reply;
  late String idDB;
  late String reason;
  late String createdAt;
  late String updatedAt;
  late User user;

  LeftOrders.fromJson(Map<String, dynamic> json) {
    if(json['isReplied'] != null){
      isReplied = json['isReplied'];
    }

    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    reason = json['reason']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    user = User.fromJson(json['user']);

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
  late User user;

  BookingOrders.fromJson(Map<String, dynamic> json) {
    if(json['isReplied'] != null){
      isReplied = json['isReplied'];
    }

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
    NationalID = json['NationalID'];
    cardPhoto = json['cardPhoto']?? 'empty';
    buildingName = json['buildingName']?? 'empty';
    roomnumber = json['roomnumber'];
    floor = json['floor'];
    Section = json['Section']?? 'empty';
    phone = json['phone']?? 'empty';
    reply = json['reply']?? 'empty';
    idDB = json['_id']?? 'empty';
    createdAt = json['createdAt']?? 'empty';
    updatedAt = json['updatedAt']?? 'empty';
    user = User.fromJson(json['user']);
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


