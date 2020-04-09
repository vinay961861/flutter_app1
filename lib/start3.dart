import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/create.dart';
import 'package:flutterapp1/Services.dart';
import 'package:flutterapp1/group.dart';
import 'package:flutterapp1/register.dart';
import 'package:flutterapp1/search.dart';
import 'package:flutterapp1/start1.dart';
import 'package:flutterapp1/start2.dart';

class start3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget build1(BuildContext context, var imageUrl, var Title, var Description,
      var Intervals, var Duration) {
    CrudServices crudServices=CrudServices();
    return Material(
      child: Scaffold(
        backgroundColor: Colors.greenAccent[100],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _BottomSheet(context);
          },
          backgroundColor: Colors.deepOrangeAccent,
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: EdgeInsets.only(right: 20.0),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Watering(context);
                  },
                  child: Icon(
                    Icons.opacity,
                    size: 24.0,
                    color: Colors.blue,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Watering(context);
                  },
                  child: Text(
                    " Water",
                    style: TextStyle(
                        color: Colors.blue,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          color: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 40.0,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "PlantWell",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                  SizedBox(
                    width: 190,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => register()));
                        },
                        icon: Icon(
                          Icons.power_settings_new,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
                child: Image.asset(
              "images/p3.jpeg",
              fit: BoxFit.fill,
            )),
            InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>pageView().buid(context, imageUrl, Title,)));
              },
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.all(10.0),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: CircleAvatar(
                              maxRadius: MediaQuery.of(context).size.width / 2,
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(Title.toString())
                        ],
                      ),
                      height: MediaQuery.of(context).size.width / 2 - 30,
                      width: MediaQuery.of(context).size.width / 2 - 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _BottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (BuildContext bc) {
          return Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => create()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: Image.asset(
                              'images/s5.jpg',
                              fit: BoxFit.fill,
                            ),
                            color: Colors.deepOrangeAccent,
                          ),
                          Text("Craete Plant")
                        ],
                      )),
                ),
                Expanded(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => search()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 12.0),
                            child: Image.asset(
                              "images/s3.jpg",
                              fit: BoxFit.fill,
                            ),
                            color: Colors.blue,
                          ),
                          Text("Search Plant")
                        ],
                      )),
                ),
                Expanded(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => group()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: Image.asset(
                              'images/s4.jpg',
                              fit: BoxFit.fill,
                            ),
                            color: Colors.lightGreenAccent,
                          ),
                          Text(
                            "Create Group",
                            style: TextStyle(),
                          )
                        ],
                      )),
                )
              ],
            ),
          );
        });
  }

//  void validation(String str) {
//    if (iValue == 'Logout') {
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => login()));
//      iValue = " ";
//    } else if (iValue == 'Settings') {
//      Navigator.push(
//          context, MaterialPageRoute(builder: (context) => settings()));
//      iValue = " ";
//    } else if (iValue == 'Rating') {
//      Navigator.push(
//          context, MaterialPageRoute(builder: (context) => ratings()));
//      iValue = " ";
//    }
//  }

  void Watering(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext conntext) {
          return AlertDialog(
            content: Container(
              child: Text("Watering to Plants"),
            ),
          );
        });
  }
}
