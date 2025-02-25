class Question {
  String question;
  List<Option> options;

  Question(this.question, this.options);
}

class Option {
  String text;
  double x;
  double y;

  Option(this.text, this.x, this.y);
}