import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/Services.dart';
import 'package:flutterapp1/create.dart';
import 'package:flutterapp1/group.dart';
import 'package:flutterapp1/login.dart';
import 'package:flutterapp1/rating.dart';
import 'package:flutterapp1/register.dart';
import 'package:flutterapp1/search.dart';
import 'package:flutterapp1/settings.dart';
import 'package:flutterapp1/start2.dart';
import 'package:flutterapp1/user.dart';

class check extends StatefulWidget {
  @override
  _checkState createState() => _checkState();
}

class _checkState extends State<check> {
  CrudServices crudServices = CrudServices();

  // QuerySnapshot data3;
  var imageUrl;
  var Title = " ";
  var Description;
  var Intervals;
  var Duration;
  String iValue = "hai";
  var men = ['Settings', 'Logout', 'Rating'];

//
//  @override
//  void initState() {
//    crudServices.getData().then((result) {
//      setState(() {
//        data3 = result;
//      });
//    });
//    super.initState();
//  }
//  Widget PlantList() {
//    if (data3 != null) {
//      ListView.builder(
//          itemCount: data3.documents.length,
//          itemBuilder: (context, i) {
//            return ListTile(
//              title: Text(data3.documents[i].data['Title']),
//            );
//          });
//    }
//  }
//
//  Widget gettingData() {
//    if (data3 != null) {
//      return StreamBuilder(stream: data3,builder: ((context,Snapshot){return ListView.builder(itemCount:Snapshot.data.d,itemBuilder: (context, i) {
//        return Column(
//          children: <Widget>[Text()],
//        );
////        return InkWell(
////          onTap: () {
////            setState(() {
////              imageUrl = data.documents[i].data['imageUrl'];
////              Title = data.documents[i].data['Title'];
////              Description = data.documents[i].data['Description'];
////              Intervals = data.documents[i].data['Intervals'];
////              Duration = data.documents[i].data['Duration'];
////            });
////            pageView().buid(
////                context, imageUrl, Title, Description, Intervals, Duration);
////          },
////          child: Container(
////              margin: EdgeInsets.all(15.0),
////              padding: EdgeInsets.all(10.0),
////              color: Colors.white,
////              child: Column(
////                children: <Widget>[
////                  Expanded(
////                    child: CircleAvatar(
////                      maxRadius: MediaQuery
////                          .of(context)
////                          .size
////                          .width / 2,
////                      backgroundImage: NetworkImage(
////                          data.documents[i].data['imageUrl']),
////                    ),
////                  ),
////                  SizedBox(
////                    height: 20.0,
////                  ),
////                  Text(data.documents[i].data['Title'])
////                ],
////              ),
////              height: MediaQuery
////                  .of(context)
////                  .size
////                  .width / 2 - 30,
////              width: MediaQuery
////                  .of(context)
////                  .size
////                  .width / 2 - 30),
////        );
//      })}),);
//    }
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              InkWell(
//                onTap: () {
//                  Watering(context);
//                },
//                child: Icon(
//                  Icons.opacity,
//                  size: 24.0,
//                  color: Colors.blue,
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Watering(context);
//                },
//                child: Text(
//                  " Water",
//                  style: TextStyle(
//                      color: Colors.blue,
//                      letterSpacing: 2.0,
//                      fontWeight: FontWeight.bold),
//                ),
//              )
//            ],
//          ),
        ),
        color: Colors.white,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton(
            child: Container(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.green,
                )),
            color: Colors.yellow[100],
            initialValue: iValue,
            onSelected: (String newValue) {
              setState(() {
                iValue = newValue;
                validation(iValue);
              });
            },
            itemBuilder: (BuildContext context) {
              return men.map((String str) {
                return PopupMenuItem(
                  child: Text(str),
                  value: str,
                );
              }).toList();
            },
          )
        ],
        title: Text(
          "PlantWell",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: StreamBuilder(
          stream: Firestore.instance.collection('create').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('loading....');
            return ListView.builder(
              itemExtent: 80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          }

// This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.lightGreen[400],
          margin: EdgeInsets.all(10.0),
          child: ListTile(
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                showDelete(context, document.documentID, document['imageUrl']);
              },
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => pageView().buid(
                          context,
                          document['imageUrl'],
                          document['Title'],
                          document['Intervals'],
                          document['Duration'],
                          document['Description'])));
            },
            leading: Container(
              child: CircleAvatar(
                  backgroundColor: Colors.lightGreen[400],
                  child: Image.network(
                    document['imageUrl'],
                    fit: BoxFit.contain,
                  )),
            ),
            title: Text(
              document['Title'],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  fontSize: 18.0),
            ),
          ),
        ),
      ],
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

