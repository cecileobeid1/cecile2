import 'dart:convert';

import 'package:finalproject/RequestAccount.dart';
import 'package:finalproject/singleEvent.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finalproject/container_design.dart';
import 'package:finalproject/ForgotPassword.dart';
import 'package:flutter/services.dart';
import 'package:requests/requests.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: new RosolMainPage(),
  ));
}

class RosolMainPage extends StatefulWidget {
  @override
  _RosolMainPageState createState() => _RosolMainPageState();
}

class _RosolMainPageState extends State<RosolMainPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String username, password;

  submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        await _auth.signInWithEmailAndPassword(
          email: username,
          password: password,            
        ).then((result)=>(){
            Navigator.push(
              context,
                MaterialPageRoute(
                 builder: (context) =>
                 requestAccount()),
             );
        });
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
      //   AuthService. login(username,password);
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

    return StreamBuilder<FirebaseUser>(
      stream: _auth.onAuthStateChanged,
      initialData: null,
      builder: (context, snapshot) {
        bool isLoggedIn = snapshot.hasData && snapshot.data != null;
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
                              image: new AssetImage(
                                  'assets/images/rosol - Copy.jpg'),
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
                  isLoggedIn
                      ? _LoggedInApp()
                      : Form(
                          key: _formKey,
                          child: new Container(
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: new AssetImage(
                                        'assets/images/rosol - Copy.jpg'),
                                    fit: BoxFit.cover)),
                            child: Column(
                              children: <Widget>[
                                new Container(
                                  child: new TextFormField(
                                    decoration: new InputDecoration(
                                        labelText: 'Username'),
                                    validator: (input) => input.length < 6
                                        ? 'Must be aat least 6 characters'
                                        : null,
                                    onSaved: (input) => username = input,
                                  ),
                                ),
                                new Container(
                                  child: new TextFormField(
                                    decoration: new InputDecoration(
                                        labelText: 'Password'),
                                    validator: (input) => input.length < 6
                                        ? 'Must be aat least 6 characters'
                                        : null,
                                    obscureText: true,
                                    onSaved: (input) => password = input,
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
                                                builder: (context) =>
                                                    requestAccount()),
                                          );
                                        },
                                      ),
                                      // new FlatButton(
                                      //   child: new Text('Forgot Password?'),
                                      //   onPressed: () {
                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) =>
                                      //               forgotPassword()),
                                      //     );
                                      //   },
                                      // )
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
                            image: new AssetImage(
                                'assets/images/rosol - Copy.jpg'),
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
                                            color:
                                                Colors.black.withOpacity(0.7)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                        'Facebook Page - Rosol Yasou3 W Mariam'),
                                  ),
                                  ListTile(
                                    title: Text(
                                        'Instagram - Rosol Yasou3 W Mariam'),
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
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoggedInApp extends StatefulWidget {
  @override
  __LoggedInAppState createState() => __LoggedInAppState();
}

class __LoggedInAppState extends State<_LoggedInApp> {

  List<Widget> mchildren = [];   
  // Future object to fetch response from API (Response in future)
  Future<List<dynamic>> fData;
  List<String> data = [];
  bool showOne = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
         home: Scaffold(
           
           body: new Column(
             children: [
               new Padding(
                 padding: EdgeInsets.all(8.0),
                 child: new InkWell(
                   onTap: () {
                     /* Navigator.push(context, MaterialPageRoute(builder: (context) => openPageContainerContact()),
               );*/
                   },
                   child: new Container(
                     height: 450.0,
                     width: 450.0,
                     //color: Colors.red,
                     child:FutureBuilder<List<dynamic>>(
                       future: fData, 
                       builder: (context, snapshot) {
                           switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    {
                      // here we are showing loading view in waiting state.
                      return loadingView();
                    }
                  case ConnectionState.active:
                    {
                      break;
                    }
                             case ConnectionState.done:
                             
                              if(showOne){
                               
                             }
                               // TODO: Handle this case.
                               return   ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  dynamic element =  snapshot.data[index];
                                  return generateColum(element,context);
                                });
                               
                             case ConnectionState.none:
                               // TODO: Handle this case.
                               break;
                           }
                      
                                }),
                   ),
                 ),
               ),
               new Padding(
                 padding: EdgeInsets.all(8.0),
                 child: new InkWell(
                   onTap: () {
                     /*Navigator.push(context, MaterialPageRoute(builder: (context) => openPageContainerLocate()),
               );*/
                   },
                   child: new InkWell(
                     child: Row(
                       children: [
                         RichText(
                           text: TextSpan(
                             text: 'Sign Out',
                             style: new TextStyle(
                               fontSize: 20.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.black.withOpacity(0.7),
                             ),
                           ),
                         ),
                         Icon(
                           Icons.power_settings_new,
                           color: Colors.blue,
                           size: 36.0,
                         ),
                       ],
                     ),
                     onTap: () {
                       FirebaseAuth.instance.signOut();
                      //  Navigator.push(
                      //    context,
                      //    MaterialPageRoute(builder: (context) => RosolMainPage()),
                      //  );
                     },
                   ),
                 ),
               ),
             ],
           ),
         ),
       );
  }

  
  @override
  void initState() {
 
    setState(() {

    fData = getData();
 
    });    
    super.initState();
  }




  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Center(
  //       child: FlatButton(
  //         child: Text('Logout'),
  //         onPressed: () {
  //           FirebaseAuth.instance.signOut();
  //         },
  //       ),
  //     ),
  //   );
  // }
}
 // View to empty data message
  Widget noDataView(String msg) => Center(
        child: Text(
          msg,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      );

    
  // Progress indicator widget to show loading.
  Widget loadingView() => Center(
        child: CircularProgressIndicator(
          //backgroundColor: Colors.red,
        ),
      );

 Widget generateColum(dynamic item,context) => Card(
  child: new InkWell(
    onTap: () {
      print("tapped");
       Navigator.push(
context,
     MaterialPageRoute(
     builder: (context) => singleEvent(key:new Key(item['id'])),)    
  );

    },
     child: ListTile(
      leading: Icon(Icons.photo_album),
      title: Text(item['name']),
    ),
  ),
);

Widget showLoading(){
 return new Center(
        child: CircularProgressIndicator(
          //backgroundColor: Colors.red,
        ),
      );
}

Future<List<dynamic>> getData() async {
   var url = "https://rosol-a4d92.firebaseio.com/events.json";
  var r = await Requests.get(url);
r.raiseForStatus();

     print('TEST inside get data');
String body = r.content();

    print("after call data");
var decoded = json.decode(body);

    print("before create data");
    List<dynamic> data = [];
    print("after create data");
    print(decoded);
    // for(int i = 0 ; i< decoded.length;i++){
    //  data.add(decoded[i]['name']);
    // }
    
    
decoded.forEach((key,value){
  print(key);
  value['id'] = key;
  data.add(value);
});

    // forEach(var key in decoded.Keys){
    //   print(key);
    //   print(decoded[key]);
    //   // data.add(dec['name']);
    //   // check if the value is not null or empty.
      
    //       var value = decoded[key]['name'];
    //       data.add(value);
    //       // code to do something with 
      
    // }

    print(data);
    print(data.length);
    //  data.add(decoded[0]['name']);
    //  data.add(decoded[1]['name']);
    //  data.add(decoded[2]['name']);
return data;
}
