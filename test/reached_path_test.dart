import 'package:actpod_mental_test/entities/question.dart';
import 'package:actpod_mental_test/entities/result.dart';
import 'package:actpod_mental_test/repositories/question.dart';
import 'package:actpod_mental_test/repositories/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Full Path Exploration Test', () {
    final questionRepo = QuestionRepository();
    final resultRepo = ResultRepository();
    final Map<Result, List<String>> resultPaths = {};

    void exploreSelections(
      List<Question> questions,
      int index,
      double x,
      double y,
      List<String> path
    ) {
      if (index == questions.length) {
        // Reached the end, determine the result
        Result result = resultRepo.calculateResult(x, y);

        // Store the path taken for this result
        if (!resultPaths.containsKey(result)) {
          resultPaths[result] = [];
        }
        resultPaths[result]!.add(path.join(" -> "));

        return;
      }

      // Iterate through all options for the current question
      for (Option option in questions[index].options) {
        exploreSelections(
          questions,
          index + 1,
          x + option.x,
          y + option.y,
          [...path, "${questions[index].question} [${option.text}]"]
        );
      }
    }

    test('Explore all possible selection paths and collect results', () {
      exploreSelections(questionRepo.getQuestions(), 0, 0.0, 0.0, []);

      // Print out the results and their paths
      for (var entry in resultPaths.entries) {
        print("\nReached Result: ${entry.key.title} - ${entry.key.description}");
        print("Paths:");
        for (var path in entry.value) {
          print("  - $path");
        }
      }

      // Ensure all results from ResultRepository are reachable
      expect(resultPaths.length, resultRepo.results.length,
          reason: 'Not all possible results were reached');
    });
  });
}