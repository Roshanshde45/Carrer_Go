import 'dart:convert';

import 'package:college_headstart/models/College.dart';
import 'package:http/http.dart' as http;

class CollegesAPI {
  static CollegesAPI? _instance;

  CollegesAPI._() {}

  static CollegesAPI? get instance {
    if (_instance == null) {
      _instance = CollegesAPI._();
    }
    return _instance;
  }

  var url = Uri.https('careerheadstart.herokuapp.com', '/colleges');

  Future<List<CollegeModel>> getAllUColleges() async {
    // final response = await http.get(bannerURI, headers: {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    // });
    var response = await http.get(url);
    // print(response.body);
    final List responseBody = jsonDecode(response.body);
    return responseBody.map((e) => CollegeModel.fromJson(e)).toList();
  }
}
