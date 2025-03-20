import 'dart:math';

import 'package:actpod_mental_test/entities/result.dart';

class ResultRepository {
  final List<Result> results = [
    Result(0.0, 45.0, "噪音處理", "冷靜，解決問題導向，沒什麼情緒起伏", "assets/images/result4.png"),
    Result(45.0, 90.0, "語音互動", "對某些特定領域的議題特別關注，提到關心的事情話會特別多，但其他時間可能是社恐", "assets/images/result6.png"),
    Result(90.0, 135.0, "立即剪輯", "效率高，細心，媽媽感", "assets/images/result3.png"),
    Result(135.0, 180.0, "ActPod 官方頻道", "領導立強，經常是團隊中的主導角色", "assets/images/result5.png"),
    Result(180.0, 247.5, "隨身錄製", "活潑，社交性強，隨傳隨到", "assets/images/result2.png"),
    Result(247.5, 315.0, "個人音樂庫", "有主見，但不常表達，獨來獨往，喜好分明", "assets/images/result7.png"),
    Result(315.0, 360.0, "簡潔版面", "給別人情緒價值居多，聆聽者", "assets/images/result1.png"),
  ];

  ResultRepository();

  Result calculateResult(double x, double y) {
    double angle = atan2(y, x);
    double angleDegree = angle * (180 / pi);
    // Shift range from (-180, 180] to [0, 360]
    if (angleDegree < 0) {
      angleDegree += 360;
    }

    for(Result result in results) {
      if(angleDegree >= result.angleDegreeFrom && angleDegree < result.angleDegreeTo) {
        return result;
      }
    }
    return Result(0.0, 0.0, "couldn't find result", "you're too special", "");
  }
}