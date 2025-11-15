import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:soccer_live/consts.dart';
import 'package:soccer_live/soccer_model.dart';

abstract class ApiManager {
  static Future getAllMateches() async {
    final dio = Dio();
    try {
      final response = await dio.get(apiURL, options: Options(headers: header));
      log("status code is : ${response.statusCode}");
      log("response data is ${response.data}");
      if (response.statusCode == 200) {
        List<dynamic> matchList = response.data["response"];
        List<SoccerMatch> res = matchList
            .map((item) => SoccerMatch.fromJson(item))
            .toList();
        return res;
      }
    } catch (e) {
      log("❌ The Error is ${e.toString()}");
    }
  }

  static Stream<List<SoccerMatch>> liveMatchesStream() async* {
    while (true) {
      final matches = await getAllMateches();

      yield matches;
      await Future.delayed(Duration(seconds: 10));
    }
  }
}
