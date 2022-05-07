import 'package:college_headstart/APIs/CollegesAPI.dart';
import 'package:college_headstart/APIs/UniversityAPI.dart';
import 'package:college_headstart/models/College.dart';
import 'package:college_headstart/models/University.dart';
import 'package:flutter/cupertino.dart';

enum CollegesReq {
  Initial,
  Loading,
  Loaded,
  Error,
}

class CollegesService extends ChangeNotifier {
  CollegesReq _collegesReq = CollegesReq.Initial;
  List<CollegeModel> collegeList = [];

  CollegesReq get collegesReq => _collegesReq;

  CollegesService() {
    fetchUniversities();
  }

  Future<void> fetchUniversities() async {
    print("Fetching.....");
    _collegesReq = CollegesReq.Loading;
    try {
      final universities = await CollegesAPI.instance!.getAllUColleges();
      print("FetchUniversity: ${universities.length}");
      collegeList = universities;
    } catch (e) {
      print(e);
    }
    _collegesReq = CollegesReq.Loaded;
    notifyListeners();
  }
}
