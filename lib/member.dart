import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Member extends StatefulWidget{
  @override
  _MemberState createState() => _MemberState();
}

class _MemberState extends State<Member>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Text('Members')
      ),
    );
  }
}