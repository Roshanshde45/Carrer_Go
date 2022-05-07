class ReviewModel {
  int? stars;
  String? id;
  String? name;
  String? profession;
  String? review;

  ReviewModel({
    this.stars,
    this.id,
    this.name,
    this.profession,
    this.review,
  });

  ReviewModel.fromJson(Map<String, dynamic> json) {
    stars = json["stars"];
    id = json["_id"];
    name = json["name"];
    profession = json["profession"];
    review = json["review"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["_id"] = this.id;
    data["stars"] = this.stars;
    data["name"] = this.name;
    data["profession"] = this.profession;
    data["review"] = this.review;
    return data;
  }
}
