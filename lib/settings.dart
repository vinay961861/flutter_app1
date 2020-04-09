
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/page1.dart';
import 'package:url_launcher/url_launcher.dart';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.teal[700],
        appBar: AppBar(backgroundColor: Colors.blueGrey,
          title: Text("Settings",style: TextStyle(fontSize: 35.0),),
        ),
        body: (Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(child: Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(60.0),color: Colors.white70),
                child: Center(
                  child: Text(
                    "Policy",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),onTap: (){launch("https://beplantwell.com/terms-and-policies/");},
            ),InkWell(child: Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(60.0),color: Colors.white70),
                child: Center(
                  child: Text(
                    "Saved Data",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),onTap: (){},
            ),InkWell(child: Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(60.0),color: Colors.white70),
                child: Center(
                  child: Text(
                    "Close Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home()));},
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        )),
      ),
    );
  }
}