class CollegeModel {
  String? id;
  String? collegeName;
  String? state;
  String? rating;
  String? collegeUrl;
  String? overview;
  String? collegeType;
  String? img;

  CollegeModel({
    this.id,
    this.collegeName,
    this.state,
    this.rating,
    this.collegeUrl,
    this.overview,
    this.collegeType,
    this.img,
  });

  CollegeModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    collegeName = json["CollegeName"];
    state = json["State"];
    rating = json["Rating"];
    collegeUrl = json["CollegeWebsite"];
    overview = json["Overview"];
    collegeType = json["CollegeType"];
    img = json["CollegeImg"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["_id"] = this.id!;
    data["CollegeName"] = this.collegeName!;
    data["State"] = this.state!;
    data["Rating"] = this.rating!;
    data["CollegeWebsite"] = this.collegeUrl!;
    data["Overview"] = this.overview!;
    data["CollegeType"] = this.collegeType!;
    data["CollegeImg"] = this.img!;
    return data;
  }
}
