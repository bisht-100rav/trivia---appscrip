import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triviaapp/startpage.dart';

// ignore: must_be_immutable
class Final extends StatelessWidget {
  // fetching variables from previous class
  Final({Key key, this.score, this.answer}) : super(key: key);
  int score;

  // list to store instance previous data
  List answer;

  List questions = [
    "Who is the best cricketer in the world?",
    "What are the colors in the Indian national flag?"
  ];
  @override
  Widget build(BuildContext context) {
    Widget texter(String _text, var _color, double size) {
      return Text(
        _text,
        style: TextStyle(
          letterSpacing: 2,
          fontFamily: "Noto",
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: _color,
        ),
      );
    }

    // finish button function
    _finish() {
      return Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => StartPage()));
    }
    
    // history button functionality
    _read() async {
      final prefs = await SharedPreferences.getInstance();

      // referencing global keys
      final key = 'my_int_key';
      final answer1key = 'my_answer1_key';
      final answer2key = 'my_answer2_key';
      final scorekey = 'my_score_key';
      final datetime = 'datetime_key';

      // fetching data from the saved 
      int _score = prefs.getInt(scorekey) ?? 0;
      String answer1 = prefs.getString(answer1key) ?? "";
      List answer2 = prefs.getStringList(answer2key) ?? [];
      String name = prefs.getString(key) ?? "";
      String time = prefs.getString(datetime) ?? "";

      // printing inside the console
      print("\n----------------------");
      print('name: $name');
      print('answer1 $answer1');
      print('answer2 $answer2');
      print("Score $score");
      print("Time $time");
    }

    // save button functionality
    _save() async {
      final prefs = await SharedPreferences.getInstance();
      SharedPreferences.setMockInitialValues({});

      // initialising and reference global keys
      final key = 'my_int_key';
      final answer1key = 'my_answer1_key';
      final answer2key = 'my_answer2_key';
      final scorekey = 'my_score_key';
      final datetime = 'datetime_key';

      // fetching data from the local code
      int _score = score;
      String answer1 = answer[1];
      List answer2 = [];
      answer2.addAll([answer[2], answer[3], answer[4]]);
      String name = answer[0];
      var now = DateTime.now();
      String time = now.toString();

      // storing data using reference keys
      prefs.setInt(scorekey, _score);
      prefs.setString(key, name);
      prefs.setString(answer1key, answer1);
      prefs.setStringList(answer2key, [answer[2], answer[3], answer[4]]);
      prefs.setString(datetime, time);


      //printing inside the console
      print("\n-------------------------");
      print('saved $name');
      print('saved $answer1');
      print('saved $answer2');
      print('saved $_score');
      print('saved $time');
    }


    // main body of the page
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        actions: [
          Spacer(),
          Padding(
            padding: EdgeInsets.all(10),
            child: texter("Results", Colors.white, 20),
          ),
          Spacer()
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Center(child: texter("Your Score $score", Colors.black, 20)),
          ),
          SingleChildScrollView(

            // showing quesitons and choosen answers
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: texter(questions[0], Colors.black, 20),
                  ),
                  texter(answer[1], Colors.deepOrange, 17),
                  Padding(padding: EdgeInsets.all(20)),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: texter(questions[1], Colors.black, 20),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      texter(answer[2], Colors.deepOrange, 17),
                      texter(", ", Colors.deepOrange, 17),
                      texter(answer[3], Colors.deepOrange, 17),
                      texter(", ", Colors.deepOrange, 17),
                      texter(answer[4], Colors.deepOrange, 17)
                    ],
                  ),
                ]),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [

            // finish button
            InkWell(
              onTap: _finish,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: texter("Finish", Colors.black, 20),
                ),
              ),
            ),

            // save button
            InkWell(
              onTap: _save,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: texter("Save", Colors.black, 20),
                ),
              ),
            ),

            // history button
            InkWell(
              onTap: _read,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: texter("History", Colors.black, 20),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
