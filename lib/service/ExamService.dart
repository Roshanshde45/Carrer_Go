import 'package:college_headstart/APIs/BannerAPI.dart';
import 'package:college_headstart/APIs/ExamAPI.dart';
import 'package:college_headstart/models/Banner.dart';
import 'package:college_headstart/models/Exam.dart';
import 'package:flutter/cupertino.dart';

enum ExamsReq {
  Initial,
  Loading,
  Loaded,
  Error,
}

class ExamService extends ChangeNotifier {
  ExamsReq _examReq = ExamsReq.Initial;
  List<ExamModel> examsList = [];

  ExamsReq get examReq => _examReq;

  ExamService() {
    fetchExamsList();
  }

  Future<void> fetchExamsList() async {
    print("Fetching.....");
    _examReq = ExamsReq.Loading;
    try {
      final banners = await ExamAPI.instance!.getExam();
      examsList = banners;
      print(examsList);
    } catch (e) {
      print(e);
    }
    _examReq = ExamsReq.Loaded;
    notifyListeners();
  }
}
