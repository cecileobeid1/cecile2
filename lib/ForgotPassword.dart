import 'package:flutter/material.dart';

class forgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xdbcd2e),
          title: Text('Password Reset'),
        ),
        body: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage('assets/images/rosol - Copy.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              new Container(
                child: new TextField(
                  decoration: new InputDecoration(labelText: 'Username'),
                ),
              ),
              new Container(
                child: new TextField(
                  decoration: new InputDecoration(
                      labelText: 'Email:example@example.com'),
                  obscureText: true,
                ),
              ),
              new Container(
                child: new Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => passwordResetSent()),
                        );
                      },
                      child: Text('Submit Reset Password'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class passwordResetSent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Account Request'),
      content: Text('You password reset request has been sent successfully'),
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