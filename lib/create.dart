import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp1/Services.dart';
import 'package:flutterapp1/getEmail.dart';
import 'package:flutterapp1/register.dart';
import 'package:flutterapp1/start1.dart';
import 'package:flutterapp1/start3.dart';
import 'package:flutterapp1/user.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:loading/indicator.dart';
class create extends StatefulWidget {
  @override
  _createState createState() => _createState();
}

class _createState extends State<create> {
  User u1=User();
  CrudServices crudServices = CrudServices();
  File _image;
  var day;
  var water;
  var title;
  var descrption;
  var imageUrl;
  var _star = "time";
  int ini = 0;
  int _interwal = 1;
  var res1 = 0;
  var res2 = 0;
  getEmail g1=getEmail();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text("Create Plant"),
          backgroundColor: Colors.cyan,
          actions: <Widget>[
            InkWell(
              onTap: () {
                uploadImage(context);
              },
              child: Container(
                  margin: EdgeInsets.only(right: 30.0),
                  child: Center(
                    child: Text("SAVE"),
                  )),
            )
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  getImage();
                },
                child: Container(
                  child: _image == null
                      ? Image.asset(
                    'images/c1.jpg',
                    fit: BoxFit.fill,
                  )
                      : Image.file(_image),
                  color: Colors.cyan,
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 10.0, left: 20.0, right: 10.0),
                                    child: SizedBox(
                                      height: 50.0,
                                      child: RaisedButton(
                                        child: FirstBox(),
                                        color: Colors.lightGreen[300],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(40.0)),
                                        onPressed: () {
                                          ShowAlert(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 10.0, left: 20.0, right: 10.0),
                                    child: null
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 10.0, left: 20.0, right: 10.0),
                                    child: SizedBox(
                                      height: 50.0,
                                      child: RaisedButton(
                                        child: Center(
                                          child:
                                          Text("Water amount : $_interwal"),
                                        ),
                                        color: Colors.lightGreen[300],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(40.0)),
                                        onPressed: () {
                                          ShowAlert1(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(20.0),
                            child: TextFormField(
                              onChanged: (str) {
                                title = str;
                              },
                              decoration: InputDecoration(
                                  labelText: "Title",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0))),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: TextFormField(
                              onChanged: (str) {
                                descrption = str;
                              },
                              decoration: InputDecoration(
                                  labelText: "Description(Optional)",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0))),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }

  void ShowAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext conntext) {
          return AlertDialog(
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[Text("Water Interval")],
                  ),
                  NumberPicker.integer(
                      initialValue: ini,
                      itemExtent: 40.0,
                      listViewWidth: 30.0,
                      minValue: 0,
                      maxValue: 100,
                      onChanged: (res) {
                        setState(() {
                          ini = res;
                          res1 = res;
                          day = res;
                        });
                      }),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            ini = 0;
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          "CANCEL",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            ini = res1;
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  )
                ],
              ),
            ),
          );
        });
  }
  void ShowAlert3(BuildContext context) {
    showDialog(barrierDismissible: false,
        context: context,
        builder: (BuildContext conntext) {
          return AlertDialog(
            content: Column(mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(children: <Widget>[Container(
                  child: Center(
                    child: Loading(indicator: BallPulseIndicator(),color: Colors.pink),
                  ),
                ),SizedBox(width: 10.0,),Text("Please Wait")],),
              ],
            ),
          );
        });
  }

  void ShowAlert1(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext conntext) {
          return AlertDialog(
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[Text("Water amount")],
                  ),
                  NumberPicker.integer(
                      initialValue: _interwal,
                      itemExtent: 40.0,
                      listViewWidth: 30.0,
                      minValue: 1,
                      maxValue: 3,
                      onChanged: (res) {
                        setState(() {
                          _interwal = res;
                          res2 = res;
                          water = res;
                        });
                      }),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            _interwal = 1;
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          "CANCEL",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _interwal = res2;
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget FirstBox() {
    if (ini == 0) {
      return Text("Every Day");
    } else {
      return Text("Every $ini Days");
    }
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future uploadImage(BuildContext context) async {
    var filename = basename(_image.path);
    StorageReference storageReference =
    FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    ShowAlert3(context);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    var imageUrl = await taskSnapshot.ref.getDownloadURL();
    var create = {
      'imageUrl': imageUrl,
      'Title': title,
      'Description': descrption,
      'Intervals': day,
      'Duration': water
    };
    print(g1.email);
    Firestore.instance.collection('create'
    ).add(create);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>check()));
  }
  void setValue(var imageUrl1)
  {
    setState(() {
      imageUrl=imageUrl1;
    });
  }

}