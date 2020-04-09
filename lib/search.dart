import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(color:Colors.blue,home: FloatingSearchBar.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: Column(
              children: <Widget>[
                Text("Flovers")
              ],
            ));
      }, itemCount: 10, decoration: InputDecoration(hintText: "Search"),leading: Icon(Icons.search),body: Container(color: Colors.blue,),));
  }
}