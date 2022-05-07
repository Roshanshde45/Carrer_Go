class ExamModel {
  String? id;
  String? conductedBy;
  String? examDate;
  String? examName;
  String? officialWebsite;
  String? examType;
  String? examLevel;
  String? eligibility;
  String? modeOfExam;
  String? img;

  ExamModel(
      {this.id,
      this.conductedBy,
      this.examDate,
      this.examName,
      this.officialWebsite,
      this.examType,
      this.examLevel,
      this.eligibility,
      this.modeOfExam,
      this.img});

  ExamModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    conductedBy = json["ConductedBy"];
    examDate = json["ExamDate"];
    examName = json["ExamName"];
    officialWebsite = json["OfficialWebsite"];
    examType = json["ExamType"];
    examLevel = json["ExamLevel"];
    eligibility = json["Eligibility"];
    modeOfExam = json["ModeOfExam"];
    img = json["Image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["_id"] = this.id;
    data["ConductedBy"] = this.conductedBy;
    data["ExamDate"] = this.examDate;
    data["ExamName"] = this.examName;
    data["OfficialWebsite"] = this.officialWebsite;
    data["ExamType"] = this.examType;
    data["ExamLevel"] = this.examLevel;
    data["Eligibility"] = this.eligibility;
    data["ModeOfExam"] = this.modeOfExam;
    data["Image"] = this.img;
    return data;
  }
}
