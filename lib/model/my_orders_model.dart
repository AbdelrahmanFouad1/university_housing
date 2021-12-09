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
    enquiryAnswer = json['enquiryAnswer'];
    isReplied = json['isReplied'];
    idDB = json['_id'];
    enquiry = json['enquiry'];
  }
}

class ComplaintsordersModel{
  late String reply;
  late bool isReplied;
  late String idDB;
  late String complaint;

  ComplaintsordersModel.fromJson(Map<String, dynamic> json) {
    reply = json['reply'];
    isReplied = json['isReplied'];
    idDB = json['_id'];
    complaint = json['complaint'];
  }
}

class DamagedthingsordersModel{
  late String reply;
  late bool isReplied;
  late String idDB;
  late String damagedthing;

  DamagedthingsordersModel.fromJson(Map<String, dynamic> json) {
    reply = json['reply'];
    isReplied = json['isReplied'];
    idDB = json['_id'];
    damagedthing = json['damagedthing'];
  }
}

class MissingthingsordersModel{
  late String reply;
  late bool isReplied;
  late String idDB;
  late String missingthing;

  MissingthingsordersModel.fromJson(Map<String, dynamic> json) {
    reply = json['reply'];
    isReplied = json['isReplied'];
    idDB = json['_id'];
    missingthing = json['missingthing'];
  }
}

class RequestsTochangeRoomordersModel{
  late int numofnextroom;
  late int floornumberofnextroom;
  late bool isreply;
  late String reply;
  late String idDB;

  RequestsTochangeRoomordersModel.fromJson(Map<String, dynamic> json) {
    numofnextroom = json['numofnextroom'];
    floornumberofnextroom = json['floornumberofnextroom'];
    isreply = json['isreply'];
    reply = json['reply'];
    idDB = json['_id'];
  }
}

class EndorsementordersModel{
  late String reply;
  late bool isReplied;
  late String idDB;
  late String reason;
  late String parentIsendorsement;

  EndorsementordersModel.fromJson(Map<String, dynamic> json) {
    reply = json['reply'];
    isReplied = json['isReplied'];
    idDB = json['_id'];
    reason = json['reason'];
    parentIsendorsement = json['parentIsendorsement'];
  }
}

class GuestordersModel{
  late String HostDate;
  late int DurationOfHosting;
  late String reply;
  late String idDB;
  late String NameofGuest;
   String? studentId;
   String? guestIsIDCard;
   String? relation;

  GuestordersModel.fromJson(Map<String, dynamic> json) {
    HostDate = json['HostDate'];
    DurationOfHosting = json['DurationOfHosting'];
    reply = json['reply'];
    idDB = json['_id'];
    NameofGuest = json['NameofGuest'];

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
  late bool isreply;
  late String reply;
  late String idDB;
  late String reason;

  LeftRequestsordersModel.fromJson(Map<String, dynamic> json) {
    isreply = json['isreply'];
    reply = json['reply'];
    idDB = json['_id'];
    reason = json['reason'];
  }
}

class BookingsordersModel{
  late bool isreply;

  BookingsordersModel.fromJson(Map<String, dynamic> json) {
    isreply = json['isreply'];
  }
}