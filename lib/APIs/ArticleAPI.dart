import 'dart:convert';
import 'package:college_headstart/models/Article.dart';
import 'package:http/http.dart' as http;

class ArticleAPI {
  static ArticleAPI? _instance;

  ArticleAPI._() {}

  static ArticleAPI? get instance {
    if (_instance == null) {
      _instance = ArticleAPI._();
    }
    return _instance;
  }

  // var bannerURI = Uri.parse('https://careerheadstart.herokuapp.com/a');

  var url = Uri.https('careerheadstart.herokuapp.com', '/articles');

  Future<List<ArticleModel>> getAllArticles() async {
    // final response = await http.get(bannerURI, headers: {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    // });
    var response = await http.get(url);
    // print(response.body);
    final List responseBody = jsonDecode(response.body);
    return responseBody.map((e) => ArticleModel.fromJson(e)).toList();
  }
}
