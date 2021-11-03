class NewsModel{
  int? nbHits;
  List<News> news = [];

  NewsModel.fromJson(Map<String, dynamic> json) {

    nbHits = json['nbHits'];
    json['news'].forEach((element) {
      news.add(News.fromJson(element));
    });
  }

}

class News{
  String? idDB;
  String? title;
  String? text;
  String? image;
  String? createdAt;
  String? updatedAt;

  News.fromJson(Map<String, dynamic> json) {
    idDB = json['_id'];
    title = json['title'];
    text = json['text'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}