//  void edit(BuildContext context, document) {
//    showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            content: Container(
//              child: Column(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  TextField(
//                    onChanged: (str) {
//                      Title = str;
//                    },
//                    decoration: InputDecoration(labelText: "Title"),
//                  ),
//                  TextField(
//                    onChanged: (str) {
//                      Description = str;
//                    },
//                    decoration: InputDecoration(labelText: "Description"),
//                  ),
//                  TextField(
//                    onChanged: (str) {
//                      Duration = str;
//                    },
//                    decoration: InputDecoration(labelText: "Duration"),
//                  ),
//                  TextField(
//                    onChanged: (str) {
//                      Intervals = str;
//                    },
//                    decoration: InputDecoration(labelText: "Day"),
//                  ),
//                  InkWell(
//                    child: Text("SUBMIT"),
//                    onTap: () {
//                      Updatedata(context, document);
//                    },
//                  )
//                ],
//              ),
//            ),
//          );
//        });
//  }

  showDelete(BuildContext context, document, Url) {
    showDialog(
        context: context,
        builder: (BuildContext cotext) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Do You Want To Delete",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                        "Yes",
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {
                        delete(document);
                        FirebaseStorage.instance
                            .ref()
                            .child(Url)
                            .delete();
                      },
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  Updatedata(BuildContext context, selectedDoc) {
    crudServices.updateData(selectedDoc, {
      'Title': this.Title,
      'Description': this.Description,
      'Intervals': this.Intervals,
      'Duration': this.Duration,
    });
  }

  void validation(String str) async {
    if (iValue == 'Logout') {
      await crudServices.sigOut().whenComplete(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => register()));
      });
      iValue = " ";
    } else if (iValue == 'Settings') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => settings()));
      iValue = " ";
    } else if (iValue == 'Rating') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ratings()));
      iValue = " ";
    }
  }

  delete(docId) {
    crudServices.deleteData(docId);
    Navigator.pop(context);
  }
}

