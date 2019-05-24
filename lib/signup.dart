import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './login.dart';
import 'package:toast/toast.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _email, _password;
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Signup'),
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(5),
          child: Form(
            key: _registerKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                  },
                  onSaved: (input) {
                    _email = input;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                  },
                  onSaved: (input) {
                    _password = input;
                  },
                  decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(15),
                    color: Colors.lightBlue,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: Register,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Register() async {
    final _registerState = _registerKey.currentState;
    if (_registerState.validate()) {
      _registerState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        user.sendEmailVerification();
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } catch (e) {
        Toast.show(e.message, context,
            duration: 2, gravity: Toast.CENTER, backgroundColor: Colors.orange);
      }
    }
  }
}
