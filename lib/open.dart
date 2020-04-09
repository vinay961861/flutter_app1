import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapp1/login.dart';
import 'package:flutterapp1/page1.dart';
import 'package:flutterapp1/register.dart';

class firstScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<firstScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => register())));
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: new BoxDecoration(color: Colors.white),
          child: new Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("PlantWell",style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,color: Colors.green),),
                Image.asset("images/1.gif"),
                Image.asset("images/p.gif"),
              ],
            ),
          ),
        ), //<- place where the image appears
      ),
    );
  }
}