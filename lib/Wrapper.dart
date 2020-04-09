import 'package:flutter/material.dart';
import 'package:flutterapp1/user.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user=Provider.of<User>(context);
    if(user=null)
      {

      }
  }
}
