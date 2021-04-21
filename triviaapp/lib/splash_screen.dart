import 'dart:async';

import 'package:flutter/material.dart';
import 'package:triviaapp/startpage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  // state change
  void initState() {
    // Splash screen displayed for 3 seconds
    int displaytime = 3;


    // Display splash screen for a time
    super.initState();
    Timer(Duration(seconds: displaytime), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => StartPage()));
    });
  }

  // Main body of the page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Image show
          Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/front.png"), fit: BoxFit.cover),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100))),

          // Text Show
          Container(
            child: Center(
              child: Text("Trivia World",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 30,
                    fontFamily: 'Noto',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  )),
            ),
          ),

          //Spacer
          Padding(
            padding: EdgeInsets.all(2.0),
          ),

          // Second text
          Container(
            child: Text(
              "Quiz your way",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 2,
                  fontSize: 20,
                  fontFamily: "Noto",
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
