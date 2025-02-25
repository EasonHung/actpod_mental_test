import 'package:actpod_mental_test/repositories/question.dart';

import '../entities/answer.dart';

List<Answer> answers = [];

class AnswerRepository {
  AnswerRepository();

  void initAnswer() {
    answers = [];
    for(int i = 0; i < QuestionRepository().getQuestions().length; i++) {
      answers.add(Answer(0, 0));
    }
  }

  void insertAnswer(int index, Answer answer) {
    answers[index] = answer;
  }

  List<Answer> getAnswers() {
    return answers;
  }
}