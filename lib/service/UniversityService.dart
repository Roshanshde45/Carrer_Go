import 'package:college_headstart/APIs/UniversityAPI.dart';
import 'package:college_headstart/models/University.dart';
import 'package:flutter/cupertino.dart';

enum UniversityReq {
  Initial,
  Loading,
  Loaded,
  Error,
}

class UniversityService extends ChangeNotifier {
  UniversityReq _universityReq = UniversityReq.Initial;
  List<UniversityModel> universityList = [];

  UniversityReq get bannerReq => _universityReq;

  UniversityService() {
    fetchUniversities();
  }

  Future<void> fetchUniversities() async {
    print("Fetching.....");
    _universityReq = UniversityReq.Loading;
    try {
      final universities = await UniversityAPI.instance!.getAllUniversities();
      print("FetchUniversity: ${universities.length}");
      universityList = universities;
    } catch (e) {
      print(e);
    }
    _universityReq = UniversityReq.Loaded;
    notifyListeners();
  }
}
