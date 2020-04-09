import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ratings extends StatefulWidget {
  @override
  _ratingsState createState() => _ratingsState();
}

class _ratingsState extends State<ratings> {
  double rating1 = 4.0;

  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(appBar: AppBar(backgroundColor:Colors.yellow,title: Text("Give Rating",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),),
          body: ListView(
            children: <Widget>[
              Container(
                height: 100.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RatingBar(
                    initialRating: 4,
                    minRating: 1,
                    maxRating: 5,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        rating1 = rating;
                      });
                    },
                  ),
                  Image.asset("images/$rating1.gif"),
                  Container(
                    height: 30.0,
                  ),
                  RaisedButton(onPressed: (){Navigator.pop(context);},
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.green,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}