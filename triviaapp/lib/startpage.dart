import 'package:flutter/material.dart';
import 'package:triviaapp/quizpage1.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  // intital list for answers
  List answer = [];

  // name text controller
  final _name = TextEditingController();

  // fetching name from controller 
  getname() {
    if (_name.text != "") {
      print(_name.text);
      answer.add(_name.text);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => QuizPage(
                answer: answer,
              )));
    } else {

      // dialog box
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Colors.indigoAccent[50],
                title: Text("Error"),
                content: Text(
                  "Enter Name first",
                  style: TextStyle(fontSize: 20),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ));
    }
  }

  // text widget function
  @override
  Widget build(BuildContext context) {
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

    // main body of page
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: texter("StartPage", Colors.white),
          ),
          Spacer()
        ],
      ),
      backgroundColor: Colors.orangeAccent,
      body: Column(children: [


        Expanded(
          flex: 1,
          child: Center(child: texter("Let's Begin...", Colors.black)),
        ),


        Expanded(
          flex: 1,
          child: Center(
            child: texter("Enter your name", Colors.black),
          ),
        ),

        // text field code here
        Expanded(
            flex: 5,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        fillColor: Colors.white60,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        labelText: 'name'),
                  ),
                ),
                GestureDetector(
                  onTap: getname,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white70),
                    child: Center(
                      child: texter("Start", Colors.black),
                    ),
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
