import 'package:college_headstart/APIs/BannerAPI.dart';
import 'package:college_headstart/models/Banner.dart';
import 'package:flutter/cupertino.dart';

enum BannerReq {
  Initial,
  Loading,
  Loaded,
  Error,
}

class BannerService extends ChangeNotifier {
  BannerReq _bannerReq = BannerReq.Initial;
  List<BannerModel> bannerList = [];

  BannerReq get bannerReq => _bannerReq;

  BannerService() {
    fetchBanners();
  }

  Future<void> fetchBanners() async {
    print("Fetching.....");
    _bannerReq = BannerReq.Loading;
    try {
      final banners = await BannerAPI.instance!.getBanners();
      print("FetchBanner: ${banners.length}");
      bannerList = banners;
      print(bannerList);
    } catch (e) {
      print(e);
    }
    _bannerReq = BannerReq.Loaded;
    notifyListeners();
  }
}
