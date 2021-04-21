import 'package:flutter/material.dart';
import 'package:triviaapp/quizpage2.dart';

class QuizPage extends StatefulWidget {
  // passing local variable from previous page
  QuizPage({Key key, this.answer}) : super(key: key);
  List answer;

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  // variables
  int score = 0;

  // booleean values for options state
  bool _selected1 = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;
  @override
  Widget build(BuildContext context) {


    // options list
    List op = [
      ["Sachin Tendulkar", "Virat Kohli", "Adam Gilchirst", "Jacques Kallis"],
      ["a", "b", "c", "d"]
    ];

    Widget texter(String _text, var _color) {
      return Text(
        _text,
        style: TextStyle(
          letterSpacing: 2,
          fontFamily: "Noto",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: _color,
        ),
      );
    }

    // option button code here
    Widget _choicebutton(int index, var _color) {
      return Container(
          margin: EdgeInsets.all(10),
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              color: _color, borderRadius: BorderRadius.circular(10)),
          child: Center(child: texter(op[0][index], Colors.black)));
    }

    // set of function for change of state
    // 
    // for option 1
    _onselect1() {
      setState(() {
        if (_selected2 == false && _selected3 == false && _selected4 == false) {
          if (_selected1) {
            _selected1 = false;
          } else {
            _selected1 = true;
            widget.answer.add(op[0][0]);
            score += 5;
          }
        }
      });
    }

    // option 2
    _onselect2() {
      setState(() {
        if (_selected1 == false && _selected3 == false && _selected4 == false) {
          if (_selected2) {
            _selected2 = false;
          } else {
            widget.answer.add(op[0][1]);
            _selected2 = true;
          }
        }
      });
    }

    // option 3
    _onselect3() {
      setState(() {
        if (_selected1 == false && _selected2 == false && _selected4 == false) {
          if (_selected3) {
            _selected3 = false;
          } else {
            widget.answer.add(op[0][2]);
            _selected3 = true;
          }
        }
      });
    }
    
    // option 4
    _onselect4() {
      setState(() {
        if (_selected1 == false && _selected2 == false && _selected3 == false) {
          if (_selected4) {
            _selected4 = false;
          } else {
            widget.answer.add(op[0][3]);
            _selected4 = true;
          }
        }
      });
    }

    // submit button functionality
    _submit() {
      print(score);
      print(widget.answer);
      return Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => QuizPage2(
                score: score,
                answer: widget.answer,
              )));
    }


    // main body of the page
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        actions: [
          Spacer(),
          Padding(
            padding: EdgeInsets.all(10),
            child: texter("Question 1", Colors.white),
          ),
          Spacer()
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                    child: texter("Who is the best cricketer in the world?",
                        Colors.black))),
          ),
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _onselect1,
                    child: _choicebutton(
                        0, (_selected1 ? Colors.purple : Colors.white)),
                  ),
                  GestureDetector(
                    onTap: _onselect2,
                    child: _choicebutton(
                        1, _selected2 ? Colors.purple : Colors.white),
                  ),
                  GestureDetector(
                    onTap: _onselect3,
                    child: _choicebutton(
                        2, _selected3 ? Colors.purple : Colors.white),
                  ),
                  GestureDetector(
                    onTap: _onselect4,
                    child: _choicebutton(
                        3, _selected4 ? Colors.purple : Colors.white),
                  ),

                  // submit button
                  GestureDetector(
                    onTap: _submit,
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: texter("Submit", Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
