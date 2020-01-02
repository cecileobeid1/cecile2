//import 'package:projectlast/AddEvent.dart';
import 'dart:io';

import 'package:finalproject/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:requests/requests.dart';
import 'dart:convert';


class singleEvent extends StatefulWidget {
  
  
   singleEvent({Key key}) : super(key: key);
  


  
  @override
  MyEventState createState() => MyEventState();
  
}
 
class MyEventState extends State<singleEvent>{
  List<Widget> mchildren = [];   
  // Future object to fetch response from API (Response in future)
  Future<List<dynamic>> fData;
  List<String> data = [];
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
                               // TODO: Handle this case.
                               dynamic item = snapshot.data[0];
                                return   generateContainer(item, context);
                               
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
    Key Kid = context.widget.key  ;
    print("before kid");
    print(Kid);
    String testId= Kid.toString();
    print(testId);
    String id = testId.substring(3,testId.length-3);
    print(id);
    fData = getData(id);
 
    });    
    super.initState();
  }

}

   




Future<List<dynamic>> getData(String id) async {
   var url = "https://rosol-a4d92.firebaseio.com/events/"+id+".json";
  var r = await Requests.get(url);
r.raiseForStatus();

     print('TEST inside get data');
String body = r.content();
var decoded = json.decode(body);

    List<dynamic> data = [];
    data.add(decoded);
return data;
}

Widget showLoading(){
 return new Center(
        child: CircularProgressIndicator(
          //backgroundColor: Colors.red,
        ),
      );
}

 Widget generateContainer(dynamic item,context) => Card(
  child: new InkWell(
     child:ListView(
     children:<Widget> [ListTile(
      leading: Icon(Icons.photo_album),
      title: Text(item['name']),
    ),
    ListTile(
      title: Text(item['timestamp']),
    ),
    ListTile(
      title: Text(item['description']),
    )
    ]),
  ),
);


//  Navigator.push(
//context,
//      MaterialPageRoute(
//      builder: (context) => loginPagePage()),
//   );
 
  // Progress indicator widget to show loading.
  Widget loadingView() => Center(
        child: CircularProgressIndicator(
         // backgroundColor: Colors.red,
        ),
      );

  // View to empty data message
  Widget noDataView(String msg) => Center(
        child: Text(
          msg,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      );