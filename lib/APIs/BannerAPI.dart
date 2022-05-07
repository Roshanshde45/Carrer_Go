import 'dart:convert';

import 'package:college_headstart/models/Banner.dart';
import 'package:http/http.dart' as http;

class BannerAPI {
  static BannerAPI? _instance;

  BannerAPI._() {}

  static BannerAPI? get instance {
    if (_instance == null) {
      _instance = BannerAPI._();
    }
    return _instance;
  }

  var bannerURI = Uri.parse('https://careerheadstart.herokuapp.com/banners');

  var url = Uri.https('careerheadstart.herokuapp.com', '/banners');

  Future<List<BannerModel>> getBanners() async {
    // final response = await http.get(bannerURI, headers: {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    // });
    var response = await http.get(url);
    // print(response.body);
    final List responseBody = jsonDecode(response.body);
    return responseBody.map((e) => BannerModel.fromJson(e)).toList();
  }
}
