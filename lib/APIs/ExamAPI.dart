import 'dart:convert';

import 'package:college_headstart/models/Banner.dart';
import 'package:college_headstart/models/Exam.dart';
import 'package:http/http.dart' as http;

class ExamAPI {
  static ExamAPI? _instance;

  ExamAPI._() {}

  static ExamAPI? get instance {
    if (_instance == null) {
      _instance = ExamAPI._();
    }
    return _instance;
  }

  var url = Uri.https('careerheadstart.herokuapp.com', '/exams');

  Future<List<ExamModel>> getExam() async {
    // final response = await http.get(bannerURI, headers: {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    // });
    var response = await http.get(url);
    // print(response.body);
    final List responseBody = jsonDecode(response.body);
    return responseBody.map((e) => ExamModel.fromJson(e)).toList();
  }
}
