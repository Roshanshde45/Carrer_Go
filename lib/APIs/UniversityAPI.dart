import 'dart:convert';

import 'package:college_headstart/models/University.dart';
import 'package:http/http.dart' as http;

class UniversityAPI {
  static UniversityAPI? _instance;

  UniversityAPI._() {}

  static UniversityAPI? get instance {
    if (_instance == null) {
      _instance = UniversityAPI._();
    }
    return _instance;
  }

  var bannerURI = Uri.parse('https://careerheadstart.herokuapp.com/users');

  var url = Uri.https('careerheadstart.herokuapp.com', '/users');

  Future<List<UniversityModel>> getAllUniversities() async {
    // final response = await http.get(bannerURI, headers: {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    // });
    var response = await http.get(url);
    // print(response.body);
    final List responseBody = jsonDecode(response.body);
    return responseBody.map((e) => UniversityModel.fromJson(e)).toList();
  }
}
