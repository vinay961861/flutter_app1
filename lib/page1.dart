
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FittedBox(
                child: SizedBox(
                  child: Image.asset(
                    "images/p2.png",
                    height: 30.0,
                  ),
                  height: 250.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 20.0),
                            child: SizedBox(
                                height: 50.0,
                                child: RaisedButton(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                          "G",
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "  Google",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  color: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0)),
                                  onPressed: () {
                                   // launch(
                                    //    "https://accounts.google.com/signin");
                                  },
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
                                left: 20.0, right: 20.0, bottom: 10.0),
                            child: SizedBox(
                              height: 50.0,
                              child: RaisedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "f",
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "  Facebook",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                color: Colors.red[500],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                onPressed: () {//launch("https://www.facebook.com/");
                                   },
                              ),
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
                                left: 40.0, right: 20.0, top: 40.0),
                            child: SizedBox(
                              height: 40.0,
                              child: RaisedButton(
                                color: Colors.yellow[200],
                                onPressed: () {
//                                  Navigator.pushReplacement(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) => null//register()
//                                      ));
                                },
                                child: Center(
                                  child: Text(
                                    "Register",
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Colors.white, width: 1.5)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 20.0, right: 40.0, top: 40.0),
                            child: SizedBox(
                              height: 40.0,
                              child: RaisedButton(
                                color: Colors.orangeAccent[200],
                                child: Center(
                                  child: Text("Login"),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                onPressed: () {
//                                  Navigator.pushReplacement(context, MaterialPageRoute(
//                                      builder: (context) => null//login()
//                                  ));
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}