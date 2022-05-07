import 'dart:convert';
import 'package:college_headstart/models/Banner.dart';
import 'package:college_headstart/models/Review.dart';
import 'package:http/http.dart' as http;

class ReviewAPI {
  static ReviewAPI? _instance;

  ReviewAPI._() {}

  static ReviewAPI? get instance {
    if (_instance == null) {
      _instance = ReviewAPI._();
    }
    return _instance;
  }

  var bannerURI = Uri.parse('https://careerheadstart.herokuapp.com/banners');

  var url = Uri.https('careerheadstart.herokuapp.com', '/reviews');

  Future<List<ReviewModel>> getReviews() async {
    // final response = await http.get(bannerURI, headers: {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    // });
    var response = await http.get(url);
    // print(response.body);
    final List responseBody = jsonDecode(response.body);
    return responseBody.map((e) => ReviewModel.fromJson(e)).toList();
  }
}
