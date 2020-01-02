import 'package:finalproject/RequestAccount.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'dart:async';
import 'package:link/link.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:finalproject/container_design.dart';
import 'package:finalproject/userLoginPage.dart';
import 'package:finalproject/ForgotPassword.dart';
import 'package:http/http.dart' as http;
import 'package:requests/requests.dart';


void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: new RosolMainPage(),
  ));
}

class RosolMainPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  String username, password;

  submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print(username);
      print(password);
    //   AuthService.login(username,password);
    }
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    /*   _launchFacebookURL() async {
      const facebookurl = 'https://facebook.com';
      if (await canLaunch(facebookurl)) {
        await launch(facebookurl, forceWebView: true);3
      }
      else {
        throw 'Could not launch $facebookurl';
      }
    }*/

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xdbcd2e),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.info_outline)),
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.local_phone)),
              ],
            ),
            title: Text('رسل يسوع ومريم'),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image:
                          new AssetImage('assets/images/rosol - Copy.jpg'),
                          fit: BoxFit.cover)),
                  child: RichText(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      text: 'من هي جماعة رسل يسوع و مريم؟ ',
                      style: new TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.7)),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                            ' رسل يسوع ومريم هي جماعة مصلية على نية الكنيسة والرهبان والراهبات والمكرسين والاكليروس وبخاصة بابا روما، وذلك من أجل ترسيخ وثبات تعاليم الكنيسة في قلوبنا ووصول هذه السفينة إلى بر الأمان. ',
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black.withOpacity(0.7))),
                        TextSpan(
                            text:
                            ' من أهم نشاطات هذه الجماعة مساعدة المحتاج وتقديم أكبر نسبة من الإعانة المادية والمعنوية والروحية.',
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black.withOpacity(0.7))),
                        TextSpan(
                            text: ' ثلاث نقاط هي محور لقاء رسل يسوع ومريم:',
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black.withOpacity(0.7))),
                        TextSpan(
                            text:
                            '-اللقاء الأسبوعي الذي يجري كل ثلاثاء الساعة الثامنة والنصف مساءً، يستهل هذا اللقاء صلاة المسبحة وإعترفات يليه مناقشة بالإنجيل أو سجود للقربان أو شهادة حياة.',
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black.withOpacity(0.7))),
                        TextSpan(
                            text:
                            '-قداس ١٣ من كل شهر (ذكرى ظهورات عذراء فطيمة)',
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black.withOpacity(0.7))),
                        TextSpan(
                            text:
                            '-قداس ٢٣ من كل شهر(تاريخ ميلاد القديس بيو شفيع هذه الجماعة)',
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black.withOpacity(0.7))),
                        TextSpan(
                            text:
                            'يقام هذان القداسان شهرياً في كنيسة سيدة الخلاص - عين الريحاني الساعة الثامنة والنصف مساءً.',
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black.withOpacity(0.7))),
                      ],
                    ),
                  ),
                ),
              ),
              Form(
                key:_formKey,
              child: new Container(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage('assets/images/rosol - Copy.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: new TextFormField(
                        decoration: new InputDecoration(labelText: 'Username'),
                        validator:(input)=>input.length <6?'Must be aat least 6 characters':null,
                        onSaved: (input)=>username = input,
                      ),
                    ),
                    new Container(
                      child: new TextFormField(
                        decoration: new InputDecoration(labelText: 'Password'),
                        validator:(input)=>input.length <6?'Must be aat least 6 characters':null,
                        obscureText: true,
                        onSaved: (input)=>password = input,
                      ),
                    ),
                    new Container(
                      child: new Column(
                        children: <Widget>[
                          RaisedButton(
                            onPressed: submit,
                            //onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => loginPagePage()),
                              // );
                            //},
                            child: Text('Login'),
                          ),
                          FlatButton(
                            child: new Text(
                                'Dont have an account? Tap here to register.'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => requestAccount()),
                              );
                            },
                          ),
                          new FlatButton(
                            child: new Text('Forgot Password?'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => forgotPassword()),
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ),
              
              new Container(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage('assets/images/rosol - Copy.jpg'),
                        fit: BoxFit.cover)),
                child: new Column(
                  children: [
                    new Padding(
                      padding: EdgeInsets.all(8.0),
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    openPageContainerContact()),
                          );
                        },
                        child: new Container(
                          height: 240.0,
                          width: 450.0,
                          decoration: new BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: ListView(
                            children: <Widget>[
                              ListTile(
                                title: RichText(
                                  text: TextSpan(
                                    text: 'Contact Us',
                                    style: new TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.7)),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                    'Facebook Page - Rosol Yasou3 W Mariam'),
                              ),
                              ListTile(
                                title:
                                Text('Instagram - Rosol Yasou3 W Mariam'),
                              ),
                              ListTile(
                                title: Text(
                                    'Mobile Number - Rosol Yasou3 W Mariam'),
                              ),
                              ListTile(
                                title: RichText(
                                    text: TextSpan(
                                        text: ' Click here ',
                                        style: new TextStyle(
                                            fontSize: 5.0,
                                            color: Colors.black
                                                .withOpacity(0.5)))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(8.0),
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    openPageContainerLocate()),
                          );
                        },
                        child: new Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: '  Locate Us',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ),
                            new InkWell(
                              child: new Container(
                                height: 200.0,
                                width: 450.0,
                                decoration: new BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                    image: new DecorationImage(
                                        image: new AssetImage(
                                            'assets/images/location.png'),
                                        fit: BoxFit.cover)),
                                // child: new Link(
                                //   url:
                                //       'https://www.google.com/maps/place/Notre+Dame+de+la+Delivrance/@33.9543671,35.6417992,15.65z/data=!4m5!3m4!1s0x151f3f542690364d:0xa05b29e5c8c52c07!8m2!3d33.9566207!4d35.6481081',
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}