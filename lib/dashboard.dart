import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './division.dart';
import './department.dart';
import './member.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _DashboardState createState() => _DashboardState(user: user);
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Division(),
    Department(),
    Member(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final FirebaseUser user;
  _DashboardState({Key key, @required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
                FirebaseAuth.instance.sendPasswordResetEmail();
              },
            ),
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Division'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Department'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('Member'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
