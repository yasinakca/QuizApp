import 'question.dart';

class QuizBrain{
  int _questionNumber = 0;

  List<Question> _questions = [
    Question("Q1", true),
    Question("Q2", false),
    Question("Q3", true),
    Question("Q4", false),
    Question("Q5", true),
    Question("Q6", false),
    Question("Q7", true),
    Question("Q8", false),
    Question("Q9", true),
  ];

  String getQuestionText(){
    return _questions[_questionNumber].text;
  }

  bool getQuestionAnswer(){
    return _questions[_questionNumber].answer;
  }

  void nextQuestion(){
    if(_questionNumber < _questions.length - 1){
      _questionNumber++;
    }
  }

  bool isEmpty(){
    if(_questionNumber >= _questions.length - 1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _questionNumber = 0;
  }
}