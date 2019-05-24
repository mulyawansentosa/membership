import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:membership/signup.dart';
import './reset.dart';
import './dashboard.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Login'),
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(5),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                  },
                  onSaved: (input) {
                    _email = input;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Password tidak boleh kosong';
                    } else if (input.length < 6) {
                      return 'Password tidak boleh kurang dari 6';
                    }
                  },
                  onSaved: (input) {
                    _password = input;
                  },
                  decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  obscureText: true,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(5),
                          color: Colors.lightBlue,
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: SignIn,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(5),
                          color: Colors.lightBlue,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(5),
                          color: Colors.lightBlue,
                          child: Text(
                            'Reset',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Reset()));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void SignIn() async {
    final _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Dashboard(user: user)));
      } catch (e) {
        Toast.show(e.message, context,
            duration: 2, gravity: Toast.CENTER, backgroundColor: Colors.orange);
      }
    }
  }
}
