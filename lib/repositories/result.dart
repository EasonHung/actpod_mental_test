import 'dart:math';

import 'package:actpod_mental_test/entities/result.dart';

class ResultRepository {
  final List<Result> results = [
    Result(0.0, 180.0, "行動錄製", "你很內向～"),
    Result(180.0, 360.0, "語音互動", "你很外向～")
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
    return Result(0.0, 0.0, "couldn't find result", "you're too special");
  }
}