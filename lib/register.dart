
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp1/Services.dart';
import 'package:flutterapp1/getEmail.dart';
import 'package:flutterapp1/login.dart';
import 'dart:async';

import 'package:flutterapp1/start1.dart';
class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {

  var _formkey = GlobalKey<FormState>();
  getEmail g1=getEmail();
  String email;
  String password;
  String error=" ";
  CrudServices crudServices=CrudServices();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formkey,
        child: Container(
          color: Colors.green[200],
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    child: Image.asset(
                      "images/p2.png",
                      height: 30.0,
                    ),
                    height: 250.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0, bottom: 10.0),
                                child: SizedBox(
                                    child: TextFormField(
                                      onChanged: (val) {
                                        setState(() {
                                          email = val;
                                          g1.email=val;
                                          getEmail(email: val);
                                          print(g1.email);
                                        });
                                      },
                                      validator: (String str) {
                                        if (str.isEmpty) {
                                          return "plese enter E-mail";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          labelText: "E-mail",
                                          hintText: "Enter your E-mail",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(10.0))),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0, bottom: 0.0),
                                child: SizedBox(
                                  child: TextFormField(
                                      onChanged: (val) {
                                        setState(() {
                                          password = val;
                                        });
                                      },
                                      obscureText: true,
                                      validator: (String str) {
                                        if (str.isEmpty) {
                                          return "Please enter Password";
                                        }
                                        ;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Password",
                                          hintText: "Enter your Password",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ))),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 55.0,
                                    right: 55.0,
                                    top: 10.0,
                                    bottom: 20.0),
                                child: SizedBox(
                                  height: 50.0,
                                  child: RaisedButton(
                                    color: Colors.yellow[200],
                                    onPressed: () async {
                                      if (_formkey.currentState.validate()) {
                                        dynamic res= await crudServices.registerWithEmailAndPassword(email, password);
                                        if (res != null) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      check()));
                                        } else {
                                          setState(() {
                                            error =
                                            "Please enter correct details";
                                          });
                                        }
                                      }
                                      ;
                                    },
                                    child: Center(
                                      child: Text(
                                        "Register",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            color: Colors.white, width: 1.5)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Center(
                            child: Text(error,style: TextStyle(color: Colors.red,fontSize: 13.0),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Alredy have a account? ",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w800),
                              ),
                              InkWell(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0),
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => login()));
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}