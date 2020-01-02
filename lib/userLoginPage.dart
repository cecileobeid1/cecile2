//import 'package:projectlast/AddEvent.dart';
import 'dart:io';

import 'package:finalproject/main.dart';
import 'package:finalproject/singleEvent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:requests/requests.dart';
import 'dart:convert';



class loginPagePage extends StatefulWidget {
   loginPagePage({Key key, this.title}) : super(key: key);
   final String title;


  
  @override
  MyListState createState() => MyListState();
  
}
 
class MyListState extends State<loginPagePage>{
  List<Widget> mchildren = [];   
  // Future object to fetch response from API (Response in future)
  Future<List<String>> fData;
  List<String> data = [];
  bool showOne = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
         home: Scaffold(
           appBar: AppBar(
             backgroundColor: const Color(0xdbcd2e),
             title: Text('رسل يسوع ومريم'),
           ),
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
                     height: 800.0,
                     width: 450.0,
                     //color: Colors.red,
                     child:FutureBuilder<List<String>>(
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
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  String element =  snapshot.data[index];
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
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => RosolMainPage()),
                       );
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

}

   




Future<List<String>> getData() async {
   var url = "https://jsonplaceholder.typicode.com/posts/";
  var r = await Requests.get(url);
r.raiseForStatus();

     print('TEST inside get data');
String body = r.content();
var decoded = json.decode(body);

    List<String> data = [];
     data.add(decoded[0]['title']);
     data.add(decoded[1]['title']);
     data.add(decoded[2]['title']);
return data;
}

Widget showLoading(){
 return new Center(
        child: CircularProgressIndicator(
          //backgroundColor: Colors.red,
        ),
      );
}

 Widget generateColum(String item,context) => Card(
  child: new InkWell(
    onTap: () {
      print("tapped");
       Navigator.push(
context,
     MaterialPageRoute(
     builder: (context) => singleEvent(),)    
  );

    },
     child: ListTile(
      leading: Icon(Icons.photo_album),
      title: Text(item),
    ),
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
          //backgroundColor: Colors.red,
        ),
      );

  // View to empty data message
  Widget noDataView(String msg) => Center(
        child: Text(
          msg,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      );

      