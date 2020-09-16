import 'package:flutter/material.dart';
import 'package:quiz_appv2/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  QuizBrain qb = QuizBrain();
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer){
    setState(() {
      if(qb.isEmpty()){
        //return alert;
        Alert(context: context, title: "Alert", desc: "Game is over",).show();

        qb.reset();
        scoreKeeper = [];
      }else{
        bool correctAnswer = qb.getQuestionAnswer();
        if(correctAnswer == userAnswer){
          print("user got it correct!");
          scoreKeeper.add(Icon(Icons.done,color: Colors.green,));
        }else{
          print("user got it wrong!");
          scoreKeeper.add(Icon(Icons.cancel,color: Colors.red,));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Text(
                qb.getQuestionText(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    setState(() {
                      checkAnswer(true);
                      qb.nextQuestion();
                    });
                  },
                  child: Text(
                    "True",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      checkAnswer(false);
                      qb.nextQuestion();
                    });
                  },
                  child: Text(
                    "False",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
