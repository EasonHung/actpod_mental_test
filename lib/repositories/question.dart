import 'package:actpod_mental_test/entities/question.dart';

class QuestionRepository {
  final List<Question> questions = [
    Question("Question 1", [Option("option 1", -1, 0), Option("option 2", -1, -2), Option("option 3", 3, 4)]),
    Question("Question 2", [Option("option 1", -1, 0), Option("option 2", -1, -2), Option("option 3", 3, 4)]),
    Question("Question 3", [Option("option 1", -1, 0), Option("option 2", -1, -2), Option("option 3", 3, 4)])
  ];

  QuestionRepository();

  List<Question> getQuestions() {
    return questions;
  }
}