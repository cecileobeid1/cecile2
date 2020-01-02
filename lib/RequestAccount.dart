import 'package:flutter/material.dart';

class requestAccount extends StatelessWidget {
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
                child: new TextField(
                  decoration: new InputDecoration(labelText: 'Address'),
                  obscureText: true,
                ),
              ),
              new Container(
                child: new TextField(
                  decoration: new InputDecoration(labelText: 'Phone Number'),
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
                              builder: (context) => requestSent()),
                        );
                      },
                      child: Text('Register'),
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