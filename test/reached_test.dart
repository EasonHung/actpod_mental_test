import 'package:actpod_mental_test/entities/question.dart';
import 'package:actpod_mental_test/entities/result.dart';
import 'package:actpod_mental_test/repositories/question.dart';
import 'package:actpod_mental_test/repositories/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Full Path Exploration Test', () {
    final questionRepo = QuestionRepository();
    final resultRepo = ResultRepository();
    final allResults = <Result>{};

    void exploreSelections(List<Question> questions, int index, double x, double y) {
      if (index == questions.length) {
        // All questions have been answered, now calculate the result
        Result result = resultRepo.calculateResult(x, y);
        allResults.add(result);
        return;
      }

      // Iterate through all options for the current question
      for (Option option in questions[index].options) {
        exploreSelections(questions, index + 1, x + option.x, y + option.y);
      }
    }

    test('Explore all possible selection paths and collect results', () {
      exploreSelections(questionRepo.getQuestions(), 0, 0.0, 0.0);

      // Print out the unique results reached
      for (Result result in allResults) {
        print("Reached Result: ${result.title} - ${result.description}");
      }

      // Ensure all results from ResultRepository are reachable
      expect(allResults.length, resultRepo.results.length,
          reason: 'Not all possible results were reached');
    });
  });
}