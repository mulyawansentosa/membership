import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseApp app = FirebaseApp(
  FirebaseOptions(
    googleAppID: '1:687965359186:android:4b45c47de7e9c9ea',
    apiKey: 'AIzaSyA1uJrj1lmVGLvqS2t9V3Y9p8Be8sGMu9I',
    databaseURL: 'https://membership-7c209.firebaseio.com'
  );
);
class Item{
  String key;
  String name;
  String description;
  Item(this.name, this.description);
  Item.from
}

class Division extends StatefulWidget{
  @override
  _DivisionState createState() => _DivisionState();
}

class _DivisionState extends State<Division>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Text('This is Division'),
      ),
    );
  }
}