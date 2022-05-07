import 'package:college_headstart/APIs/BannerAPI.dart';
import 'package:college_headstart/APIs/ReviewAPI.dart';
import 'package:college_headstart/models/Banner.dart';
import 'package:college_headstart/models/Review.dart';
import 'package:flutter/cupertino.dart';

enum ReviewsReq {
  Initial,
  Loading,
  Loaded,
  Error,
}

class ReviewService extends ChangeNotifier {
  ReviewsReq _reviewReq = ReviewsReq.Initial;
  List<ReviewModel> reviewsList = [];

  ReviewsReq get reviewReq => _reviewReq;

  ReviewService() {
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    print("Fetching.....");
    _reviewReq = ReviewsReq.Loading;
    try {
      final reviews = await ReviewAPI.instance!.getReviews();
      reviewsList = reviews;
    } catch (e) {
      print(e);
    }
    _reviewReq = ReviewsReq.Loaded;
    notifyListeners();
  }
}
