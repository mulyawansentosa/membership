import 'package:flutter/material.dart';

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