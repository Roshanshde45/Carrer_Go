import 'dart:convert';

class UniversityModel {
  String? id;
  String? username;
  String? applicationNumber;
  String? applicationtype;
  String? instName;
  String? instAddress1;
  String? instAddress2;
  String? city;
  String? district;
  String? pincode;
  String? state;
  String? region;
  String? instType;
  String? program;
  String? course;
  String? level;
  String? specialization;
  String? intake;

  UniversityModel({
    this.id,
    this.username,
    this.applicationNumber,
    this.applicationtype,
    this.instName,
    this.instAddress1,
    this.instAddress2,
    this.city,
    this.district,
    this.pincode,
    this.state,
    this.region,
    this.instType,
    this.program,
    this.course,
    this.level,
    this.specialization,
    this.intake,
  });

  UniversityModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    username = json["username"];
    applicationNumber = json["Application Number"];
    applicationtype = json["Application Type"];
    instName = json["Institute Name"];
    instAddress1 = json["Inst Address"];
    instAddress2 = json["Inst Address 2"];
    city = json["CITY"];
    district = json["District"];
    pincode = json["Pincode"];
    state = json["State"];
    region = json["Region"];
    instType = json["Inst Type"];
    program = json["Program"];
    course = json["Course"];
    level = json["Level"];
    specialization = json["Specialization"];
    intake = json["Intake"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["_id"] = this.id;
    data["username"] = this.username;
    data["Application Number"] = this.applicationNumber;
    data["Application Type"] = this.applicationtype;
    data["Institute Name"] = this.instName;
    data["Inst Address"] = this.instAddress1;
    data["Inst Address 2"] = this.instAddress2;
    data["CITY"] = this.city;
    data["District"] = this.district;
    data["Pincode"] = this.pincode;
    data["State"] = this.state;
    data["Region"] = this.region;
    data["Inst Type"] = this.instType;
    data["Program"] = this.program;
    data["Course"] = this.course;
    data["Level"] = this.level;
    data["Specialization"] = this.specialization;
    data["Intake"] = this.intake;
    return data;
  }
}
