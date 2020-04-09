import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/Services.dart';

class pageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }

//  var imageUrl1;
//  var Title1;
//  var Description;
//  var Intervals;
//  var Duration;
  CrudServices crudServices=CrudServices();
  Widget buid(BuildContext context, var imageUrl, var Title,var Interval,var Duration,var Description) {
    return Material(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showWatering(context, Interval, Duration);
          },
          child: Icon(Icons.opacity),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            color: Colors.green[200],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(Title),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                  height: MediaQuery.of(context).size.height / 3 + 40,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.amber,
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Text(
                                Title,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(Description)
                          ],
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
  void showWatering(BuildContext context, Duration, Interwal) {
    showDialog(
        context: context,
        builder: (BuildContext cotext) {
          return AlertDialog(
            content:
            Text("Water This Plant Every $Duration Days $Interwal Times",style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),),
          );
        });
  }

//  void edit(BuildContext context) {
//    showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            content: Container(
//              child: Column(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  TextField(onChanged: (str){Title1=str;},
//                    decoration: InputDecoration(labelText: "Title"),
//                  ),
//                  TextField(onChanged: (str){Description=str;},
//                    decoration: InputDecoration(labelText: "Description"),
//                  ),
//                  TextField(onChanged: (str){Duration=str;},
//                    decoration: InputDecoration(labelText: "Duration"),
//                  ),
//                  TextField(onChanged: (str){Intervals=str;},
//                    decoration: InputDecoration(labelText: "Day"),
//                  ),
//                //  InkWell(child: Text("SUBMIT"),onTap: (){Updatedata(context);},)
//                ],
//              ),
//            ),
//          );
//        });
//  }
//  Updatedata(BuildContext context,selectedDoc)
//  {
//    crudServices.updateData(selectedDoc,{'Title':this.Title1,'Description':this.Description,'Intervals':this.Intervals,'Duration':this.Duration,'imageUrl':this.imageUrl1});
//  }
}
