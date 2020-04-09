
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/login.dart';
class restore extends StatefulWidget {
  @override
  _restoreState createState() => _restoreState();
}

class _restoreState extends State<restore> {
  var _formkey = GlobalKey<FormState>();
  String msg = " ";
  var email;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey,
      child: Column(
        children: <Widget>[
          Image.asset("images/p2.png"),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 10.0),
                  child: SizedBox(
                      child: TextFormField(onChanged: (str){setState(() {
                        email=str;
                      });},
                        validator: (String str) {
                          if (str.isEmpty) {
                            return "plese enter E-mail";
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            hintText: "Enter your E-mail",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: 55.0, right: 55.0, top: 10.0, bottom: 20.0),
                  child: SizedBox(
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.yellow[200],
                      onPressed: () {
                       sendLink();
                      },
                      child: Center(
                        child: Text(
                          "Reset Password",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                              color: Colors.white, width: 1.5)),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  void sendLink()
  {
    dynamic result=FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((onValue){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));});
  }

}