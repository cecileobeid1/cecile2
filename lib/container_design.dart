import 'package:flutter/material.dart';
import 'package:link/link.dart';

class openPageContainerLocate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage('assets/images/rosol - Copy.jpg'),
              fit: BoxFit.cover)),
      child: RichText(
        text: TextSpan(
          text: 'Who We Are ',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: 'Conta',
                style: new TextStyle(fontSize: 40.0, color: Color(0x1C1C1A))),
            TextSpan(
                text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' world!'),
          ],
        ),
      ),
    );
  }
}

class openPageContainerContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xdbcd2e),
          title: Text('Contact Us'),
        ),
        body: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('assets/images/rosol - Copy.jpg'),
                    fit: BoxFit.cover)),
            child: new Column(
              children: <Widget>[
                new InkWell(
                  child: new Container(
                    child: new Link(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Rosol Yasou3 W Mariam - Facebook',
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                      url: 'https://www.facebook.com',
                      /*Text('Facebook'),
                              url:'https://www.facebook.com',*/
                      //onTap: () => launch('https://facebook.com/')
                      //onTap: _launchFacebookURL(),
                    ),
                  ),
                ),
                new InkWell(
                  child: new Container(
                    child: new Link(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '@RosolYasou3WMariam - Instagram',
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                      url: 'https://www.instagram.com',
                      /*Text('Facebook'),
                              url:'https://www.facebook.com',*/
                      //onTap: () => launch('https://facebook.com/')
                      //onTap: _launchFacebookURL(),
                    ),
                  ),
                ),
                /*new Row(
                        children: <Widget> [
                        icon: Icon(
                        Icons.person,
                        color: Colors.white,
                        ),*/
                new InkWell(
                  child: new Container(
                    child: new Link(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Our Lady of Deliverance - Ain Al Rihane',
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                      url:
                      'https://www.google.com/maps/place/Notre+Dame+de+la+Delivrance/@33.9543671,35.6417992,15.65z/data=!4m5!3m4!1s0x151f3f542690364d:0xa05b29e5c8c52c07!8m2!3d33.9566207!4d35.6481081',
                      /*Text('Facebook'),
                              url:'https://www.facebook.com',*/
                      //onTap: () => launch('https://facebook.com/')
                      //onTap: _launchFacebookURL(),
                    ),
                  ),
                ),
                /*new InkWell(
                    child: new Link(
                      child: Text('Saydet Al Khalas'),
                      url:'https://www.google.com/maps/place/Notre+Dame+de+la+Delivrance/@33.9543671,35.6417992,15.65z/data=!4m5!3m4!1s0x151f3f542690364d:0xa05b29e5c8c52c07!8m2!3d33.9566207!4d35.6481081',
                      //onTap: () => launch('https://facebook.com/')
                      //onTap: _launchFacebookURL(),
                    )
                ),*/
                /* const Expanded(
                                    child: Text('01111111'),
                                    ),*/
                new InkWell(
                  child: new Container(
                    child: new Link(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '+96176434135 - Contact',
                          style: new TextStyle(
                              fontSize: 30.0,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                      url: 'https://www.facebook.com',
                      /*Text('Facebook'),
                              url:'https://www.facebook.com',*/
                      //onTap: () => launch('https://facebook.com/')
                      //onTap: _launchFacebookURL(),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
/*new GestureDetector(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()),
                );},
                child:
                new Container(
                  child: new Column(
                    children: <Widget>
                    [
                      new InkWell(
                          child: new Link(
                            child: Text('Facebook'),
                            url:'https://www.facebook.com',
                            //onTap: () => launch('https://facebook.com/')
                            //onTap: _launchFacebookURL(),
                          )
                      ),
                      new InkWell(
                          child: new Link(
                            child: Text('twitter'),
                            url:'https://www.twitter.com',
                            //onTap: () => launch('https://facebook.com/')
                            //onTap: _launchFacebookURL(),
                          )
                      ),
                      new Row(
                        children: <Widget> [
                          */ /* icon: Icon(
                                   Icons.person,
                                   color: Colors.white,
                                 ),*/ /*
                          const Expanded(
                            child: Text('01111111'),
                          ),
                        ],
                      )
                      */ /* new InkWell(
                                  child: new Text('Call Us'),
                                  //onTap: () => launch('https://google.com/')
                              ),
*/ /*
                    ],
                  ),
                ),
              ),
*/