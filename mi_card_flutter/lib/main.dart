import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/module-6.jpg'),
              ),
              Text(
                'Dhruv Arora',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'FLUTTER LEARNER',
                style: TextStyle(
                  fontFamily: 'SourceSansProExtraLight',
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+91 1234567890',
                    style: TextStyle(
                      fontFamily: 'SourceSansProExtraLight',
                      letterSpacing: 1.5,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                padding: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'hello@email.com',
                    style: TextStyle(
                      fontFamily: 'SourceSansProExtraLight',
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      letterSpacing: 1.5,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ------------ NOTES -------------------
// Shortcuts :
// alt + enter on a widget for some properties
// ctrl + Q on a widget for quick docs

// stless : stateless widget
// stfull : statefull widget
// safeArea : to place the elements below notch and inside the screen
// in margin : EdgeInsets is used
// EdgeInsets.all(10.0)
// EdgeInsets.symmetry(10.0)
// EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)
// EdgeInsets.only(left: 10.0)

// In column() or row() ... before children
// mainAxisSize: MainAxisSize.min
// verticalDirection: VerticalDirection.up,
// verticalDirection: VerticalDirection.down,
// mainAxisAlignment: MainAxisAlignment.up
// mainAxisAlignment: MainAxisAlignment.down
// mainAxisAlignment: MainAxisAlignment.center
// mainAxisAlignment: MainAxisAlignment.spaceEvenly
// mainAxisAlignment: MainAxisAlignment.spaceBetween
// "crossAxisAlignment: CrossAxisAlignment.end" : stretch to the maximum
// add spacing between containers : add "SizedBox(height: 20.0)" between 2 containers

// to shift all containers to right side
// 1. add "crossAxisAlignment: CrossAxisAlignment.end" before children: <Widget>[]
// 2. add an invisible container of infinity width by "width: double.infinity"

// ---------- DEFAULT CODE ------------
//MaterialApp(
//  home: Scaffold(
//    backgroundColor: Colors.teal,
//    body: SafeArea(
//      child: Column(
//        children: <Widget>[
//          CircleAvatar(
//            radius: 50.0,
//            backgroundImage: AssetImage('images/module-6.jpg'),
//          ),
//          Text(
//            'Dhruv Arora',
//            style: TextStyle(
//              fontSize: 40.0,
//              fontFamily: 'Pacifico',
//              color: Colors.white,
//              fontWeight: FontWeight.bold),
//          ),
//          Text(
//            'FLUTTER LEARNER',
//            style: TextStyle(
//              fontFamily: 'SourceSansProExtraLight',
//              fontSize: 20.0,
//              color: Colors.white,
//              fontWeight: FontWeight.bold),
//          ),
//          Container(
//            color: Colors.white,
//            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//            padding: EdgeInsets.all(10.0),
//            child: Row(
//              children: <Widget>[
//                Icon(
//                  Icons.phone,
//                  color: Colors.teal,
//                ),
//                SizedBox(width: 10.0),
//                Text(
//                  '+91 9990528676',
//                  style: TextStyle(
//                    fontFamily: 'SourceSansProExtraLight',
//                    letterSpacing: 1.5,
//                    color: Colors.teal,
//                    fontWeight: FontWeight.bold,
//                    fontSize: 20.0),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: Colors.white,
//            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//            padding: EdgeInsets.all(10.0),
//            child: Row(
//              children: <Widget>[
//                Icon(
//                  Icons.email,
//                  color: Colors.teal,
//                ),
//                SizedBox(width: 10.0),
//                Text(
//                    'dhruvarora91@gmail.com',
//                    style: TextStyle(
//                    fontFamily: 'SourceSansProExtraLight',
//                    fontWeight: FontWeight.bold,
//                    color: Colors.teal,
//                    letterSpacing: 1.5,
//                    fontSize: 20.0,
//                  ),
//                )
//              ],
//            ),
//          )
//        ],
//      ),
//    ),
//  ),
//);
