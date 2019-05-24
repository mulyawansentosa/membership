import 'package:flutter/material.dart';

class Department extends StatefulWidget{
  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Text('Department'),
      ),
    );
  }
}