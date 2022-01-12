class GetAllVouchersModel {
  late String idDB;
  late String sector;
  late String voucherImage;
  late String createdAt;
  late String updatedAt;
  late VoucherUsers users ;

  GetAllVouchersModel.fromJson(Map<String, dynamic> json) {
    idDB = json['_id'] ?? 'فارغ';
    sector = json['sector'] ?? 'فارغ';
    voucherImage = json['voucherImage'] ?? 'فارغ';
    createdAt = json['createdAt'] ?? 'فارغ';
    updatedAt = json['updatedAt'] ?? 'فارغ';
    users = VoucherUsers.fromJson(json['user']);
  }
}

class VoucherUsers{
  late bool isEmployee;
  late bool isStudent;
  late int id;
  late String idDB;
  late String username;

  VoucherUsers.fromJson(Map<String, dynamic> json) {
    idDB = json['_id'] ?? 'فارغ';
    isEmployee = json['isEmployee']?? false;
    isStudent = json['isStudent']?? false;
    id = json['id']??0;
    username = json['username'] ?? 'فارغ';
  }
}