////import 'package:cloud_firestore/cloud_firestore.dart';
////import 'package:flutter/cupertino.dart';
////import 'package:flutter/material.dart';
////import 'package:flutterapp1/create.dart';
////import 'package:flutterapp1/Services.dart';
////import 'package:flutterapp1/group.dart';
////import 'package:flutterapp1/search.dart';
////import 'package:flutterapp1/start2.dart';
////
////
////class start1 extends StatefulWidget {
////  @override
////  _start1State createState() => _start1State();
////}
////
////class _start1State extends State<start1> {
////  CrudServices crudServices = CrudServices();
////  QuerySnapshot data;
////  QuerySnapshot data1;
////  var imageUrl;
////  var Title;
////  var Description;
////  var Intervals;
////  var Duration;
////
////  @override
////  void initState() {
////    crudServices.getData1().then((result) {
////      setState(() {
////        data1 = result;
////      });
////    });
////    crudServices.getData().then((result) {
////      setState(() {
////        data = result;
////      });
////    });
////    super.initState();
////  }
////
////  @override
////  String iValue = "hai";
////  var men = ['Settings', 'Logout', 'Rating'];
////
////  Widget build(BuildContext context) {
////    return Material(
////      child: Scaffold(
////        backgroundColor: Colors.greenAccent[100],
////        floatingActionButton: FloatingActionButton(
////          onPressed: () {
////            _BottomSheet(context);
////          },
////          backgroundColor: Colors.deepOrangeAccent,
////          child: Icon(Icons.add),
////        ),
////        bottomNavigationBar: BottomAppBar(
////          child: Container(
////            margin: EdgeInsets.only(right: 20.0),
////            height: 50.0,
////            child: Row(
////              mainAxisAlignment: MainAxisAlignment.end,
////              children: <Widget>[
////                InkWell(
////                  onTap: () {
////                    Watering(context);
////                  },
////                  child: Icon(
////                    Icons.opacity,
////                    size: 24.0,
////                    color: Colors.blue,
////                  ),
////                ),
////                InkWell(
////                  onTap: () {
////                    Watering(context);
////                  },
////                  child: Text(
////                    " Water",
////                    style: TextStyle(
////                        color: Colors.blue,
////                        letterSpacing: 2.0,
////                        fontWeight: FontWeight.bold),
////                  ),
////                )
////              ],
////            ),
////          ),
////          color: Colors.white,
////        ),
////        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
////        body: CustomScrollView(
////          slivers: <Widget>[
////            SliverAppBar(
////              primary: true,
////              title: Text(
////                "PlantWell",
////                style: TextStyle(
////                    color: Colors.blue,
////                    fontWeight: FontWeight.bold,
////                    fontSize: 25.0),
////              ),
////              pinned: true,
////              centerTitle: false,
////              actions: <Widget>[
////                PopupMenuButton(
////                  color: Colors.yellow[100],
////                  initialValue: iValue,
////                  onSelected: (String newValue) {
////                    setState(() {
////                      iValue = newValue;
////                      //validation(iValue);
////                    });
////                  },
////                  itemBuilder: (BuildContext context) {
////                    return men.map((String str) {
////                      return PopupMenuItem(
////                        child: Text(str),
////                        value: str,
////                      );
////                    }).toList();
////                  },
////                ),
////              ],
////              actionsIconTheme: IconThemeData(color: Colors.blue, size: 500.0),
////              backgroundColor: Colors.white,
////              flexibleSpace: FlexibleSpaceBar(
////                background: Container(
////                    child: Image.asset(
////                      "images/p3.jpg",
////                      fit: BoxFit.fill,
////                    )),
////              ),
////              expandedHeight: 300.0,
////            ),
////            SliverList(
////                delegate: SliverChildListDelegate([
////                  StreamBuilder(
////
////                      stream: Firestore.instance.collection('create').snapshots(),
////                      builder: (context, snapshot){
////
////                        if(!snapshot.hasData) return const Text('loading....');
////                        return ListView.builder(
////                          itemExtent: 80.0,
////                          itemCount: snapshot.data.documents.length,
////                          itemBuilder: (context, index) =>
////                              _buildListItem(context, snapshot.data.documents[index]),
////
////                        );
////                      }
////
//////// This trailing comma makes auto-formatting nicer for build methods.
//////                  )
////                    //gettingData1()
////                  )]))
////          ],
////        ),
////        drawerEdgeDragWidth: 10.0,
////      ),
////    );
////  }
////
////  void _BottomSheet(context) {
////    showModalBottomSheet(
////        backgroundColor: Colors.blue[100],
////        context: context,
////        builder: (BuildContext bc) {
////          return Container(
////            margin: EdgeInsets.only(bottom: 20.0),
////            child: Row(
////              children: <Widget>[
////                Expanded(
////                  child: FlatButton(
////                      onPressed: () {
////                        Navigator.push(context,
////                            MaterialPageRoute(builder: (context) => create()));
////                      },
////                      child: Column(
////                        mainAxisSize: MainAxisSize.min,
////                        children: <Widget>[
////                          Container(
////                            margin: EdgeInsets.only(top: 20.0),
////                            child: Image.asset(
////                              'images/s5.jpg',
////                              fit: BoxFit.fill,
////                            ),
////                            color: Colors.deepOrangeAccent,
////                          ),
////                          Text("Craete Plant")
////                        ],
////                      )),
////                ),
////                Expanded(
////                  child: FlatButton(
////                      onPressed: () {
////                        Navigator.push(context,
////                            MaterialPageRoute(builder: (context) => search()));
////                      },
////                      child: Column(
////                        mainAxisSize: MainAxisSize.min,
////                        children: <Widget>[
////                          Container(
////                            margin: EdgeInsets.only(top: 12.0),
////                            child: Image.asset(
////                              "images/s3.jpg",
////                              fit: BoxFit.fill,
////                            ),
////                            color: Colors.blue,
////                          ),
////                          Text("Search Plant")
////                        ],
////                      )),
////                ),
////                Expanded(
////                  child: FlatButton(
////                      onPressed: () {
////                        Navigator.push(context,
////                            MaterialPageRoute(builder: (context) => group()));
////                      },
////                      child: Column(
////                        mainAxisSize: MainAxisSize.min,
////                        children: <Widget>[
////                          Container(
////                            margin: EdgeInsets.only(top: 20.0),
////                            child: Image.asset(
////                              'images/s4.jpg',
////                              fit: BoxFit.fill,
////                            ),
////                            color: Colors.lightGreenAccent,
////                          ),
////                          Text(
////                            "Create Group",
////                            style: TextStyle(),
////                          )
////                        ],
////                      )),
////                )
////              ],
////            ),
////          );
////        });
////  }
////
//////  void validation(String str) {
//////    if (iValue == 'Logout') {
//////      Navigator.pushReplacement(
//////          context, MaterialPageRoute(builder: (context) => login()));
//////      iValue = " ";
//////    } else if (iValue == 'Settings') {
//////      Navigator.push(
//////          context, MaterialPageRoute(builder: (context) => settings()));
//////      iValue = " ";
//////    } else if (iValue == 'Rating') {
//////      Navigator.push(
//////          context, MaterialPageRoute(builder: (context) => ratings()));
//////      iValue = " ";
//////    }
//////  }
////
////  void Watering(BuildContext context) {
////    showDialog(
////        context: context,
////        builder: (BuildContext conntext) {
////          return AlertDialog(
////            content: Container(
////              child: Text("Watering to Plants"),
////            ),
////          );
////        });
////  }
//////
////  Widget _buildListItem(BuildContext context, DocumentSnapshot document ){
////    return Container(color: Colors.black26,margin: EdgeInsets.all(10.0),
////      child: ListTile(leading:  Container(child: CircleAvatar(child: Image.network(document['imageUrl'],fit: BoxFit.contain,)),),
////        title: Text(document['Title']),
////
////      ),
////    );
////  }
////}
//
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutterapp1/create.dart';
//import 'package:flutterapp1/Services.dart';
//import 'package:flutterapp1/group.dart';
//import 'package:flutterapp1/search.dart';
//import 'package:flutterapp1/start2.dart';
//
//
//class start1 extends StatefulWidget {
//  @override
//  _start1State createState() => _start1State();
//}
//
//class _start1State extends State<start1> {
//  CrudServices crudServices = CrudServices();
//  QuerySnapshot data;
//  QuerySnapshot data1;
//  var imageUrl;
//  var Title;
//  var Description;
//  var Intervals;
//  var Duration;
//
//  @override
//  void initState() {
//    crudServices.getData1().then((result) {
//      setState(() {
//        data1 = result;
//      });
//    });
//    crudServices.getData().then((result) {
//      setState(() {
//        data = result;
//      });
//    });
//    super.initState();
//  }
//
//  @override
//  String iValue = "hai";
//  var men = ['Settings', 'Logout', 'Rating'];
//
//  Widget build(BuildContext context) {
//    return Material(
//      child: Scaffold(appBar: AppBar(title:Text(
//        "PlantWell",
//        style: TextStyle(
//            color: Colors.blue,
//            fontWeight: FontWeight.bold,
//            fontSize: 25.0),
//      ),actions: <Widget>[PopupMenuButton(
//        color: Colors.yellow[100],
//        initialValue: iValue,
//        onSelected: (String newValue) {
//          setState(() {
//            iValue = newValue;
//            //validation(iValue);
//          });
//        },
//        itemBuilder: (BuildContext context) {
//          return men.map((String str) {
//            return PopupMenuItem(
//              child: Text(str),
//              value: str,
//            );
//          }).toList();
//        },
//      )],),
//        backgroundColor: Colors.greenAccent[100],
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            _BottomSheet(context);
//          },
//          backgroundColor: Colors.deepOrangeAccent,
//          child: Icon(Icons.add),
//        ),
//        bottomNavigationBar: BottomAppBar(
//          child: Container(
//            margin: EdgeInsets.only(right: 20.0),
//            height: 50.0,
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                InkWell(
//                  onTap: () {
//                    Watering(context);
//                  },
//                  child: Icon(
//                    Icons.opacity,
//                    size: 24.0,
//                    color: Colors.blue,
//                  ),
//                ),
//                InkWell(
//                  onTap: () {
//                    Watering(context);
//                  },
//                  child: Text(
//                    " Water",
//                    style: TextStyle(
//                        color: Colors.blue,
//                        letterSpacing: 2.0,
//                        fontWeight: FontWeight.bold),
//                  ),
//                )
//              ],
//            ),
//          ),
//          color: Colors.white,
//        ),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//        body: Column(children: <Widget>[Container(
//            child: Image.asset(
//              "images/p3.jpeg",
//              fit: BoxFit.fill,
//            )),StreamBuilder(
//
//            stream: Firestore.instance.collection('create').snapshots(),
//            builder: (context, snapshot){
//
//              if(!snapshot.hasData) return const Text('loading....');
//              return ListView.builder(
//                itemExtent: 80.0,
//                itemCount: snapshot.data.documents.length,
//                itemBuilder: (context, index) =>
//                    _buildListItem(context, snapshot.data.documents[index]),
//
//              );
//            }
//
////// This trailing comma makes auto-formatting nicer for build methods.
////                  )
//          //gettingData1()
//        )],),
//        drawerEdgeDragWidth: 10.0,
//      ),
//    );
//  }
//
//  void _BottomSheet(context) {
//    showModalBottomSheet(
//        backgroundColor: Colors.blue[100],
//        context: context,
//        builder: (BuildContext bc) {
//          return Container(
//            margin: EdgeInsets.only(bottom: 20.0),
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  child: FlatButton(
//                      onPressed: () {
//                        Navigator.push(context,
//                            MaterialPageRoute(builder: (context) => create()));
//                      },
//                      child: Column(
//                        mainAxisSize: MainAxisSize.min,
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(top: 20.0),
//                            child: Image.asset(
//                              'images/s5.jpg',
//                              fit: BoxFit.fill,
//                            ),
//                            color: Colors.deepOrangeAccent,
//                          ),
//                          Text("Craete Plant")
//                        ],
//                      )),
//                ),
//                Expanded(
//                  child: FlatButton(
//                      onPressed: () {
//                        Navigator.push(context,
//                            MaterialPageRoute(builder: (context) => search()));
//                      },
//                      child: Column(
//                        mainAxisSize: MainAxisSize.min,
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(top: 12.0),
//                            child: Image.asset(
//                              "images/s3.jpg",
//                              fit: BoxFit.fill,
//                            ),
//                            color: Colors.blue,
//                          ),
//                          Text("Search Plant")
//                        ],
//                      )),
//                ),
//                Expanded(
//                  child: FlatButton(
//                      onPressed: () {
//                        Navigator.push(context,
//                            MaterialPageRoute(builder: (context) => group()));
//                      },
//                      child: Column(
//                        mainAxisSize: MainAxisSize.min,
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(top: 20.0),
//                            child: Image.asset(
//                              'images/s4.jpg',
//                              fit: BoxFit.fill,
//                            ),
//                            color: Colors.lightGreenAccent,
//                          ),
//                          Text(
//                            "Create Group",
//                            style: TextStyle(),
//                          )
//                        ],
//                      )),
//                )
//              ],
//            ),
//          );
//        });
//  }
//
////  void validation(String str) {
////    if (iValue == 'Logout') {
////      Navigator.pushReplacement(
////          context, MaterialPageRoute(builder: (context) => login()));
////      iValue = " ";
////    } else if (iValue == 'Settings') {
////      Navigator.push(
////          context, MaterialPageRoute(builder: (context) => settings()));
////      iValue = " ";
////    } else if (iValue == 'Rating') {
////      Navigator.push(
////          context, MaterialPageRoute(builder: (context) => ratings()));
////      iValue = " ";
////    }
////  }
//
//  void Watering(BuildContext context) {
//    showDialog(
//        context: context,
//        builder: (BuildContext conntext) {
//          return AlertDialog(
//            content: Container(
//              child: Text("Watering to Plants"),
//            ),
//          );
//        });
//  }
////
//  Widget _buildListItem(BuildContext context, DocumentSnapshot document ){
//    return Container(color: Colors.black26,margin: EdgeInsets.all(10.0),
//      child: ListTile(leading:  Container(child: CircleAvatar(child: Image.network(document['imageUrl'],fit: BoxFit.contain,)),),
//        title: Text(document['Title']),
//
//      ),
//    );
//  }
//}
