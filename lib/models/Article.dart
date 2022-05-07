class ArticleModel {
  String? id;
  String? topic;
  String? body;
  String? writtenBy;

  ArticleModel({this.id, this.topic, this.body, this.writtenBy});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    topic = json["topic"];
    body = json["body"];
    writtenBy = json["writtenBy"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["_id"] = this.id;
    data["topic"] = this.topic;
    data["body"] = this.body;
    data["writtenBy"] = this.writtenBy;

    return data;
  }
}
