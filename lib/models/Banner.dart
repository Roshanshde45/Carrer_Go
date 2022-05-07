import 'dart:convert';

class BannerModel {
  String? id;
  String? title;
  String? description;
  String? image;
  String? imgText;
  String? linkText;

  BannerModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.imgText,
    this.linkText,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    imgText = json['imgText'];
    linkText = json['linkText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['imgText'] = this.imgText;
    data['linkText'] = this.linkText;
    return data;
  }
}

  // Map<String, dynamic> toMap() {
  //   return {
  //     '_id': id,
  //     'title': title,
  //     'description': description,
  //     'image': image,
  //     'imgText': imgText,
  //     'linkText': linkText,
  //   };
  // }

  // factory BannerModel.fromMap(Map<String, dynamic> map) {
  //   return BannerModel(
  //     id: map['_id'],
  //     title: map['title'],
  //     description: map['description'],
  //     image: map['image'],
  //     imgText: map['imgText'],
  //     linkText: map['linkText'],
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory BannerModel.fromJson(String source) =>
  //     BannerModel.fromMap(json.decode(source));
// }
