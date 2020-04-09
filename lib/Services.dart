
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp1/user.dart';

class CrudServices {
  Future<void> addData(create) {
    Firestore.instance.collection('create').add(create).catchError((e) {
      print(e);
    });
  }

  Future<void> addData1(group) {
    Firestore.instance.collection('create').add(group).catchError((e) {
      print(e);
    });
  }

  Future getData() async {
    return await Firestore.instance.collection('create').snapshots();
  }

  Future getData1() async {
    return await Firestore.instance.collection('create').getDocuments();
  }

  User _userFromFireBaseUse(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFireBaseUse(user);
    } catch (e) {
      print(e);
    }

  }

  deleteData(docId) {
    Firestore.instance
        .collection('create')
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
  updateData(selectedDoc,newValues)
  {
    Firestore.instance.collection('create').document(selectedDoc).updateData(newValues).catchError((e){print(e);});
  }

  Future signWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFireBaseUse(user);
    } catch (e) {
      print(e);
    }
  }

  Future sigOut() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
