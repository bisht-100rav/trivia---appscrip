import 'package:flutter/material.dart';
import 'package:triviaapp/finalpage.dart';

// ignore: must_be_immutable
class QuizPage2 extends StatefulWidget {
  // passing of local variables from previous class
  QuizPage2({Key key, this.score, this.answer}) : super(key: key);
  int score;
  List answer;
  @override
  _QuizPage2State createState() => _QuizPage2State();
}

class _QuizPage2State extends State<QuizPage2> {

  // boolean var for option select
  bool _selected1 = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;
  @override
  Widget build(BuildContext context) {

    // options for question 2
    List op = [
      ["White", "Yellow", "Orange", "Green"],
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

    Widget _choicebutton(int index, var _color) {
      return Container(
          margin: EdgeInsets.all(10),
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              color: _color, borderRadius: BorderRadius.circular(10)),
          child: Center(child: texter(op[0][index], Colors.black)));
    }
    
    // set of function for changing state of the options on selection
    _onselect1() {
      setState(() {
        if (_selected1) {
          _selected1 = false;
        } else {
          widget.answer.add(op[0][0]);
          _selected1 = true;
        }
      });
    }

    _onselect2() {
      setState(() {
        if (_selected2) {
          _selected2 = false;
        } else {
          widget.answer.add(op[0][1]);
          _selected2 = true;
        }
      });
    }

    _onselect3() {
      setState(() {
        if (_selected3) {
          _selected3 = false;
        } else {
          widget.answer.add(op[0][2]);
          _selected3 = true;
        }
      });
    }

    _onselect4() {
      setState(() {
        if (_selected4) {
          _selected4 = false;
        } else {
          widget.answer.add(op[0][3]);
          _selected4 = true;
        }
      });
    }

    _submit() {
      // incrementing global score
      if (_selected1 == true && _selected3 == true && _selected4 == true) {
        widget.score += 5;
        print(widget.score);
        print(widget.answer);
        return Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Final(
                  score: widget.score,
                  answer: widget.answer,
                )));
      } else {
        print(widget.score);
        print(widget.answer);
        return Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Final(
                  score: widget.score,
                  answer: widget.answer,
                )));
      }
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
            child: texter("Question 2", Colors.white),
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
                    child: texter(
                        "What are the colors in the Indian national flag?\n (Select atleast 3)",
                        Colors.black))),
          ),
          Expanded(
            flex: 9,
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
                    margin: EdgeInsets.only(top: 100),
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
          )
        ],
      ),
    );
  }
}

class Question2 extends StatefulWidget {
  @override
  _Question2State createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
