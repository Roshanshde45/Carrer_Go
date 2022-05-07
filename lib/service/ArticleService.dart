import 'package:college_headstart/APIs/ArticleAPI.dart';
import 'package:college_headstart/APIs/BannerAPI.dart';
import 'package:college_headstart/APIs/ReviewAPI.dart';
import 'package:college_headstart/models/Article.dart';
import 'package:college_headstart/models/Banner.dart';
import 'package:college_headstart/models/Review.dart';
import 'package:flutter/cupertino.dart';

enum ArticleReq {
  Initial,
  Loading,
  Loaded,
  Error,
}

class ArticleService extends ChangeNotifier {
  ArticleReq _articleReq = ArticleReq.Initial;
  List<ArticleModel> articleList = [];

  ArticleReq get articleReq => _articleReq;

  ArticleService() {
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    print("Fetching.....");
    _articleReq = ArticleReq.Loading;
    try {
      final articles = await ArticleAPI.instance!.getAllArticles();
      articleList = articles;
    } catch (e) {
      print(e);
    }
    _articleReq = ArticleReq.Loaded;
    notifyListeners();
  }
}
