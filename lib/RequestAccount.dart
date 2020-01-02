import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class requestAccount extends StatefulWidget {
  @override
  _requestAccountState createState() => _requestAccountState();
}

class _requestAccountState extends State<requestAccount> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String username, password;

  void _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        NavigatorState _nav = Navigator.of(context);
        await _auth.createUserWithEmailAndPassword(
          email: username,
          password: password,
        );
        _nav.pop();
      } on PlatformException catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          },
        );
      }
    } else {
      print('Invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xdbcd2e),
          title: Text('Request Account'),
        ),
        body: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage('assets/images/rosol - Copy.jpg'),
            fit: BoxFit.cover,
          )),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                new Container(
                  child: new TextFormField(
                    onSaved: (String text) {
                      username = text;
                    },
                    decoration: new InputDecoration(
                        labelText: 'Email:example@example.com'),
                  ),
                ),
                new Container(
                  child: new TextFormField(
                    decoration: new InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (String input) {
                      return input.length < 6
                          ? 'Must be aat least 6 characters'
                          : null;
                    },
                    onSaved: (String text) {
                      password = text;
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    _submit();
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class requestSent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Account Request'),
      content: Text(
          'Your request has been successfully sent. Will contact you very soon.'),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
