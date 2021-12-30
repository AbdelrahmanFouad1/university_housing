class MyOrdersModel{
  List<EnquiryordersModel> enquiryorders = [];
  List<ComplaintsordersModel> Complaintsorders = [];
  List<DamagedthingsordersModel> Damagedthingsorders = [];
  List<MissingthingsordersModel> Missingthingsorders = [];
  List<RequestsTochangeRoomordersModel> RequestsTochangeRoomorders = [];
  List<EndorsementordersModel> Endorsementorders = [];
  List<GuestordersModel> Guestorders = [];
  List<LeftRequestsordersModel> leftRequestsorders = [];
  List<BookingsordersModel> Bookingsorders = [];


  MyOrdersModel.fromJson(Map<String, dynamic> json) {
    json['enquiryorders'].forEach((element) {
      enquiryorders.add(EnquiryordersModel.fromJson(element));
    });

    json['Complaintsorders'].forEach((element) {
      Complaintsorders.add(ComplaintsordersModel.fromJson(element));
    });

    json['Damagedthingsorders'].forEach((element) {
      Damagedthingsorders.add(DamagedthingsordersModel.fromJson(element));
    });

    json['Missingthingsorders'].forEach((element) {
      Missingthingsorders.add(MissingthingsordersModel.fromJson(element));
    });

    json['RequestsTochangeRoomorders'].forEach((element) {
      RequestsTochangeRoomorders.add(RequestsTochangeRoomordersModel.fromJson(element));
    });

    json['Endorsementorders'].forEach((element) {
      Endorsementorders.add(EndorsementordersModel.fromJson(element));
    });

    json['Guestorders'].forEach((element) {
      Guestorders.add(GuestordersModel.fromJson(element));
    });

    json['leftRequestsorders'].forEach((element) {
      leftRequestsorders.add(LeftRequestsordersModel.fromJson(element));
    });

    json['Bookingsorders'].forEach((element) {
      Bookingsorders.add(BookingsordersModel.fromJson(element));
    });

  }
}

class EnquiryordersModel{
  late String enquiryAnswer;
  late bool isReplied;
  late String idDB;
  late String enquiry;

  EnquiryordersModel.fromJson(Map<String, dynamic> json) {
    enquiryAnswer = json['enquiryAnswer']??'empty';
    isReplied = json['isReplied'];
    idDB = json['_id'];
    enquiry = json['enquiry']??'empty';
  }
}

class ComplaintsordersModel{
  late String reply;
  late bool isReplied;
  late String idDB;
  late String complaint;
  late bool isAccepted;

  ComplaintsordersModel.fromJson(Map<String, dynamic> json) {
    reply = json['reply']??'empty';
    isReplied = json['isReplied']??false;
    isAccepted = json['isAccepted']??false;
    idDB = json['_id'];
    complaint = json['complaint']??'empty';
  }
}

class DamagedthingsordersModel{
  late String reply;
  late bool isReplied;
  late bool isAccepted;
  late String idDB;
  late String damagedthing;

  DamagedthingsordersModel.fromJson(Map<String, dynamic> json) {
    reply = json['reply']??'empty';
    isReplied = json['isReplied']??false;
    isAccepted = json['isAccepted']??false;
    idDB = json['_id'];
    damagedthing = json['damagedthing']??'empty';
  }
}

class MissingthingsordersModel{
  late String reply;
  late bool isReplied;
  late bool isAccepted;
  late String idDB;
  late String missingthing;

  MissingthingsordersModel.fromJson(Map<String, dynamic> json) {
    reply = json['reply']??'empty';
    isReplied = json['isReplied']??false;
    isAccepted = json['isAccepted']??false;
    idDB = json['_id'];
    missingthing = json['missingthing']??'empty';
  }
}

class RequestsTochangeRoomordersModel{
  late int numofnextroom;
  late int floornumberofnextroom;
  late bool isReplied;
  late bool isAccepted;
  late String reply;
  late String idDB;

  RequestsTochangeRoomordersModel.fromJson(Map<String, dynamic> json) {
    numofnextroom = json['numofnextroom'];
    floornumberofnextroom = json['floornumberofnextroom'];
    isReplied = json['isreply']??false;
    isAccepted = json['isAccepted']??false;
    reply = json['reply']??'empty';
    idDB = json['_id'];
  }
}

class EndorsementordersModel{
  late String reply;
  late bool isReplied;
  late bool isAccepted;
  late String idDB;
  late String reason;
  late String parentIsendorsement;

  EndorsementordersModel.fromJson(Map<String, dynamic> json) {
    reply = json['reply']??'empty';
    isReplied = json['isReplied']??false;
    isAccepted = json['isAccepted']??false;
    idDB = json['_id'];
    reason = json['reason']??'empty';
    parentIsendorsement = json['parentIsendorsement']??'empty';
  }
}

class GuestordersModel{
  late String HostDate;
  late int DurationOfHosting;
  late String reply;
  late String idDB;
  late String NameofGuest;
  late bool isAccepted;
  //todo test
  late bool isReplied;
   String? studentId;
   String? guestIsIDCard;
   String? relation;

  GuestordersModel.fromJson(Map<String, dynamic> json) {
    HostDate = json['HostDate']??'empty';
    isReplied = json['isReplied']?? false;
    DurationOfHosting = json['DurationOfHosting'];
    isAccepted = json['isAccepted']??false;
    reply = json['reply']??'empty';
    idDB = json['_id'];
    NameofGuest = json['NameofGuest']??'empty';

    if (json['studentId'] != null) {
      studentId = json['studentId'];
    }

    if (json['guestIsIDCard'] != null) {
      guestIsIDCard = json['guestIsIDCard'];
    }

    if (json['relation'] != null) {
      relation = json['relation'];
    }

  }
}

class LeftRequestsordersModel{
  late bool isReplied;
  late String reply;
  late String idDB;
  late String reason;
  late bool isAccepted;

  LeftRequestsordersModel.fromJson(Map<String, dynamic> json) {
    isReplied = json['isreply']??false;
    isAccepted = json['isAccepted']??false;
    reply = json['reply'];
    idDB = json['_id'];
    reason = json['reason'];
  }
}

//todo add isreply + reply
class BookingsordersModel{
  late bool isReplied;
  late String reply;
  late String idDB;
  late bool firstTerm;
  late bool secondTerm;
  late bool thirdTerm;
  late String buildingName;
  late bool buildingType;
  late int roomnumber;
  late bool isAccepted;

  BookingsordersModel.fromJson(Map<String, dynamic> json) {
    isReplied = json['isreply'] ?? false;
    reply = json['reply'] ?? 'empty';
    idDB = json['_id'];
    firstTerm = json['firstTerm'];
    secondTerm = json['secondTerm'];
    thirdTerm = json['thirdTerm'];
    buildingName = json['buildingName']??'empty';
    buildingType = json['buildingType']??'empty';
    roomnumber = json['roomnumber'];
    isAccepted = json['isAccepted']??false;
  }
}