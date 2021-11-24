class GetNotificationsModel{
  List<NotificationsModel> notificationsList = [];

  GetNotificationsModel.fromJson(Map<String, dynamic> json) {
    json['notifications'].forEach((element) {
      notificationsList.add(NotificationsModel.fromJson(element));
    });
  }

}



class NotificationsModel{
  late String title;
  late String image;
  late String idDB;
  late String body;
  late String user;
  late String createdAt;
  late String updatedAt;


  NotificationsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    body = json['body'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    idDB = json['_id'];

  }
}
